package com.yanyangpapa.java8.lambda;

public class Lambda {


    public static void main(String[] args) {

        MathOperation addition = (int a, int b) -> a + b;

        MathOperation mathOperation = (int a,int b) -> a + b;


        System.out.println("mathOperation = " + mathOperation.operation(10,10));



    }



    interface MathOperation{
        int operation(int a,int b);

        //int operation2(int a,int b);


    }



}
