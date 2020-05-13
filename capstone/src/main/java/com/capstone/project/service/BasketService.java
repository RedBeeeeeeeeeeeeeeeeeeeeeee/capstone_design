package com.capstone.project.service;

import java.util.List;

import com.capstone.project.logic.Baskets;

public interface BasketService {

	int insertBasket(String ID, String num);

	int deleteBasket(String ID, String num);

	List<Baskets> getBasketList(String reloadID);
}