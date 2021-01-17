public with sharing class CTLocationController {
   
    /* 

* Class Name: CTPersonController
* Main Controller Class for CTPerson__c Object
* @author: Ujwal Kumar Anagani
* Date: 17-01-2021
******************************************************/

/*** Method Name: getRecentStatusChanges
 * we are going to query the location records and then we need to sort these records
 * by the status update date in descending order.
 * we need to return the list of locations back to the method caller.
 */

    public static List<Location__c> getRecentStatusChanges(){

        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC LIMit 100];
    }


/***
 * Method Name : searchLocations
 * going to accept a search term,
 * you need to use this search term to find out the location records where either the Name, PIN code or address matches the search term.
 * sort these records by the status update date in descending order
 * return the list of location records
 */

 public static List<Location__c> SearchLocations(String searchTerm){

    searchTerm = searchTerm + '%';

        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, 
                    Status_Update_Date__c, Status__c FROM Location__c
                    WHERE Pincode__c LIKE :searchTerm OR
                     Name LIKE :searchTerm 
                    OR Address__c LIKE :searchTerm 
                    ORDER BY Status_Update_Date__c DESC NULLS LAST];
 }

 /***
 * Method Name : getLoacationById
 * going to accept a LocationId,
 * Query a location record where id matches the location id parameter
 * return the location record back to the caller
 */

public static Location__c getLoacationById(String locationId){

   List<Location__c> locations=  [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c WHERE id =:locationId];

   if(locations != null && locations.size() > 0){
    return locations[0];
}
return null;


}



}
