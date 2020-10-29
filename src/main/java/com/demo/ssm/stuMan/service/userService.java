package com.demo.ssm.stuMan.service;

import com.demo.ssm.stuMan.model.userDto;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class userService {
    @Resource
    private com.demo.ssm.stuMan.mapper.userMapper userMapper;

    public List<userDto> listUsers(){
        return userMapper.listUser();
    }

}
