package com.gsbl.oneul.user;

import com.gsbl.oneul.Utils.Const;
import com.gsbl.oneul.Utils.MyFileUtils;
import com.gsbl.oneul.Utils.UserUtils;
import com.gsbl.oneul.model.UserVO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

@Service
public class UserService {
    @Autowired
    private UserMapper mapper;

    @Autowired
    private MyFileUtils myFileUtils;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private HttpSession hs;

    public int join(UserVO vo){
        String plainPw = vo.getU_pw();
        vo.setU_pw(BCrypt.hashpw(vo.getU_pw(), BCrypt.gensalt()));
        int result = mapper.join(vo);
        vo.setU_pw(plainPw);
        return result;
    }

    public int login(UserVO vo) {
        UserVO loginUser = null;
        try {
            loginUser = mapper.login(vo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0; //에러 발생
        }

        if (loginUser == null) {
            return 2; //아이디 없음
        }
        //암호 비교
        if (BCrypt.checkpw(vo.getU_pw(), loginUser.getU_pw())) { //비밀번호 맞았음
            loginUser.setU_pw(null);
            loginUser.setU_rdt(null);
            hs.setAttribute("loginUser", loginUser);
            return 1;
        }
        return 3; //비밀번호 다름
    }

    public int platformLogin(UserVO vo) {
        vo.setU_pw("0");
        vo.setU_id(vo.getU_email().substring(0, vo.getU_email().indexOf("@")));
        hs.setAttribute("loginUser", vo);

        int result = mapper.join(vo);
        return result;
    }

    public String uploadProfileImg(MultipartFile mf){
        if(mf == null) { return null;}

        UserVO loginUser = userUtils.getLoginUser();

        final String PATH = Const.UPLOAD_IMG_PATH + "/user/" + loginUser.getIuser();
        String fileNm = myFileUtils.saveFile(PATH, mf);
        System.out.println("fileNm : " + fileNm);
        if(fileNm == null){ return null;}

        UserVO vo = new UserVO();
        vo.setIuser(loginUser.getIuser());

        //기존 파일명 담기
        String oldFilePath = PATH + "/" + loginUser.getU_profileimg();
        myFileUtils.delFile(oldFilePath);

        //파일명 DB에 업데이트
        vo.setU_profileimg(fileNm);
        mapper.updUser(vo);

        //세션 프로필 파일명 수정
        loginUser.setU_profileimg(fileNm);

        return fileNm;
    }





}
