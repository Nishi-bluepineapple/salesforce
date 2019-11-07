public class JSONParser {
     public static string jsonString = '{    "success": true,    "error": null,    "data": {        "userInfoRecords": [            {                "userId": 93,                "onboardingStage": "COMPLETED",                "registrationMemberId": 150214,                "firstName": "John",                "familyName": "Doe",                "email": "john.doe@testmail.com",                "address": "Unit 52  Askern Industrial Estate Moss Road Doncaster South Yorkshire DN6 0DD United Kingdom",                "gender": "M",                "dateOfBirth": "1982-10-10",                "tfnVerificationStatus": true,                "investmentStrategy": "BALANCED",                "investmentStrategyChangeInProgress": true,                "roundupActive": false,                "roundupAmountCap": null,                "topupActive": null,                "topupAmount": null,                "isInsuranceOpted": true,                "claimTaxBack": null,                "directDebitPermission": null,                "productDisclosureReadStatements": true,                "productDisclosureTfnUsePermission": true,                "productDisclosureCanSendEmails": true,                "beneficiary1": null,                "beneficiary2": null,                "beneficiary3": null,                "beneficiary4": null,                "beneficiary5": null,                "createdOn": "2019-10-22T06:30:27.989Z",                "lastModifiedOn": "2019-10-22T06:31:58.364Z"            }, {                "userId": 99,                "onboardingStage": "COMPLETED",                "registrationMemberId": 150217,                "firstName": "Jane",                "familyName": "Smith",                "email": "test@99.com",                "address": "Unit 54  Askern Industrial Estate Moss Road Doncaster South Yorkshire DN6 0DD United Kingdom",                "gender": "F",                "dateOfBirth": "1987-11-11",                "tfnVerificationStatus": true,                "investmentStrategy": "BALANCED",                "investmentStrategyChangeInProgress": true,                "roundupActive": false,                "roundupAmountCap": null,                "topupActive": null,                "topupAmount": null,                "isInsuranceOpted": true,                "claimTaxBack": null,                "directDebitPermission": null,                "productDisclosureReadStatements": true,                "productDisclosureTfnUsePermission": true,                "productDisclosureCanSendEmails": true,                "beneficiary1": null,                "beneficiary2": null,                "beneficiary3": null,                "beneficiary4": null,                "beneficiary5": null,                "createdOn": "2019-10-22T06:30:27.989Z",                "lastModifiedOn": "2019-10-22T06:31:58.364Z"            }        ]    }   }';
    public static void parseResponse() {
      
        Map<String, Object> m =   (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        String record = JSON.serialize(m.get('data'));
        Map<String, Object> m1 =   (Map<String, Object>)JSON.deserializeUntyped(record);
        List<Object> list_1 = (List<Object>) m1.get('userInfoRecords');
        for(Integer i=0; i<list_1.size();i++)
        {
            System.debug('List'+list_1[i]);
            Map<String, Object> m2 =   (Map<String, Object>)list_1[i];
            System.debug('m2 :' +m2);
            Contact c = new Contact();
           
            c.Email = (String)m2.get('email');
            c.userId__c = (Integer)m2.get('userId');
            c.Address__c = (String)m2.get('address');
            
            c.FirstName = (String)m2.get('firstName');
            c.gender__c = (String)m2.get('gender');
            c.onboardingStage__c = (String)m2.get('onboardingStage');
            
            c.LastName = (String)m2.get('familyName');
            c.onboardingStage__c = (String)m2.get('onboardingStage');
            c.registrationMemberId__c = (Integer)m2.get('registrationMemberId');
            
           
            
            //date
          String tempDate = (String)m2.get('dateOfBirth');
          System.debug('date:'+tempDate);
      	  Date finalDate=Date.valueOf(tempDate);
          c.Date_of_Birth__c=finalDate;
           
            insert c;
     	  
        }
           
             
        }

    }


















/*public class Trial {
    public static void (){
        String jsonInput = '{    "success": true,    "error": null,    "data": {        "userInfoRecords": [            {                "userId": 93,                "onboardingStage": "COMPLETED",                "registrationMemberId": 150214,                "firstName": "John",                "familyName": "Doe",                "email": "john.doe@testmail.com",                "address": "Unit 52  Askern Industrial Estate Moss Road Doncaster South Yorkshire DN6 0DD United Kingdom",                "gender": "M",                "dateOfBirth": "1982-10-10",                "tfnVerificationStatus": true,                "investmentStrategy": "BALANCED",                "investmentStrategyChangeInProgress": true,                "roundupActive": false,                "roundupAmountCap": null,                "topupActive": null,                "topupAmount": null,                "isInsuranceOpted": true,                "claimTaxBack": null,                "directDebitPermission": null,                "productDisclosureReadStatements": true,                "productDisclosureTfnUsePermission": true,                "productDisclosureCanSendEmails": true,                "beneficiary1": null,                "beneficiary2": null,                "beneficiary3": null,                "beneficiary4": null,                "beneficiary5": null,                "createdOn": "2019-10-22T06:30:27.989Z",                "lastModifiedOn": "2019-10-22T06:31:58.364Z"            }, {                "userId": 99,                "onboardingStage": "COMPLETED",                "registrationMemberId": 150217,                "firstName": "Jane",                "familyName": "Smith",                "email": "test@99.com",                "address": "Unit 54  Askern Industrial Estate Moss Road Doncaster South Yorkshire DN6 0DD United Kingdom",                "gender": "F",                "dateOfBirth": "1987-11-11",                "tfnVerificationStatus": true,                "investmentStrategy": "BALANCED",                "investmentStrategyChangeInProgress": true,                "roundupActive": false,                "roundupAmountCap": null,                "topupActive": null,                "topupAmount": null,                "isInsuranceOpted": true,                "claimTaxBack": null,                "directDebitPermission": null,                "productDisclosureReadStatements": true,                "productDisclosureTfnUsePermission": true,                "productDisclosureCanSendEmails": true,                "beneficiary1": null,                "beneficiary2": null,                "beneficiary3": null,                "beneficiary4": null,                "beneficiary5": null,                "createdOn": "2019-10-22T06:30:27.989Z",                "lastModifiedOn": "2019-10-22T06:31:58.364Z"            }        ]    }   }';

       
         
        
          
        List<Object> UserInfoRecords =(List<Object>)m1.get('userInfoRecords');
         // Map<String, Object> m2 =   (Map<String, Object>)userInfoRecords[1];  
      // String userserialize = JSON.serializePretty(m2);
        //Map<String, Object> m3 =   (Map<String, Object>)JSON.deserializeUntyped(userserialize);
       
       for(Integer i=0; i<UserInfoRecords.size();i++)
       {
            Map<String, Object> m2 =   (Map<String, Object>)userInfoRecords[i];
        for(String key1: m2.keySet()){
            System.debug(key1+'->'+m2.get(key1));
        }
           
       }
       
        Contact con =new Contact();
        con.
       
       
    }
}*/