package yw.basket.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Data
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
    private String userPwNew;
    private String userPlayer;
    private String addr1;
    private String addr2;
    private String addr3;


    @Override
    public String toString() {
        return "UserDTO{" +
                "userSeq=" + userSeq +
                ", userLogin=" + userLogin +
                ", userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userLevel='" + userLevel + '\'' +
                ", userAge=" + userAge +
                ", userGender='" + userGender + '\'' +
                ", userNickname='" + userNickname + '\'' +
                ", userStatus='" + userStatus + '\'' +
                ", joinDt=" + joinDt +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", addr3='" + addr3 + '\'' +
                '}';
    }
}
