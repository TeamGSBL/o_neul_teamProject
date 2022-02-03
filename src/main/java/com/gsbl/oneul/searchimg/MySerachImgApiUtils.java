package com.gsbl.oneul.searchimg;

import com.google.gson.Gson;
import com.gsbl.oneul.searchimg.model.ImgChannel;
import com.gsbl.oneul.searchimg.model.SearchImgVO;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class MySerachImgApiUtils {

    public List<SearchImgVO> searchPlace(String keyword){
        try {
            keyword = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("encoding fail!",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/image.json?query="+keyword+"&display=4&start=1&sort=sim&filter=medium";    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", "CU4oIqnKlO1XPT8Z1wwf");
        requestHeaders.put("X-Naver-Client-Secret", "MC8FrRAFfr");
        String responseBody = get(apiURL,requestHeaders);

        System.out.println("네이버에서 받은 결과 = " + responseBody);
        System.out.println("-----------------------------------------");
        Gson gson = new Gson();
        ImgChannel imgchannel = gson.fromJson(responseBody, ImgChannel.class);
        for(SearchImgVO vo : imgchannel.getItems()){
            System.out.println(vo);
        }
        return imgchannel.getItems();
//        System.out.println(responseBody);
    }

    private String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

        try (
                BufferedReader lineReader = new BufferedReader(streamReader)
        ) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }


}
