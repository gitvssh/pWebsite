package tools;

import java.security.MessageDigest;

//�븫�샇�솕 �겢�옒�뒪
public class Sha256 {
	
	/**
	 * �븫�샇�솕硫붿꽌�뱶, �븫�샇�엯�젰諛쏆쓣�븣 �샇異쒗빐�꽌 �븫�샇�솕�떆�궡
	 * @param planText
	 * @return �븫�샇�솕�맂 鍮꾨�踰덊샇
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
