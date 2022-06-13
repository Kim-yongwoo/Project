package yw.basket.dto;


import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@Setter
public class MatchDTO {

    /** 테이블 변수 */
    private int matchSeq;
    private String matchLocM;
    private String matchLocD;
    private String matchGmName;
    private String matchGmAddr;
    private String matchDate;
    private String matchTime;
    private int matchMem;
    private String matchGender;
    private int matchRegSeq;
    private String matchLevel;

    /** 입출력 변수 */
    private String reqStatus;   //신청상태
    private int reqCnt;         //신청인원
    private int reqSeq;         //신청번호
    private String matchDateStatus;  //현재시간상태
}
