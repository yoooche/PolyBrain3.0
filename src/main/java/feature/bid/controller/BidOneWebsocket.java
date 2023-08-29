package feature.bid.controller;

import com.google.gson.JsonObject;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import static core.util.Constants.GSON;

@ServerEndpoint("/BidOnePage/{memName}")
public class BidOneWebsocket {
    private static final Set<Session> bidders = Collections.synchronizedSet(new HashSet<>());
    Jedis jedis = new Jedis("localhost", 6379);

    @OnOpen
    public void onOpen(@PathParam("memName") String memName, Session memSession) throws IOException {
        bidders.add(memSession);
        String text = String.format("Session ID = %s, connected; memName = %s", memSession.getId(), memName);
        System.out.println(text);

        // 測試剛進入競標頁面的使用者也可以看到先前的出價紀錄
        Set<Tuple> allRecords = jedis.zrangeWithScores("1", 0, -1);
        for(Tuple record : allRecords){
            String bidder = record.getElement();
            Integer biddingRange = (int)record.getScore();
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("bidder", bidder);
            jsonObject.addProperty("biddingRange", biddingRange);
            memSession.getBasicRemote().sendText(jsonObject.toString());
        }
    }
    @OnMessage
    public void onMessage(Session memSession, String message) {
        for (Session session : bidders) {
            if (session.isOpen())
                session.getAsyncRemote().sendText(message);
        }
        JsonObject jsonObject = GSON.fromJson(message, JsonObject.class);
        String bidder = jsonObject.get("bidder").getAsString();
        Integer biddingRange = jsonObject.get("biddingRange").getAsInt();
//        System.out.println("Message received:" + message);
        jedis.zadd("1", biddingRange, bidder); // key值不能寫死
    }
    @OnClose
    public void onClose(Session memSession, CloseReason reason) {
        bidders.remove(memSession);
        String text = String.format("Session ID = %s, disconnected; close code = %d; reason phrase = %s",
                memSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
        System.out.println(text);
    }
    @OnError
    public void onError(Session memSession, Throwable e) {
        System.out.println("Error" + e.toString());
    }

}
