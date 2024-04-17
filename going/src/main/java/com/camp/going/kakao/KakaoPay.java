package com.camp.going.kakao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@Controller
@RequestMapping("/jq")
public class KakaoPay {


    @GetMapping("/kakaopay")
    @ResponseBody
    public String kakaoPay(){

        try {

            URL address = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
            HttpURLConnection direct = (HttpURLConnection) address.openConnection();
            direct.setRequestMethod("POST");
            direct.setRequestProperty("Authorization", "SECRET_KEY DEV432F31A14B5797A186767100F57BE7B7CF8A9");
            direct.setRequestProperty("Content-Type", "application/json");
            direct.setDoOutput(true);
            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&" +
                    "partner_user_id=partner_user_id&item_name=초코파이&quantity=1&" +
                    "total_amount=2200&vat_amount=200&tax_free_amount=1&approval_url=http://localhost:8181/jq/kakaopay/success&" +
                    "fail_url=http://localhost:8181/fail&cancel_url=http://localhost:8181/cancel";
            OutputStream push = direct.getOutputStream();
            DataOutputStream dataPush = new DataOutputStream(push);
            dataPush.writeBytes(parameter);
           // dataPush.flush();
            dataPush.close();

            int result = direct.getResponseCode();

            InputStream pull;

            if(result == 200){
                // 성공
                pull = direct.getInputStream();
            }else {
                // 실패
                pull = direct.getErrorStream();
            }

            InputStreamReader read = new InputStreamReader(pull);

            BufferedReader trance = new BufferedReader(read);

            return trance.readLine();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }


        return "index";
    }




}
