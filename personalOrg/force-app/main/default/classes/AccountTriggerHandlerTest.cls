@isTest
public with sharing class AccountTriggerHandlerTest {
    @testSetup
    public static void setup(){
        List<account>accList=new List<Account>();
        for(Integer i=0;i<5;i++){
            accList.add(new Account(Name='Test Account '+i,Industry='Media'));
        }
        accList.add(new Account(Name='Test Account 5',Active__c='Yes'));
        insert accList;
    }
    @isTest
    public static void beforeInsertTest(){
        List<account>accList=new List<Account>();
        for(Integer i=0;i<5;i++){
            accList.add(new Account(Name='Test Account '+i,Industry='Media'));
        }
        accList.add(new Account(Name='Test Account 5'));
        Test.startTest();
        insert accList;
        Test.stopTest();
        Account acc=[Select Id,Name,Industry,Rating from Account where Industry='Media' Limit 1];
        System.assertEquals('Hot',acc.Rating);
        acc=[Select Id,Name,Industry,Rating from Account where Industry=null limit 1];
        System.assertEquals('Cold',acc.Rating);
    }
    @isTest
    public static void beforeUpdateTest(){
        List<Account>accList=[Select Id from Account];
        for(Account acc:accList){
            acc.Phone='1234567890';
        }
        Test.startTest();
        update accList;
        Test.stopTest();
        List<Account>accList1=[Select Id,Phone,Description from Account];
        System.assertEquals('Phone number has been updated',accList1[0].Description);
    }
    @isTest
    public static void afterUpdateTest(){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Account acc:[Select Id,Name from Account]){
            oppList.add(new Opportunity(Name=acc.Name+' Opportunity',AccountId=acc.Id,StageName='Prospecting',
            CloseDate=System.today()));
        }
        insert oppList;
        List<Account>accList=[Select Id from Account];
        for(Account acc:acCList){
            acc.Phone='1234567890';
        }
        update accList;
        List<Opportunity>oppList1=[Select Id,Phone__c from Opportunity];
        System.assertEquals(accList[0].Phone,oppList1[0].Phone__c);
    }
    @isTest
    public static void beforeDelete(){
        List<Account>accList=[Select ID from Account where Active__c='Yes'];
        Database.DeleteResult [] dlList=Database.delete(accList,false);
        for(Database.DeleteResult dl:dlList){
            if(dl.isSuccess()){
                System.debug('Id '+dl.getId());
            }else{
                System.debug('Error => '+dl.getErrors()[0].getMessage());
            }
        }
    }
}