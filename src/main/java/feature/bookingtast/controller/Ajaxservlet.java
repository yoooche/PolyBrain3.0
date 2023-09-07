package feature.bookingtast.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/bookingtast/Ajaxservlet")
@MultipartConfig
public class Ajaxservlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws
            ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws
            ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
    }









    }
