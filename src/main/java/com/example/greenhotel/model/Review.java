package com.example.greenhotel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="review")
@SequenceGenerator(name = "USER_SEQ_GENERATOR2", sequenceName = "USER_SEQ2", allocationSize = 1)
public class Review {

    @Id
    @GeneratedValue(generator = "USER_SEQ_GENERATOR2", strategy = GenerationType.AUTO)
    private int id;

    @Column(nullable = false, length = 50)
    private String title;
    @Lob
    private String content;
    @Lob
    private String photo;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "review")
    private List<Reply> replies;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;

    @CreationTimestamp
    private Timestamp createTime;
}
