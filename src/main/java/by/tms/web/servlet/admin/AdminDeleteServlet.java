package by.tms.web.servlet.admin;

import by.tms.entity.User;
import by.tms.service.StorageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@WebServlet("/admin-delete")
public class AdminDeleteServlet extends HttpServlet {
    private StorageService storage;

    @Override
    public void init() throws ServletException {
        storage = StorageService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getListUsers(req, storage);
        getServletContext().getRequestDispatcher("/pages/admin/admDelete.jsp").forward(req, resp);
    }

    static void getListUsers(HttpServletRequest req, StorageService storage) {
        List<User> listUser = storage.findAllUsers();
        List<String> str = new CopyOnWriteArrayList<>();
        for (User user : listUser) {
            str.add(user.getUsername());
        }
        req.setAttribute("allUsers", str);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (storage.deleteUserByAdmin(req.getParameter("userInput"))) {
            req.setAttribute("message", "user deleted");
        } else {
            req.setAttribute("errorMessage", "user not found");
        }
        getListUsers(req, storage);
        getServletContext().getRequestDispatcher("/pages/admin/admDelete.jsp").forward(req, resp);
    }

    static void getUserList(HttpServletRequest req, StorageService storage) {
        getListUsers(req, storage);
    }
}
