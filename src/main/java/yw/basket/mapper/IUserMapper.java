package yw.basket.mapper;

import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.UserDTO;

@Mapper
public interface IUserMapper {
    
    // 회원정보 등록
    int InsertUserInfo(UserDTO userDTO) throws Exception;
}

