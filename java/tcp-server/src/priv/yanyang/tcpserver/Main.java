package priv.yanyang.tcpserver;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

public class Main {




    public static void main(String[] args) throws IOException {




        if (false) {
            System.out.println(Runtime.getRuntime().maxMemory());
            return;
        }

        int port;
        if(args.length == 0) {
            return;
        }

        port = Integer.valueOf(args[0]);
        ServerSocket ssocket = new ServerSocket(port);
        System.out.println("listen Port " + port);

        while (true) {
            Socket socket = ssocket.accept();
            new SocketHandle(socket).start();
        }
    }
}
