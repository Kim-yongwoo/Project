package yw.basket.mapper;

import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.UserDTO;

@Mapper
public interface IUserMapper {
    
    // 회원정보 등록
    int insertUserInfo(UserDTO userDTO) throws Exception;

    // 로그인
    int getUserLoginCheck(UserDTO userDTO) throws Exception;

    // 로그인 체크
    int loginCheck(UserDTO userDTO) throws Exception;


    //test
    String test() throws Exception;

    // 로그인
    UserDTO loginProc(UserDTO userDTO) throws Exception;

    // 사용자 정보 by userId

    UserDTO getUserInfo(UserDTO userDTO) throws Exception;



    //회원정보 수정
    int memberModifySave(UserDTO userDTO) throws Exception;

    //비밀번호 수정
    int updatePwSave(UserDTO userDTO) throws Exception;

    //아이디 중복체크
    public int idCheck(String userId);

    //회원탈퇴
    int memberOut(UserDTO userDTO) throws Exception;
}