public with sharing class UpdateParentAccount implements Queueable {
    List<Account>accList=new List<Account>();
    Id parentId;
    public UpdateParentAccount(List<Account>accList,Id parentId){
        this.accList=accList;
        this.parentId=parentId;
    }
    public void execute(QueueableContext Qc){
        for(Account acc:accList){
            acc.parentId=parentId;
        }
        update accList;
    }
}
// List<Account>accList=[Select Id from Account where LastModifiedDAte=today];
// Id parentId='001g500000HwXepAAF';
// UpdateParentAccount upa=new UpdateParentAccount(accList,parentId);
// System.enqueueJob(upa);
