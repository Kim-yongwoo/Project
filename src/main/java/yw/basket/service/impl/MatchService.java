package yw.basket.service.impl;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yw.basket.dto.MatchDTO;
import yw.basket.mapper.IMatchMapper;
import yw.basket.mapper.IUserMapper;
import yw.basket.service.IMatchService;

@Slf4j
@Service("MatchService")

public class MatchService implements IMatchService {

    private final IMatchMapper matchMapper;

    @Autowired
    public MatchService(IMatchMapper matchMapper) {
        this.matchMapper = matchMapper;
    }

    @Override
    public int matchRegSave(MatchDTO matchDTO) throws Exception {
        return matchMapper.matchRegSave(matchDTO);
    }
}
