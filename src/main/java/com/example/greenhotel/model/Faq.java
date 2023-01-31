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
@Table(name="faq")
@SequenceGenerator(name = "USER_SEQ_GENERATOR5", sequenceName = "USER_SEQ5", allocationSize = 1)

public class Faq {

    @Id
    @GeneratedValue(generator = "USER_SEQ_GENERATOR5", strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;

    @Column(nullable = false, length = 50)
    private String title;

    @Column(nullable = false, length = 50)
    private String category;

    @Lob
    private String content;

    @CreationTimestamp
    private Timestamp createTime;
}
