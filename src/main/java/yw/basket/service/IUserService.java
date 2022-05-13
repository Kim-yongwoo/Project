package yw.basket.service;

import yw.basket.dto.UserDTO;

public interface IUserService {

    //접근 제어자 => 반환값 => 함수명 => 가져올 파라미터 => throws Exception
    public UserDTO loginCheck(UserDTO userDTO) throws Exception;

    public int signUp(UserDTO userDTO) throws Exception;
}
