package com.gsbl.oneul.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
    private int iuser;
    private String u_id;
    private String u_pw;
    private String u_nm;
    private String u_email;
    private String u_rdt;
    private String u_mdt;
    private String u_profileimg;

}
