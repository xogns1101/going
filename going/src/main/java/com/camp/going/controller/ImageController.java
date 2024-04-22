package com.camp.going.controller;

import com.camp.going.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@RestController
@RequestMapping("/review")
@Slf4j
@RequiredArgsConstructor
public class ImageController {

    @Value("${file.upload.root-path}")
    private String rootPath;

    private ReviewService reviewService;

    @GetMapping("/{y}/{m}/{d}/{fileName}")
    public ResponseEntity<?> getImage(@PathVariable String y,
                                      @PathVariable String m,
                                      @PathVariable String d,
                                      @PathVariable String fileName) {
        log.info("/display/{}/{}/{}/{} : GET", y, m, d, fileName);

        String fullPath = String.format("%s/%s/%s/%s/%s", rootPath, y, m, d, fileName);
        log.info("fullPath : {}", fullPath);
        File file = new File(fullPath);

        ResponseEntity<byte[]> result = null;
        HttpHeaders headers = new HttpHeaders();

        try {
            headers.add("Content-Type", Files.probeContentType(file.toPath()));

            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(e.getMessage());
        }

        return result;
    }

}