package com.capstone.project.service;


import com.capstone.project.logic.Members;

public interface UserService {

	Members getUserOne(String common, String col);

	int userJoin(Members members);

/*================================================================ Unity 동작 함수들! 나중에 연동시 손 봐야 함

	int setFurn(String ID, String route);

	String getFurn(String ID);
*/

}