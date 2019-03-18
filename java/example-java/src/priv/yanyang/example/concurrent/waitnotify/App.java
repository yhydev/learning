package priv.yanyang.example.concurrent.waitnotify;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * wait notify 示例
 */
public class App {



    public static void main(String[] args) {
        List<String> foods = new ArrayList<String>();


        Produce produce = new Produce(foods, 10, 100);
        Customer customer = new Customer(foods);
        produce.start();
        customer.start();
  }




}
