package priv.yanyang.example.concurrent.queue;

import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * 生产者
 */
public class Produce extends Thread {

    /**
     * 食物
     */
    private BlockingQueue<String> foods;
    /**
     * 食物最多个数
     */
    private int MAX_FOODS;

    /**
     * 要生产的数量
     */
    private int PRODUCE_MAX_FOODS;


    public Produce(BlockingQueue<String> foods, int MAX_FOODS, int PRODUCE_MAX_FOODS) {
        this.foods = foods;
        this.MAX_FOODS = MAX_FOODS;
        this.PRODUCE_MAX_FOODS = PRODUCE_MAX_FOODS;
    }

    @Override
    public void run() {
        for (int i = 0; i < PRODUCE_MAX_FOODS; i++){

                //目前食物够了
                while (foods.size() == MAX_FOODS){
                    try {
                        foods.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                //食物不足
                String food = String.valueOf(Math.random());
                System.out.printf("Produce make %s\n", food);
                foods.add(food);
                foods.notifyAll();

            }
        }
    }
}
