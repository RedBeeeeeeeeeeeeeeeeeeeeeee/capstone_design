package com.capstone.project.service;


import com.capstone.project.logic.Members;

public interface UserService {

	Members getUserOne(String common, String col);

	int userJoin(Members members);

/*================================================================ Unity ���� �Լ���! ���߿� ������ �� ���� ��

	int setFurn(String ID, String route);

	String getFurn(String ID);
*/

}