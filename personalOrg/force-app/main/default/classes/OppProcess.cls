public with sharing class OppProcess implements Database.batchable<sObject>,Database.Stateful{
    public integer record=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([
            Select ID,LeadSource from Opportunity
        ]);
    }
    public void execute(Database.BatchableContext bc,List<Opportunity>oppList){
        for(Opportunity opp:oppList){
            opp.LeadSource='Web';
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
        record+=oppList.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Records => '+record);
    }
}

// OppProcess batch=new OppProcess();
// Database.executeBatch(batch,200);