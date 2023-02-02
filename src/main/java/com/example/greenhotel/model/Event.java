package com.example.greenhotel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="events")
@SequenceGenerator(name = "USER_SEQ_GENERATOR8", sequenceName = "USER_SEQ8", allocationSize = 1)
public class Event {

    @Id
    @GeneratedValue(generator = "USER_SEQ_GENERATOR8", strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;


    @Column(nullable = false)
    private String coupon;
}
