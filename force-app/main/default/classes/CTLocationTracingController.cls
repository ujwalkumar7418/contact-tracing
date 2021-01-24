public with sharing class CTLocationTracingController {
    
    /**
     * methodName: getVisitors
     * Query Location Tracing records matching locationIds
     * Sort by Visit_Date__c in DESC
     * Return List of Location Tracing records to caller
     */
       public static List<Location_Tracing__c> getVisitors(String LocationId){

        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Name, Person__r.Health_Status__c 
                FROM Location_Tracing__c 
                WHERE Location__c =:LocationId 
                ORDER BY Visit_Date__c 
                DESC NULLS LAST];

        }
    /**
     * methodName : getLocationsByPersonIds
     * Query Location Tracing records matching Where Person matches the PersonId's
     * Only Retreive records - visit date is in last 10 days
     * Return List of Location Tracing records to caller
     */

        public static List<Location_Tracing__c> getLocationsById(Set<Id> personIds){

           return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c, Person__r.Name, Person__r.Mobile__c, Person__r.Health_Status__c 
                    FROM Location_Tracing__c 
                    WHERE Person__c IN :personIds AND Visit_Date__c = LAST_N_DAYS:10
                    ];
        }

    /**
     * methodName : getLocationsByLocationIds
     * Query Location Tracing records where location matches the locationIds and person health is green
     * Only retrieve recors visit date is  in last 10 days
     * Return list of Location Tracing records back to caller
     */

        public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> Location__c){

            return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c, Person__r.Name, Person__r.Mobile__c, Person__r.Health_Status__c 
                    FROM Location_Tracing__c 
                    WHERE Location__c IN :Location__c  
                    AND Person__r.Health_Status__c = 'Green'; 
                    AND Visit_Date__c = LAST_N_DAYS:10];
                    
        }

    


}
