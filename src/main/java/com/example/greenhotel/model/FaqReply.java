package com.example.greenhotel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="faqreply")
@SequenceGenerator(name = "USER_SEQ_GENERATOR6", sequenceName = "USER_SEQ6", allocationSize = 1)
public class FaqReply {
    @Id
    @GeneratedValue(generator = "USER_SEQ_GENERATOR6", strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "faqId")
    private Faq faq;

    @Column(nullable = false, length = 100)
    private String content;

    @CreationTimestamp
    private Timestamp createTime;
}
