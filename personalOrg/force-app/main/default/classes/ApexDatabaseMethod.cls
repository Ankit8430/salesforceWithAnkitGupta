public with sharing class ApexDatabaseMethod {
    public static void insertDatabaseMethod(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<10;i++){
            accList.add(new Account(Name='Test'+i));
        }
        accList.add(new Account());
        if(!accList.isEmpty()){
            Database.SaveResult[] srList=Database.insert(accList,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('Id => '+sr.getId());
                }
                else{
                    System.debug('Error => '+sr.getErrors()[0].getMessage());
                }
            }
        }
    }
    public static void updateDatabaseMethod(){
        List<account>acCList=[Select ID,Phone from Account where CreatedDate=today];
        for(Account acc:accList){
            acc.Phone='1234567890';
        }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Id => '+sr.getId());
            }else{
                System.debug('Error => '+sr.getErrors()[0].getMessage());
            }
        }
    }
    public static void upsertDatabaseMethod(){
        List<account>accList=[Select Id,Phone,Name from Account where CreatedDate=today];
        List<Account>upsertAccounts=new List<Account>();
        for(Account acc:accList){
            acc.Phone='1234567891';
            upsertAccounts.add(acc);
        }
        upsertAccounts.add(new Account());
        Database.UpsertResult[] upList=Database.upsert(upsertAccounts,false);
        for(Database.UpsertResult up:upList){
            if(up.isSuccess()){
                System.debug('Id => '+up.getId());
            }else{
                System.debug('Error => '+up.getErrors()[0].getMessage());
            }
        }
    }
    public static void deleteDatabaseMethod(){
        List<Account>accList=[Select Id from Account];
        Database.DeleteResult [] dlList=Database.delete(accList,false);
        for(Database.DeleteResult dl:dlList){
            if(dl.isSuccess()){
                System.debug('Id => '+dl.getId());
            }else{
                System.debug('Error => '+dl.getErrors()[0].getMessage());
            }
        }
    }
}

//ApexDatabaseMethod.insertDatabaseMethod();
//ApexDatabaseMethod.updateDatabaseMethod();
//ApexDatabaseMethod.upsertDatabaseMethod();
//ApexDatabaseMethod.deleteDatabaseMethod();