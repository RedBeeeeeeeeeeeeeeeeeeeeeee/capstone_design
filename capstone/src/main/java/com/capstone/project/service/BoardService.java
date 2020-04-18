package com.capstone.project.service;
import java.util.List;

import com.capstone.project.logic.Board;

public interface BoardService {
	List<Board> getBoardList();
	int boardwrite(Board board);
	Board getBoardDetail(int id);
	void viewsUpdate(int id);
}