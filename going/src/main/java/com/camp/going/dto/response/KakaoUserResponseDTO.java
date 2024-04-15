package com.camp.going.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class KakaoUserResponseDTO {

    // 이따가 영섭이한테 JSON 데이터 물어보기

    private long id;

    @JsonProperty("connected_at")
    private LocalDateTime connectedAt;

    private Properties properties;

    @JsonProperty("kakao_account")
    private KakaoAcount account;


    @Setter @Getter @ToString
    public static class Properties {


        private String nickname;
        @JsonProperty("profile_image")
        private String profileImage;
        @JsonProperty("thumbnail_image")
        private String thumbnailImage;
    }

    @Getter @Setter @ToString
    public static class KakaoAcount {
        private String email;
    }


}
