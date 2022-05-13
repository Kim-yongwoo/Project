package yw.basket.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class UserDTO {

    private int userSeq;     // 기본키, 순번
    private int userLogin;   //
    private String userId;      // 기본키, 순번
    private String userPw;      // 제목
    private String userName;
    private String userEmail;
    private String userLevel;
    private int userAge;
    private String userGender;
    private String userNickname;
    private String userStatus;
    private Timestamp joinDt;

}
