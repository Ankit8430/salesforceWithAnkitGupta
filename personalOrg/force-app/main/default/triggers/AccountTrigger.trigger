trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.beforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.beforeUpdate(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            AccountTriggerHandler.beforeDelete(Trigger.old);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.afterInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            //AccountTriggerHandler.afterUpdate(Trigger.new,Trigger.oldMap);
            if(!PreventRecursive.firstCall){
                //Prevent Recursive
                PreventRecursive.firstCall=true;
                AccountTriggerHandler.onAfterUpdateAccount(Trigger.new,Trigger.oldMap);
            }
        }
    }
}