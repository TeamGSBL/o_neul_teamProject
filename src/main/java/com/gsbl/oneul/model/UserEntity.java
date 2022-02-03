package com.gsbl.oneul.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserEntity {
    private String email;
    private String nickname;
    private String name;
    private String age;
    private String gender;
    private String birthday;
    private String mobile;
}
