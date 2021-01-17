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
        String SecureToken = EncodingUtil.base64Encode(hash);
        return SecureToken;
    }

    /**
     * @methodName: getRecentHealthChanges
     * @param: None
     * Req: get all fields limit to 100
     * Sort by status Update Date in descending order
     * @return List of persons Record back to caller
     */

    public static List<Person__c> getRecentHealthChanges(){

        // My Approach 
        // List<Person__c> persons = new List<Person__c>();

        // List<Person__c> people = [SELECT Id, Name,Mobile__c, Status_Update_Date__c, Token__c, Health_Status__c FROM Person__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
        // persons.add(people);

        // return persons;

        // Easy way to return
       //return [SELECT Id, Name,Mobile__c, Status_Update_Date__c, Token__c, Health_Status__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100 ];

       return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }

    /**
     * @methodName: searchPeople
     * @param: SearchTerm
     * Sort by status Update Date in descending order
     * @return persons Record back to caller
     
     * Search a person by name, token or mobile
     * @return List<Person__c>
     */
    public static List<Person__c> searchPeople(String searchTerm){
        // appending the wild card
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
            FROM Person__c
            WHERE Name LIKE :searchTerm
                OR Mobile__c LIKE :searchTerm
                OR Token__c LIKE :searchTerm
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }


    public static Person__c getPersonById(String personId){
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
                FROM Person__c
                WHERE Id =:personId];
        if(people != null && people.size() > 0){
            return people[0];
        }
        return null;
    }






}
