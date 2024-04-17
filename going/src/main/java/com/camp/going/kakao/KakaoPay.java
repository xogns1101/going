package com.camp.going.kakao;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.security.web.header.Header;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.io.*;
import java.net.*;
import java.util.Map;

@Controller
@RequestMapping("/jq")
@Slf4j
public class KakaoPay {


//    @GetMapping("/kakaopay")
//    @ResponseBody
//    public String kakaoPay(Model model){
//
//        log.info("kakaopay 실행 여부");
//
//        try {
//
//            URL address = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
//            HttpURLConnection direct = (HttpURLConnection) address.openConnection();
//            direct.setRequestMethod("POST");
//            direct.setRequestProperty("Authorization", "SECRET_KEY DEV432F31A14B5797A186767100F57BE7B7CF8A9");
//            direct.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
//            direct.setDoOutput(true);
//            String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&" +
//                    "partner_user_id=partner_user_id&item_name=초코파이&quantity=1&" +
//                    "total_amount=2200&vat_amount=200&tax_free_amount=1&approval_url=http://localhost:8181/jq/kakaopay/success&" +
//                    "fail_url=http://localhost:8181/jq/kakaopay/fail&cancel_url=http://localhost:8181/jq/kakaopay/cancel";
//            OutputStream push = direct.getOutputStream();
//            DataOutputStream dataPush = new DataOutputStream(push);
//            dataPush.writeBytes(parameter);
//           // dataPush.flush();
//            dataPush.close();
//
//            int result = direct.getResponseCode();
//
//            InputStream pull;
//
//            if(result == 200){
//                // 성공
//                pull = direct.getInputStream();
//            }else {
//                // 실패
//                pull = direct.getErrorStream();
//            }
//
//            InputStreamReader read = new InputStreamReader(pull);
//
//            BufferedReader trance = new BufferedReader(read);
//
//            return trance.readLine();
//
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//           e.printStackTrace();
//        }
//
//
//        return "index";
//    }

    @GetMapping("/kakaopay")
    public String kakaoPay(Model model){

    RestTemplate restTemplate = new RestTemplate();

	String key = "DEV432F31A14B5797A186767100F57BE7B7CF8A9";

    // 서버로 요청할 Header
    HttpHeaders headers = new HttpHeaders();
	headers.add("Host", "open-api.kakaopay.com");
	headers.add("Authorization", "SECRET_KEY " + key);
	headers.add("Content-Type", "application/json;");

    // 서버로 요청할 Body
//    MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//	params.add("cid", "TC0ONETIME");
//	params.add("partner_order_id", "partner_order_id");
//	params.add("partner_user_id", "partner_user_id");
//	params.add("item_name", "초코파이");
//	params.add("quantity", "1");
//	params.add("total_amount", "2200");
//    params.add("vat_amount", "200");
//	params.add("tax_free_amount", "1");
//	params.add("approval_url", "http://localhost:8181/jq/kakaopay/success");
//	params.add("cancel_url", "http://localhost:8181/jq/kakaopay/cancel");
//	params.add("fail_url", "http://localhost:8181/jq/kakaopay/fail");
//	params.add("msg", "결제가 완료되었습니다.");

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cid", "TC0ONETIME");
		jsonObject.put("partner_order_id", "partner_order_id");
		jsonObject.put("partner_user_id", "partner_user_id");
		jsonObject.put("item_name", "초코파이");
		jsonObject.put("quantity", "1");
		jsonObject.put("total_amount", "2200");
		jsonObject.put("vat_amount", "200");
		jsonObject.put("approval_url", "http://localhost:8181/jq/kakaopay/success");
		jsonObject.put("cancel_url", "http://localhost:8181/jq/kakaopay/cancel");
		jsonObject.put("fail_url", "http://localhost:8181/jq/kakaopay/fail");
		jsonObject.put("msg", "결제가 완료되었습니다.");


    HttpEntity<String> body =
            new HttpEntity<>(jsonObject.toString(), headers);
	System.out.println(body);

	try {
        Map<String, Object> responseResult = restTemplate.postForObject(
                new URI("https://open-api.kakaopay.com/online/v1/payment/ready"),
                body,
                Map.class);

        log.info("{}", responseResult);

		String nextRedirectUrl = (String) responseResult.get("next_redirect_pc_url");

		return "redirect:" + nextRedirectUrl;

	} catch (RestClientException e) {
        e.printStackTrace();
    } catch (URISyntaxException e) {
        e.printStackTrace();
    }


	return "index";
}


}
