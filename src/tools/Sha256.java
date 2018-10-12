package tools;

import java.security.MessageDigest;

//암호화 클래스
public class Sha256 {
	
	/**
	 * 암호화메서드, 암호입력받을때 호출해서 암호화시킴
	 * @param planText
	 * @return 암호화된 비밀번호
	 */
	public static String encrypt(String planText){
		try{
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[]=md.digest();
			
			StringBuffer sb=new StringBuffer();
			for(int i=0;i<byteData.length;i++){
				sb.append(Integer.toString((byteData[i]&0xff)+0x100,16).substring(1));
			}
			
			StringBuffer hexString=new StringBuffer();
			for(int i=0;i<byteData.length;i++){
				String hex=Integer.toHexString(0xff&byteData[i]);
				if(hex.length()==1){
					hexString.append('0');
				}
				hexString.append(hex);
			}
			
			return hexString.toString();
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}//class
