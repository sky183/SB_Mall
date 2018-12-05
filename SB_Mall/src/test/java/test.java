import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.junit.Test;

public class test {
	public static void main(String[] args) {
		LocalDate myDate = LocalDate.now();
		String monthName = (myDate.minusMonths(1).getMonth().name()).substring(0, 3);
		System.out.println(monthName);
		System.out.println(myDate);
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일");
		String nowString = myDate.format(dateTimeFormatter);   // 결과 : 2016년 4월 2일 오전 1시 4분
		
		System.out.println(nowString);
		
		
	}
	
	@Test
	public void name() {
		float a = (float)1 * 2;
		System.out.println(a);
	}
}
