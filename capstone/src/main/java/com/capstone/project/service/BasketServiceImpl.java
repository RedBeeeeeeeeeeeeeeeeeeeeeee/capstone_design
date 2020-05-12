package com.capstone.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.project.dao.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService{
   
   @Autowired
   BasketDAO basketDAO;
   
   @Override
   public int insertBasket(String ID, String num) {
      return basketDAO.insertBasket(ID, num);
   }
   
   @Override
   public int deleteBasket(String ID, String num) {
      return basketDAO.deleteBasket(ID, num);
   }
   
   
   
}