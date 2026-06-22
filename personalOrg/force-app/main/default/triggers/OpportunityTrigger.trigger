trigger OpportunityTrigger on Opportunity (after insert,after update,after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
              OpportunityTriggerHandler.updateAnnualRevenue(Trigger.new,null);
        }else if(Trigger.isUpdate){
              OpportunityTriggerHandler.updateAnnualRevenue(Trigger.new,Trigger.old);
        }else{
              OpportunityTriggerHandler.updateAnnualRevenue(null,Trigger.old);
        }
    }
}