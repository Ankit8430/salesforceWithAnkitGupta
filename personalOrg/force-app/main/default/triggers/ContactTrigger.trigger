trigger ContactTrigger on Contact (after insert,after update,after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            ContactTriggerHandler.updateTotalContactOnAcc(Trigger.new,null);
        }if(Trigger.isUpdate){
            ContactTriggerHandler.updateTotalContactOnAcc(Trigger.new,Trigger.old);
        }if(Trigger.isDelete){
            ContactTriggerHandler.updateTotalContactOnAcc(null,Trigger.old);
        }
    }
}