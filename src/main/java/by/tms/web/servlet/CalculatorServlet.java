package by.tms.web.servlet;

import by.tms.service.CalcService;
import by.tms.service.StorageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/calculator")
public class CalculatorServlet extends HttpServlet {

    private CalcService calcService;
    private StorageService storage;

    @Override
    public void init() throws ServletException {
        calcService = CalcService.getInstance();
        storage=StorageService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/pages/calc.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double first = Double.parseDouble(req.getParameter("firstNumber"));
        double second = Double.parseDouble(req.getParameter("secondNumber"));
        String sign = req.getParameter("sign");

        calcService.setParamCalculator(first, second, sign);
        double result = calcService.calculation();

        req.setAttribute("result", result);
        storage.saveOperation(storage.getTempId(), first, second, sign, result);

        List<String> str = storage.findOperationsById((int) storage.getTempId());
        req.setAttribute("history", str);
        req.getRequestDispatcher("/pages/calc.jsp").forward(req, resp);
    }
}
