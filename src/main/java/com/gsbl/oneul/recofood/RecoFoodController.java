package com.gsbl.oneul.recofood;

import com.gsbl.oneul.recofood.model.FoodConditionEntity;
import com.gsbl.oneul.recofood.model.FoodResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/food/random")
public class RecoFoodController {
    @Autowired
    private RecoFoodService service;


    @GetMapping
    public void goPage(){

    }

    @ResponseBody
    @PostMapping
    public String getConditions(@RequestBody FoodConditionEntity entity){
        System.out.println(entity.getIcook());
        System.out.println(entity);
        List<FoodResultVO> list = service.getList(entity);
        System.out.println(list);
        return "null";
    }
}
