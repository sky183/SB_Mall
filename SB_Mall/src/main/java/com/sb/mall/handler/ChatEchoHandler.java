package com.sb.mall.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatEchoHandler extends TextWebSocketHandler {

	
	private Logger logger = LoggerFactory.getLogger(ChatEchoHandler.class);
	
	private List<WebSocketSession> connectedUsers;
	
	// 서버에 연결한 사용자들 저장
	public ChatEchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	
	// 접속 관련 이벤트메서드
	// @param WebSocketSession 접속한 사용자
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub

		logger.info(session.getId() + "님이 접속하셨습니다.");
		logger.info("연결한 IP : " + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
		
	}

	
	// 2가지 이벤트 처리
	// 1. Send : 클라이언트가 서버에게 메시지 보냄
	// 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메시지 보냄
	// @param WebSocketSession 메시지를 보낸 클라이언트
	// @param TextMessage 메시지의 내용
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		
		// Payload = 사용자가 보낸 메시지
		logger.info(session.getId() + "님이 메시지를 전송하셨습니다." + message.getPayload());
		
		for (WebSocketSession webSocketSession : connectedUsers) {
			// 메시지를 보낸 사용자는 받지 않기 위한 조건문
			
			if ( !session.getId().equals(webSocketSession) ) {
				webSocketSession.sendMessage( new TextMessage(session.getId() + "" + message.getPayload()) );
			}
			
		}
		
	}
	
	// 클라이언트가 서버와 연결 종료
	// @param WebSocketSession 연결을 끊은 클라이언트
	// @param CloseStatus 연결 상태 (확인 필요)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		
		logger.info(session.getId() + "님이 접속을 종료하셨습니다.");
		connectedUsers.remove(session);
		
	}
	
	
	
	
}
