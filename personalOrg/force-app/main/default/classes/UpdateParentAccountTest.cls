@isTest
public with sharing class UpdateParentAccountTest {
    @isTest
    public static void test1(){
        List<Account>acclist=new List<Account>();
        for(integer i=0;i<=10;i++){
            accList.add(new Account(NAME='Test'+i));
        }
        insert acCList;
        Account acc=new Account(Name='ParentAccount');
        insert acc;
        Test.startTest();
        UpdateParentAccount upa=new UpdateParentAccount(accList,acc.Id);
        System.enqueueJob(upa);
        Test.stopTest();
        Account acc1=[Select Id,Parent.Name from Account where Name='Test1' limit 1];
        System.assertEquals(acc1.Parent.Name,'ParentAccount');
    }
}