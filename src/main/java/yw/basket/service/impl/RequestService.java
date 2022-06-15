package yw.basket.service.impl;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yw.basket.dto.RequestDTO;
import yw.basket.mapper.IBoardMapper;
import yw.basket.mapper.IRequestMapper;
import yw.basket.service.IRequestService;

@Slf4j
@Service("RequestService")
public class RequestService implements IRequestService {

    private final IRequestMapper requestMapper;

    @Autowired
    public RequestService(IRequestMapper requestMapper) {
        this.requestMapper = requestMapper;

    }

    @Override
    public int matchReq(RequestDTO requestDTO) throws Exception {
        return requestMapper.matchReq(requestDTO);
    }

    @Override
    public int matchReqSave(RequestDTO requestDTO) throws Exception {
        return requestMapper.matchReqSave(requestDTO);
    }

    @Override
    public int matchReqMain(RequestDTO requestDTO) throws Exception {
        return requestMapper.matchReqMain(requestDTO);
    }

    @Override
    public int matchReqCncSave(RequestDTO requestDTO) throws Exception {
        return requestMapper.matchReqCncSave(requestDTO);
    }

}

