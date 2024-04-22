package com.camp.going.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@Controller
public class UploadController {

    private String rootPath = "C:/MyWorkspace/going/going/upload";

    @PostMapping("/review-write")
    public String uploadForm(@RequestParam("thumbnail") MultipartFile file) {

        log.info("file-name : {}", file.getOriginalFilename());
        log.info("file-size : {}", file.getSize());
        log.info("file-type : {}", file.getContentType());

        File root = new File(rootPath);
        if (!root.exists()) root.mkdirs();

        UUID uuid = UUID.randomUUID();
        log.info("uuid : {}", uuid.toString());

        String fileName = uuid.toString();
        fileName = fileName.replace("-", "");
        log.info("랜덤 파일명 : {}", fileName);

        String fileExtension = file.getOriginalFilename()
                .substring(file.getOriginalFilename().lastIndexOf("."));
        log.info("확장자 : {}", fileExtension);

        File uploadFile = new File(rootPath, fileName + fileExtension);

        try {
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "";

    }

}