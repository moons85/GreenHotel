package com.example.greenhotel.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.annotation.CreatedDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "chatRoom")
@SequenceGenerator(name = "CHATROOM_SEQ_GENERATOR", sequenceName = "CHATROOM_SEQ",  allocationSize = 1)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ChatRoom {

    @Id
    @GeneratedValue(generator = "CHATROOM_SEQ_GENERATOR", strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userid")
    private User user;

    @CreatedDate
    @Column
    private LocalDateTime readDate;

    @CreatedDate
    @Column
    private LocalDateTime readDate2;

    @Column
    private String msg;

    @ColumnDefault("0")
    private int count;


}