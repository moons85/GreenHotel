package com.example.greenhotel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="room")
@SequenceGenerator(name = "USER_SEQ_GENERATOR7", sequenceName = "USER_SEQ7", allocationSize = 1)

public class Room {
    @Id
    @GeneratedValue(generator = "USER_SEQ_GENERATOR7", strategy = GenerationType.AUTO)
    private int id;

    @Column
    private String roomname;

    @Column
    private String roomcontent;

    @Column
    private String maxpeople;

    @Column
    private String size;

    @Column
    private String view;

    @Column
    private String bed;

    @Column
    private String price;

    @Column
    private String roommainimg;

    @Column
    private String roomimg1;
    @Column
    private String roomimg2;
    @Column
    private String roomimg3;
}
