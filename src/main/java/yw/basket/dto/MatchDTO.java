package yw.basket.dto;


import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@Setter
public class MatchDTO {

    private int matchSeq;
    private String matchLocM;
    private String matchLocD;
    private String matchGmName;
    private String matchGmAddr;
    private Timestamp matchDate;
    private String matchTime;
    private int matchMem;
    private String matchGender;
    private int matchRegSeq;

}
