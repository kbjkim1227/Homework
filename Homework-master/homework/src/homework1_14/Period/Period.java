package homework1_14.Period;

public class Period {
	private Day from;
	private Day to;
	
	// --- 생성자 --- //
	public Period(Day from, Day to) {
		this.from = new Day(from);
		this.to   = new Day(to);
	}
	
	public Day getFrom() { return new Day(from); }
	public Day getTo() { return new Day(to); }
	
	public String toString() {
		return "{" +from+ "~" +to+ "}";
	}
	
}