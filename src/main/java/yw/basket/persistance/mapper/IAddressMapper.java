package yw.basket.persistance.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import yw.basket.dto.GGInfoDTO;

import java.util.List;

@Mapper
public interface IAddressMapper {

    List<GGInfoDTO> getGGInfo() throws Exception;
}
