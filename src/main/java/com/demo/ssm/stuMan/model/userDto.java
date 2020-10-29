package com.demo.ssm.stuMan.model;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
@Setter @Getter
public class userDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private  String Sid;

    private  String Username;

    private  String password;
}
