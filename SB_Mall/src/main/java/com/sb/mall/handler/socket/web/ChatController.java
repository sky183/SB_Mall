package com.sb.mall.handler.socket.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chat")
	public String viewChattingPage() {
		return "chatting/chat";
	}
	
}
