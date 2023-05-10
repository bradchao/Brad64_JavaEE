package tw.brad.classes;

public class Brad18 {
	private int x, y;
	public Brad18(String x, String y) throws Exception {
		this.x = Integer.parseInt(x);
		this.y = Integer.parseInt(y);
	}
	public int plus() {
		return x + y;
	}
}
