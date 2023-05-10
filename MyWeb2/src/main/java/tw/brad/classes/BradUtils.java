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
			sb.append(line);
		}
		reader.close();
		return sb.toString();
	}
}
