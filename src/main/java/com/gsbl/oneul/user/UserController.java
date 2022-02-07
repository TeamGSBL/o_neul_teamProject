package com.gsbl.oneul.user;

import com.gsbl.oneul.Utils.Const;
import com.gsbl.oneul.model.UserDTO;
import com.gsbl.oneul.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService service;

    @GetMapping("/user/login")
    public void login() {}


    @PostMapping("/user/login")
    public String loginProc(UserVO vo, RedirectAttributes reAttr) {
        int result = service.login(vo);
        switch(result) {
            case 0:
                reAttr.addFlashAttribute("msg", "에러가 발생하였습니다.");
                break;
            case 1:
                return "redirect:/board/list";
            case 2:
                reAttr.addFlashAttribute("msg", "아이디를 확인해 주세요.");
                break;
            case 3:
                reAttr.addFlashAttribute("msg", "비밀번호를 확인해 주세요.");
                break;
        }
        return "redirect:/user/login";
    }

    @GetMapping("/user/mypage/profile")
    public void myPage(){}

    @ResponseBody
    @PostMapping("/user/mypage/profile")
    public Map<String, String> mypageProfileProc(MultipartFile u_profileimg){
        String fileNm = service.uploadProfileImg(u_profileimg);
        Map<String, String>result = new HashMap<>();
        result.put("result", fileNm);
        return result;
    }

    @GetMapping("user/mypage/password")
    public void password(){}

    @PostMapping("user/mypage/password")
    public String passwordProc(UserDTO dto, HttpSession hs, RedirectAttributes rAttr){
        int result = service.changePassword(dto);
        if(result != 1){
            switch(result){
                case 0:
                    rAttr.addFlashAttribute(Const.MSG, "비밀번호 변경에 실패하였습니다.");
                    break;
                case 2:
                    rAttr.addFlashAttribute(Const.MSG, "현재 비밀번호를 확인해 주세요.");
                    break;
            }
            return "redirect:/user/mypage/password";
        }
        hs.invalidate();
        return "redirect:/user/logout";
    }




    @GetMapping("/user/logout")
    public String logout(HttpSession hs, HttpServletRequest req) {
        hs.invalidate();
        //전 페이지로 이동
        return "redirect:/user/login";
    }

    @GetMapping("/user/join")
    public void join(){}

    @PostMapping("/user/join")
    public String joinProc(UserVO vo){
        service.join(vo);
        return "redirect:/user/login";
    }
    @GetMapping("/user/kakao")
    public void kakao(){}

    @PostMapping("/user/kakao")
    public String kakaoProc(@RequestBody UserVO vo,RedirectAttributes reattr) {
        reattr.addFlashAttribute("login", service.kakaoLogin(vo));

        return"redirect:/board/list";
    }

    @GetMapping("/naver/nlogin")
    public void naver(){}

    @GetMapping("/naver/ncallback")
    public void ncallback(){}

    @PostMapping("/naver/ncallback")
    public String ncallbackProc(@RequestBody UserVO vo) {
        service.naverLogin(vo);
        return"redirect:/board/list";
    }
    @GetMapping("/user/google")
    public void google(){}

    @PostMapping("/user/google")
    public String googleProc(@RequestBody UserVO vo) {
        service.googleLogin(vo);
        return "redirect:/board/list";
    }
}
