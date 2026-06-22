public with sharing class ContactTriggerHandler {
    public static void updateTotalContactOnAcc(List<Contact>newContacts,List<Contact>oldContacts){
        Map<Id,Integer>totalContactMap=new Map<Id,Integer>();
        if(newContacts!=null){
            for(Contact con:newContacts){
                if(con.AccountId!=null){
                    if(!totalContactMap.containsKey(con.AccountId)){
                        totalContactMap.put(con.AccountId,0);
                    }
                    totalContactMap.put(con.AccountId,totalContactMap.get(con.AccountId)+1);
                }
            }
        }
        if(oldContacts!=null){
            for(Contact con:oldContacts){
                if(con.AccountId!=null){
                    if(!totalContactMap.containsKey(con.AccountId)){
                        totalContactMap.put(con.AccountId,0);
                    }
                    totalContactMap.put(con.AccountId,totalContactMap.get(con.AccountId)-1);
                }
            }
        }
        List<Account>updateAccounts=new List<Account>();
        Map<Id,Account>exitingAccounts=new Map<Id,Account>([
            Select Id,TotalContact__c from Account where Id IN:totalContactMap.keySet()
        ]);
        for(Id id:totalContactMap.keySet()){
            Integer newTotalContact=totalContactMap.get(id);
            Account acc=exitingAccounts.get(id);
            if(acc!=null){
                acc.TotalContact__c=(acc.TotalContact__c!=null?acc.TotalContact__c:0)+newTotalContact;
                updateAccounts.add(acc);
            }
        }
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
        }
    }
}