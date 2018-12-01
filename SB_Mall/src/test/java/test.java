import java.time.LocalDate;

public class test {
 public static void main(String[] args) {
		LocalDate myDate = LocalDate.now();
		String monthName = (myDate.minusMonths(1).getMonth().name()).substring(0, 3);
		System.out.println(monthName);
}
}
