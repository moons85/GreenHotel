package com.example.greenhotel.dto;

import com.example.greenhotel.model.FaqReply;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class FaqReplyuploadDto {
    private String content;
    private Timestamp createTime;
    private int userId;
    private int faqId;

    public FaqReply toEntity(String content, Timestamp createTime) {
        return FaqReply.builder()
                .content(content)
                .createTime(createTime)
                .build();
    }
}
