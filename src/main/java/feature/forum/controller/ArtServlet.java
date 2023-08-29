package web.forum.controller;

import web.forum.service.ArtService;
import web.forum.vo.ArtVo;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@MultipartConfig(fileSizeThreshold = 0 * 1024 * 1024, maxFileSize = 1 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class ArtServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
        String action =req.getParameter("action");

        if("getOne_For_Update".equals(action)){
            Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
            req.setAttribute("errorMsgs",errorMsgs);

            Integer artNo = Integer.valueOf(req.getParameter("artNo"));

            ArtService ArtSvc =new ArtService();
            ArtVo artVo =ArtSvc.getOneArt(artNo);



//           String param = "?artNo=" + artVo.getArtNo()+
//                          "&memNo="+artVo.getMemNo()+
//                          "&artTitle="+artVo.getArtTitle()+
//                          "&artCon="+artVo.getArtCon()+
//                          "&artTime="+artVo.getArtTime()+
//                          "&artState="+artVo.getArtState()+
//                          "&artGame="+artVo.getArtGame();
            req.setAttribute("artVo", artVo);
            String url ="/forum/mainpage/Update_Art_input.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
        if("update".equals(action)){
            Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
            req.setAttribute("errorMsgs",errorMsgs);

            System.out.println("----------------------------");

            Integer artNo = Integer.valueOf(req.getParameter("artNo"));
            Integer memNo = Integer.valueOf(req.getParameter("memNo"));


            String artTitle =req.getParameter("artTitle");
            if(artTitle == null || artTitle.trim().length() == 0){
                errorMsgs.put(artTitle,"貼文主題請勿空白");
            }

            String artCon =req.getParameter("artCon");
            if(artCon == null || artCon.trim().length() == 0){
                errorMsgs.put(artCon,"貼文內容請勿空白");
            }

            if (!errorMsgs.isEmpty()){
                errorMsgs.put("Exception","修改資料失敗:-------");
                RequestDispatcher failureView =req
                        .getRequestDispatcher("/forum/mainpage/Update_Art_input.jsp");
                failureView.forward(req,res);
                return;
            }

            Date artTime = java.sql.Date.valueOf(req.getParameter("artTime"));
            Byte artState = Byte.valueOf(req.getParameter("artState"));
            Integer artGame = Integer.valueOf(req.getParameter("artGame"));

            ArtService artSvc =new ArtService();
            ArtVo artVo =artSvc.updateArt(artNo,memNo,artTitle,artCon,artTime,artState,artGame);

            req.setAttribute("success","- (修改成功)");
            req.setAttribute("ArtVo",artVo);
            String url ="/forum/mainpage/Update_Art_input.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req,res);


        }

        if ("insert".equals(action)){

            Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
            req.setAttribute("errorMsgs",errorMsgs);



            String artTitle =req.getParameter("artTitle");
            if(artTitle == null || artTitle.trim().length() == 0){
                errorMsgs.put(artTitle,"貼文主題請勿空白");
            }

            String artCon =req.getParameter("artCon");
            if(artCon == null || artCon.trim().length() == 0){
                errorMsgs.put(artCon,"貼文內容請勿空白");
            }

            ArtService artSvc =new ArtService();
            artSvc.addArt(2,artTitle,artCon,null,Byte.valueOf("1"),0);

            req.setAttribute("success","-(新增成功)");
            String url ="/forum/mainpage/Testpage.jap";
            RequestDispatcher successView =req.getRequestDispatcher(url);
            successView.forward(req,res);

        }









    }

}