package com.gsbl.oneul.recofood;

import com.gsbl.oneul.Const;
import com.gsbl.oneul.recofood.model.FoodConditionEntity;
import com.gsbl.oneul.recofood.model.FoodResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/food")
public class RecoFoodController {
    @Autowired
    private RecoFoodService service;


    @GetMapping("/random")
    public void goPage(){

    }
    //ajax 조건 리스트
    @ResponseBody
    @PostMapping("/random")
    public FoodResultVO getConditions(@RequestBody FoodConditionEntity entity){
        System.out.println(entity);
        FoodResultVO vo = service.getList(entity);
        System.out.println(vo);
        return vo;
    }
    //main 에서 조건 request에 담기
    @PostMapping("/main")
    public String getConditionsMain(FoodConditionEntity entity, RedirectAttributes reAttr){
        System.out.println(entity);
        FoodResultVO vo = service.getList(entity);
        if(vo==null){
            reAttr.addFlashAttribute(Const.ERR,Const.ERR_1);
        }
        reAttr.addFlashAttribute(Const.FOOD,vo);
        reAttr.addFlashAttribute(Const.MAINCON,entity);
        return "redirect:/food/random";
    }
}
