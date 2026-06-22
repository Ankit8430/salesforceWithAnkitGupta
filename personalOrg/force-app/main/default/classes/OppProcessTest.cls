@isTest
public with sharing class OppProcessTest {
    @isTest
    public static void test1(){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Integer i=0;i<200;i++){
            oppList.add(new Opportunity(Name='Test Opp '+i,
            StageNAme='Prospecting',CloseDate=System.today()));
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
        Test.startTest();
        OppProcess batch=new OppProcess();
        Id batchId=Database.executeBatch(batch,200);
        Test.stopTest();
         Opportunity opp=[Select Id,LeadSource from Opportunity where StageName='Prospecting' limit 1];
         System.assertEquals(opp.LeadSource,'Web');
    }
}