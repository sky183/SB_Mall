package com.sb.mall;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		
		SimpleDateFormat Time = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat getHour = new SimpleDateFormat("HH");
		SimpleDateFormat getMin = new SimpleDateFormat("mm");
		SimpleDateFormat getSec = new SimpleDateFormat("ss");
		
		System.out.println("Time : "+ Time.format(date));
		
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
		
		
		
		model.addAttribute("hour", getHour.format(date) );
		model.addAttribute("min", getMin.format(date) );
		model.addAttribute("sec", getSec.format(date) );
		
		return "home";
	}
	
}
