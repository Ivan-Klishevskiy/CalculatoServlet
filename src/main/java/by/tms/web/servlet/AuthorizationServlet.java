package by.tms.web.servlet;

import by.tms.entity.User;
import by.tms.service.StorageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/authorization")
public class AuthorizationServlet extends HttpServlet {
    private StorageService storage;

    @Override
    public void init() throws ServletException {
        storage=StorageService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/pages/auth.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        storage=StorageService.getInstance();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = storage.findByUsername(username);
        if (user.getUsername() != null){
            if (user.getPassword().equals(password)){
                req.getSession().setAttribute("user", user);
                req.getSession().setAttribute("id", user.getId());
                resp.sendRedirect("/calculator");
                return;
            } else {
                req.setAttribute("message", "Wrong password!");
            }
        } else {
            req.setAttribute("message", "User not found!");
        }
        getServletContext().getRequestDispatcher("/pages/auth.jsp").forward(req, resp);
    }
}

