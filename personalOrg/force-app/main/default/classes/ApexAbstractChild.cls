public with sharing class ApexAbstractChild extends ApexAbstract {
    public override void show(){
        System.debug('This is child class');
    }
}

// ApexAbstractChild aac=new ApexAbstractChild();
// aac.show();
// aac.display();