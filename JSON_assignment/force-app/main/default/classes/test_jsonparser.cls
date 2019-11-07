@isTest
public class test_jsonparser {
    
    static testmethod void fun_1()
    {
       Test.startTest();
        JSONParser.parseResponse();
        Test.stopTest();
        
        
        List<Contact> con2= new List<Contact>();
        con2=[SELECT Id,LastName FROM Contact ];
        system.assertEquals(2, con2.size());
    } 
    
    
}