package yw.basket.service;

import yw.basket.dto.GGInfoDTO;

import java.util.List;

public interface IApiService {

    List<GGInfoDTO> getGGInfo() throws Exception;

    List<String> getGroundInfo(String siName) throws Exception;
}
