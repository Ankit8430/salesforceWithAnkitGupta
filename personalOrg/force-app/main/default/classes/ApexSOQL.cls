public with sharing class ApexSOQL {
    public static void insertOppAccToAccount(){
        List<Account>accList=[Select Id,Name from Account where CreatedDate=THIS_YEAR];
        List<Opportunity>oppList=new List<Opportunity>();
        for(Account acc:accList){
            oppList.add(new Opportunity(Name='Opp '+acc.Name,
            StageName='Prospecting',AccountId=acc.Id,CloseDate=System.today()));
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    public static void updatePhoneOnAccount(){
        List<Account>accList=[Select ID,Phone from Account where CreatedDate=THIS_MONTH];
        for(Account acc:accList){
            acc.Phone='123456790';
        }
        update accList;
    }
    public static void updateOppDesc(){
        List<Opportunity>oppList=[Select ID,Description,StageName from Opportunity where CreatedDate=THIS_MONTH];
        for(Opportunity opp:oppList){
            if(opp.StageName=='Closed Won' || opp.StageName=='Closed Lost'){
                opp.Description='Update description with '+opp.StageName;
            }
        }
        update oppList;
    }
}

//ApexSOQL.insertOppAccToAccount();
//ApexSOQL.updatePhoneOnAccount();
//ApexSOQL.updateOppDesc();