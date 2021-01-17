public with sharing class CTLocationTracingController {
    

       public static List<Location_Tracing__c> getVisitors(String LocationId){

        return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c, Person__r.Name, Person__r.Mobile__c, Person__r.Health_Status__c 
                FROM Location_Tracing__c 
                WHERE Location__c =:LocationId 
                ORDER BY Visit_Date__c 
                DESC NULLS LAST];

        }


}
