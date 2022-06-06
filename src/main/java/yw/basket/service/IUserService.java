package yw.basket.service;

import yw.basket.dto.UserDTO;

public interface IUserService {

    //접근 제어자 => 반환값 => 함수명 => 가져올 파라미터 => throws Exception
    public int loginCheck(UserDTO userDTO) throws Exception;

    public int signUp(UserDTO userDTO) throws Exception;

    /*로그인*/
    public int main(UserDTO userDTO) throws Exception;


    public String test() throws Exception;

    // 로그인 처리
    public UserDTO loginProc(UserDTO userDTO) throws Exception;

    //커피 테스트
    public String coffee() throws Exception;

    UserDTO getUserInfo(UserDTO userDTO) throws Exception;

    //회원정보 수정
    int memberModifySave(UserDTO userDTO) throws Exception;

    //비밀번호 변경
    int updatePwSave(UserDTO userDTO) throws Exception;

    //아이디 중복체크
    public int idCheck(String userId) throws Exception;
}
