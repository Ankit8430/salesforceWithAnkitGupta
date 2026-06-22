@isTest
public with sharing class OppProcessScheduleTest {
    @isTest
    public static void test(){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Integer i=0;i<20;i++){
            oppList.add(new Opportunity(Name='Opp '+i,StageName='Prospecting',
            CloseDate=System.today()));
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
        Test.startTest();
        String sch='0 0 0 ? * * *';
        System.schedule('OppProcessScheduleTest',sch,new OppProcessSchedule());
        Test.stopTest();
    }
}