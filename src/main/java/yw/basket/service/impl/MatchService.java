package yw.basket.service.impl;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yw.basket.dto.BoardDTO;
import yw.basket.dto.MatchDTO;
import yw.basket.mapper.IMatchMapper;
import yw.basket.mapper.IUserMapper;
import yw.basket.service.IMatchService;

import java.util.List;

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

    @Override
    public List<MatchDTO> matchDTOList(MatchDTO matchDTO) throws Exception {
        return matchMapper.matchDTOList(matchDTO);
    }

    //매치 참여
    @Override
    public int matchStart(MatchDTO matchDTO) throws Exception {
        return matchMapper.matchStart(matchDTO);

    }


}
