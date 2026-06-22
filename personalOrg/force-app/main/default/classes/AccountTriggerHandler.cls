public with sharing class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newAccounts){
        for(Account acc:newAccounts){
            if(acc.Industry!=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }else{
                acc.Rating='Cold';
            }
        }
    }
    public static void afterInsert(List<Account>newAccounts){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Account acc:newAccounts){
            oppList.add(new Opportunity(Name=acc.Name+' Opportunity',AccountId=acc.Id,StageName='Prospecting',
            CloseDate=System.today()));
        }
        insert oppList;
    }
    public static void beforeUpdate(List<Account> updateAccounts,Map<Id,Account> accMap){
            for(Account acc:updateAccounts){
                if(acc.Phone!=accMap.get(acc.Id).Phone){
                    acc.Description='Phone number has been updated';
                }
            }        
    }
    public static void afterUpdate(List<Account>updateAccounts,Map<Id,Account>oldMap){
        Map<Id,Account>accMap=new Map<Id,Account>();
        for(Account acc:updateAccounts){
            if(acc.Phone!=oldMap.get(acc.Id).Phone){
                accMap.put(acc.Id,acc);
            }
        }
        List<Opportunity>oppList=new List<Opportunity>();
        for(Opportunity opp:[Select Id,AccountId,Phone__c from Opportunity where AccountId IN:accMap.keySet()]){
                opp.Phone__c=accMap.get(opp.AccountId).Phone;
                oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }
    public static void beforeDelete(List<Account>accList){
        for(Account acc:accList){
            if(acc.Active__c=='Yes'){
                acc.addError('You can not delete this record beacuse Account is Active');
            }
        }
    }
    public static void onAfterUpdateAccount(List<Account>accList,Map<Id,Account>accMap){
        List<Account>updateAccounts=new List<Account>();
        for(Account acc:accList){
            updateAccounts.add(new Account(Id=acc.Id,Description='Test'));
        }
        update updateAccounts;
    }
}