/* 
This CTPersonController class is used to genereate a secure token based on the user given mobile number

To genereate unique token use md5 hashing.



* Class Name: CTPersonController
* Main Controller Class for CTPerson__c Object
* @author: Ujwal Kumar Anagani
******************************************************/

public with sharing class CTPersonController {
    
    /**
     * Generate Unique Token using user mobile number
     * Use MD5 algorithm to generate a unique token
     * @param mobile
     * @return String token
     */

    public static String getToken(String mobileNo){

        Blob targetBlob = Blob.valueOf('mobileNo');
        Blob hash = Crypto.generateDigest('MD5', targetBlob);
        String SecureToken = hash.toString();
    }
}
