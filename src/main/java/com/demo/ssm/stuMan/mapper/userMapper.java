package com.demo.ssm.stuMan.mapper;

import com.demo.ssm.stuMan.model.userDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface userMapper {
    List<userDto> listUser();
}

