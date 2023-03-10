package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class MapService {
	
	public String searchMap(String keyword) {
		
		System.out.println(keyword);
		
		String clientId = "odiDemcla9iRM6yBGuNa";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "bDDGFll0Y5";// 애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(keyword, "UTF-8");
			
			String apiURL = "https://openapi.naver.com/v1/search/local?query=" + text + "&display=100"; // json
																						// 결과
//			String apiURL = "https://openapi.naver.com/v1/search/book.xml?query="+ text; //
			// xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response.toString());
			
			return response.toString();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
		
	}
}
