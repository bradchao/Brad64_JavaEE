package tw.brad.classes;

import java.io.BufferedReader;
import java.io.FileReader;

public class BradUtils {
	public static String loadView(String view) throws Exception {
		String viewFile = 
			String.format(
					"C:\\Users\\USER\\git\\repository2\\MyWeb2\\src\\main\\webapp\\views\\%s.html"
					, view);
		BufferedReader reader = 
			new BufferedReader(new FileReader(viewFile));
		String line; StringBuffer sb = new StringBuffer();
		while ( (line = reader.readLine()) != null) {
			sb.append(line + "\n");
		}
		reader.close();
		return sb.toString();
	}
	
	public static String calc(String x, String y) {
		return calc(x, y, "1");
	}

	public static String calc(String x, String y, String op) {
		try {
			int intX = Integer.parseInt(x);
			int intY = Integer.parseInt(y);
			StringBuffer ret = new StringBuffer();
			switch(op) {
				case "1": ret.append(intX + intY); break;
				case "2": ret.append(intX - intY); break;
				case "3": ret.append(intX * intY); break;
				case "4": 
					ret.append(intX/intY)
						.append(" ... ")
						.append(intX%intY); 
					break;
			}
			return ret.toString();
			
		}catch(Exception e) {
			return "";
		}
	}

}
