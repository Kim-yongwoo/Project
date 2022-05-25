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

    //회원정보 조회
    UserDTO memberModify(UserDTO userDTO) throws Exception;

    //test
    String test() throws Exception;

    // 로그인
    UserDTO loginProc(UserDTO userDTO) throws Exception;
}