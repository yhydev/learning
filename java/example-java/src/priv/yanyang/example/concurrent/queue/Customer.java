package priv.yanyang.example.concurrent.queue;

import java.util.List;

/*
 * 顾客类
 */
public class Customer extends Thread{
    /**
     * 食物
     */
    private List<String> foods;

    public Customer(List<String> foods) {
        this.foods = foods;
    }

    @Override
    public void run() {
        while (true){

            synchronized (foods){

                //是否有食物可以吃
                if (foods.isEmpty()){
                    try {
                        foods.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                //有食物，开吃
                String food = foods.remove(foods.size() - 1);
                System.out.format("customer eat %s\n", food);
                foods.notifyAll();
            }
        }
    }
}
