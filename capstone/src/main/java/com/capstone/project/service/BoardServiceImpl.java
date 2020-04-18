package com.capstone.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.project.logic.Board;
import com.capstone.project.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;

	public List<Board> getBoardList() {
		return boardDAO.getBoardList();
	}
	@Override
	public int boardwrite(Board board) {
		return boardDAO.boardwrite(board);
	}	
	@Override
	public Board getBoardDetail(int id) {
	return boardDAO.getBoardDetail(id);}

	@Override
	public void viewsUpdate(int id) {
	boardDAO.viewUpdate(id);}
}
