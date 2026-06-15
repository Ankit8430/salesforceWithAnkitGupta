public with sharing class ApexDML {
    public static void insertDML(){
        try{
            List<Account>accList=new List<Account>();
            for(Integer i=0;i<10;i++){
                accList.add(new Account(Name='Test'+i));
            }
            if(!accList.isEmpty()){
                insert accList;
            }
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
    public static void updateDML(){
        try{
            List<Account>accList=[Select ID,Phone from Account where CreatedDate=today];
            for(Account acc:acCList){
                acc.Phone='1234567890';
            }
            if(!accList.isEmpty()){
                update accList;
            }
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
    public static void deleteDML(){
        try{
            List<Account>accList=[Select Id from Account where CreatedDate=today];
            if(!acCList.isEmpty()){
                delete accList;
            }
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
}
//ApexDML.insertDML();
//ApexDML.updateDML();
//ApexDML.deleteDML();