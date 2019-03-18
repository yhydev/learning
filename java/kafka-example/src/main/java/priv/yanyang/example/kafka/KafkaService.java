package priv.yanyang.example.kafka;

public interface KafkaService {

    void push(String topic, String message);


}
