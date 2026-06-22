public with sharing class AccountContactCalculation {
    @Future
    public static void countContact(Set<Id>accIds){
        List<Account>accList=[Select Id,TotalContact__c,(Select ID from Contacts) from Account
                             where Id=:accIds];
        for(Account acc:accList){
            acc.TotalContact__c=acc.Contacts.size();
        }
        update accList;
    }
}

// Set<Id>accIds=new Set<Id>{'001g500000HwXeeAAF'};
// AccountContactCalculation.countContact(accIds);