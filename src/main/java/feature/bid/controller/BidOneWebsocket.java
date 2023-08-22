package feature.bid.controller;

import redis.clients.jedis.Jedis;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/BidOnePage/{memName}")
public class BidOneWebsocket {
    private static final Set<Session> bidders = Collections.synchronizedSet(new HashSet<>());
    private static Jedis jedis = new Jedis("localhost", 6379);

    @OnOpen
    public void onOpen(@PathParam("memName") String memName, Session memSession) throws IOException {
        bidders.add(memSession);
        String text = String.format("Session ID = %s, connected; memName = %s", memSession.getId(), memName);
        System.out.println(text);
    }
    @OnMessage
    public void onMessage(Session memSession, String message) {
        for (Session session : bidders) {
            if (session.isOpen())
                session.getAsyncRemote().sendText(message);
        }
        System.out.println("Message received:" + message);
        jedis.select(1);
        jedis.set("bidEvent1", message);
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
