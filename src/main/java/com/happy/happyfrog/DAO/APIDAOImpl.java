package com.happy.happyfrog.DAO;


import com.happy.happyfrog.DTO.Finedust;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class APIDAOImpl implements APIDAO {

    @Override
    public Finedust getFinddust() {

        Finedust fd = new Finedust();

        BufferedReader br = null;
        try{
            String urlstr = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=Gnu9KrJvUfGltKDs8UQ8CyyJBZHgNoa%2FmUIqdDHVujOTYVCDRYDmp2uRXh1E4fByhEe6QMdWDZVyRZE7R28x4A%3D%3D&returnType=xml&numOfRows=10&pageNo=1&sidoName=%EC%84%9C%EC%9A%B8&ver=1.0";
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String result = "";
            String status = "";
            String line;
            while((line = br.readLine()) != null) {
                if(line.contains("pm10Value")) {
                    result = line;
                    int start = result.indexOf(">");
                    int end = line.indexOf("<", start);
                    result = result.substring(start+1,end);
                    break;
                }
            }// 미세먼지 값 추출
            int value = Integer.parseInt(result);
            if(value <= 30) {
                status += "좋음";
            }
            else if(value <=80) {
                status += "보통";
            }
            else {
                status += "나쁨";
            }
            fd.setStatus(status);
            fd.setValue(value);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return fd;
    }
}

