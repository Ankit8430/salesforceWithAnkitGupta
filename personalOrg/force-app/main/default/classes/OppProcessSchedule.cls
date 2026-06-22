public with sharing class OppProcessSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        OppProcess batch=new OppProcess();
        Id batchId=Database.executeBatch(batch,200);
    }
}
// String sch='0 0 14 ? * * *';
// String jobId=System.schedule('OppProcessSchedule',sch, new OppProcessSchedule());