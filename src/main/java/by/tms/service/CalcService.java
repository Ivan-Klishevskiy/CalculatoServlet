package by.tms.service;

import by.tms.entity.Calculator;

public class CalcService {

    private static final CalcService instance = new CalcService();

    private Calculator calc=new Calculator();

    public static CalcService getInstance(){
        return instance;

    }

    public void setParamCalculator(double first, double second, String sign){
        calc.setFirst(first);
        calc.setSecond(second);
        calc.setSign(sign);
    }

    public double calculation(){
        return calc.calculation();
    }

}

