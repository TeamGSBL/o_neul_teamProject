package com.gsbl.oneul.recofood;

import com.gsbl.oneul.recofood.model.FoodConditionEntity;
import com.gsbl.oneul.recofood.model.FoodResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecoFoodService {
    @Autowired
    private RecoFoodMapper recoFoodMapper;

    //검색조건 넣고 결과 리스트로 가져오기
    public List<FoodResultVO> getList(FoodConditionEntity entity){
        return recoFoodMapper.FoodResultVO(entity);
    }
}
