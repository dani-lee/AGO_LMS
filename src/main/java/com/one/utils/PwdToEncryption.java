package com.one.utils;

import org.apache.commons.codec.digest.Sha2Crypt;

public class PwdToEncryption {
	public static String encry(String id, String pwd) {
		String encry = "";
		encry = Sha2Crypt.sha256Crypt(pwd.getBytes(), "$5$" + id);
		// $5$id$가 나오는 상태 불편하면 지움
		return encry;
	}
}
