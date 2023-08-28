package feature.bid.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

import static core.util.Constants.GSON;

@WebServlet("/test")
public class TestController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private final Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");

//        JsonObject jsonResponse = new JsonObject();
        System.out.println("111");
        if("closed".equals(message)){
            System.out.println("moveOn");
        }
//        if ("success".equals(success) && "moveon".equals(moveOn)) {
//            // 執行您的操作，例如存儲最高出價者的資料到 Redis 資料庫
//            System.out.println("Received success and moveon parameters");
//
//            jsonResponse.addProperty("message", "Request received successfully");
//            resp.setContentType("application/json");
//            resp.getWriter().write(gson.toJson(jsonResponse));
//        } else {
//            System.out.println("222");
//            jsonResponse.addProperty("error", "Invalid parameters");
//            resp.setContentType("application/json");
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            resp.getWriter().write(gson.toJson(jsonResponse));
//        }
    }


}
