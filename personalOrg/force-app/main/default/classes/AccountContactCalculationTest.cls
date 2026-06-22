@isTest
public with sharing class AccountContactCalculationTest {
    @isTest
    public static void countContact(){
        Account acc=new Account();
        acc.Name='Test on 22 June';
        insert acc;
        List<Contact>conList=new List<Contact>();
        for(Integer i=0;i<=10;i++){
            conList.add(new Contact(LastNAme='Test '+i,AccountId=acc.Id));
        }
        if(!conList.isEmpty()){
            insert conList;
        }
        Test.startTest();
        Set<Id>accIds=new Set<Id>{acc.Id};
        AccountContactCalculation.countContact(accIds);
        Test.stopTest();
        Account acc1=[Select ID,totalContact__c from Account where Id=:acc.Id];
        System.assertEquals(acc1.TotalContact__c,11);
    }
}