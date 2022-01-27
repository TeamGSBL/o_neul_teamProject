package com.gsbl.oneul.recofood.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class FoodConditionEntity {
    private List<String> icook;
    private List<String> dining;
    private List<String> igd;
    private int alone;
}
