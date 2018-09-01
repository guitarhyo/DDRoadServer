package com.ddroad.service.user;

import com.ddroad.model.UserVO;

public interface UserService {
	public int selectById(String id) throws Exception;
	public void join(UserVO vo) throws Exception;
}
