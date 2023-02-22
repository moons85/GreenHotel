package com.example.greenhotel.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "roomid")
    private Room room;
    
    
    @CreationTimestamp
    private Timestamp createTime;
}
