public with sharing class CTPersonController {
    public static String getToken(String mobileNum){
        //Generating hash token using Crypto class then converting hash to string using Encoding class
        Blob inputBlob = Blob.valueOf(mobileNum);
        Blob hash = Crypto.generateDigest('MD5', inputBlob);
        return EncodingUtil.base64Encode(hash);
    }

    public static List<Person__c> getRecentHealthChanges(){
        return [SELECT Id, Name, CreatedDate, CreatedById, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }

    public static List<Person__c> searchPeople(String searchString){
        String searchTerm = '%'+searchString +'%';
        return [SELECT Id, Name, CreatedDate, CreatedById, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c WHERE Name LIKE :searchTerm OR Mobile__c LIKE :searchTerm OR Token__c LIKE :searchTerm ORDER BY Status_Update_Date__c];
    }

    public static Person__c getPersonById(String personId){
        List<Person__c> result = [SELECT Id, Name, CreatedDate, CreatedById, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c WHERE Id = :personId ];
        if(result.size() >0 && result != null){
            return result[0];
        }
        else return null;
    }
}