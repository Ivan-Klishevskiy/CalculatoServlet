package by.tms.web.servlet.admin;

import by.tms.entity.User;
import by.tms.service.StorageService;
import by.tms.web.servlet.HomeServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin-status")
public class AdminStatusServlet extends HomeServlet {
    private StorageService storage;

    @Override
    public void init() throws ServletException {
        storage = StorageService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminDeleteServlet.getListUsers(req, storage);
        getServletContext().getRequestDispatcher("/pages/admin/admStatus.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = storage.findByUsername(req.getParameter("userInput"));
        if (storage.setAdminUser((int) user.getId())) {
            req.setAttribute("message", "User status update");
        } else {
            req.setAttribute("errorMessage", "User not found");
        }
        AdminDeleteServlet.getListUsers(req, storage);
        getServletContext().getRequestDispatcher("/pages/admin/admStatus.jsp").forward(req, resp);
    }
}
