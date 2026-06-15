public with sharing class CollectionApex {
    public static void listMethod() {
        List<Account> accList = [SELECT Id, Name FROM Account];
        for(Account acc : accList) {
            System.debug(acc.Name);
        }
    }
    public static void setMethod(){
        List<Account> accList = [SELECT Id, Name FROM Account];
        Set<Id> accountIds=new Set<Id>();
        for(Account acc:accList){
            accountIds.add(acc.Id);
        }
        if(!accountIds.isEmpty()){
            for(Id id:accountIds){
                System.debug('Id:'+id);
            }
        }
    }
    public static void mapMethod(){
        List<Account>accList=[Select Id,Name from Account];
        Map<Id,Account>accMap=new Map<Id,Account>();
        for(Account acc:accList){
            accMap.put(acc.Id,acc);
        }
        if(!accMap.isEmpty()){
            for(Id id:accMap.keySet()){
                System.debug('Id => '+id+' Name => '+accMap.get(id));
            }
        }
    }
}

//CollectionApex.listMethod();
//CollectionApex.setMethod();
//CollectionApex.mapMethod();