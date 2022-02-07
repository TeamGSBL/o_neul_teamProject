package com.gsbl.oneul.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/list")
    public void goList(){}

    @GetMapping("/lists")
    public String listProc() {
        return "redirect:/board/list";
    }
}
