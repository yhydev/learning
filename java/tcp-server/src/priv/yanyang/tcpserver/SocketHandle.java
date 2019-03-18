package priv.yanyang.tcpserver;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Arrays;
import java.util.Date;

public class SocketHandle extends Thread{

    private Socket socket;
    public static final int SOCKET_BUFFER_SIZE = 102400;
    public static final byte[] SOCKET_BUFFER = new byte[SOCKET_BUFFER_SIZE];
    public static final byte[] RESPONSE = "HTTP/1.1 200 OK\n\nOK".getBytes();


    public SocketHandle(Socket socket){
        this.socket = socket;
    }

    public void run() {
        try {
            InputStream inputStream = socket.getInputStream();
            synchronized (SOCKET_BUFFER){
                int readSize = inputStream.read(SOCKET_BUFFER);
                System.out.println(new Date() + ":");
                System.out.println(new String(Arrays.copyOf(SOCKET_BUFFER, readSize)));
           }

            OutputStream outputStream = socket.getOutputStream();
            outputStream.write(RESPONSE);
            outputStream.flush();
            outputStream.close();
            inputStream.close();
            socket.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }




}
