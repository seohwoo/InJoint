package com.injoit.mvc.data;

import java.io.FileWriter;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;

import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

public class Chatting extends DefaultEmbeddableVerticle {

	
	private SocketIOServer io = null;

    @Override
    public void start(Vertx vertx) {
        HttpServer server = vertx.createHttpServer();    // 서버 생성
        io = new DefaultSocketIOServer(vertx, server);

        io.sockets().onConnection(socket -> {
            socket.on("joinRoom", roomJoinEvent -> {
                String roomname = roomJoinEvent.getString("roomname");
                String chatno = roomJoinEvent.getString("chatno");
                String roomIdentifier = roomname+"_"+chatno;
                socket.join(roomIdentifier);
                io.sockets().in(roomIdentifier).emit("join", roomJoinEvent);
            });
            
            socket.on("chatMsg", chatMsgEvent -> {
                String msg = chatMsgEvent.getString("msg");
                String roomname = chatMsgEvent.getString("roomname");
                String chatno = chatMsgEvent.getString("chatno");
                String roomIdentifier = roomname+"_"+chatno;
                createChatFile(roomIdentifier, msg);
                io.sockets().in(roomIdentifier).emit("response", chatMsgEvent);
            });
            
            socket.on("outRoom", roomOutEvent -> {
            	String roomname = roomOutEvent.getString("roomname");
                String chatno = roomOutEvent.getString("chatno");
                String roomIdentifier = roomname+"_"+chatno;
            	io.sockets().in(roomIdentifier).emit("out", roomOutEvent);
            	socket.leave(roomIdentifier);
            });

        });

        server.listen(9898);
    }

    private void createChatFile(String roomIdentifier, String msg) {
        String filename = FileRoot.getFilepath() + "\\" + roomIdentifier + ".txt";
        FileWriter writer = null;
        try {
            writer = new FileWriter(filename, true);
            writer.write(msg);
            writer.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
}
