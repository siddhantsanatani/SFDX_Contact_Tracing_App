public with sharing class CTLocationController {
    public static List<Location__c> getRecentStatusChanges() {
        return [SELECT Id, Name, City__c, Country__c, Land_Mark__c, Postal_Code__c, State__c, Street__c, Verified__c, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
    }

    public static List<Location__c> searchLocations(String searchTerm){
        String search= '%'+searchTerm+'%';
        return [SELECT Id, Name, City__c, Country__c, Land_Mark__c, Postal_Code__c, State__c, Street__c, Verified__c, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c WHERE Name LIKE :search OR Pincode__c LIKE :search OR Address__c LIKE :search ORDER BY Status_Update_Date__c DESC];
    }

    public static Location__c getLocationId(String locationId){
        List<Location__c> locationIdList = [SELECT Id, Name, City__c, Country__c, Land_Mark__c, Postal_Code__c, State__c, Street__c, Verified__c, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c WHERE Id=:locationId];
        if(locationIdList.size()>0 && locationIdList != null){
            return locationIdList[0];
        }
        else {
            return null;
        }
    }
}