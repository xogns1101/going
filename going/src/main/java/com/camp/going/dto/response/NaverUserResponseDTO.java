package com.camp.going.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class NaverUserResponseDTO {

    @JsonProperty("response")
    private ResponseData responseData;

    @Setter @Getter @ToString
    public static class ResponseData {

        private String email;

        private String mobile;

        private String name;

    }


}
