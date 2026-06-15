public with sharing class ApexInterfaceChild implements ApexInterface {
    public void show(){
        System.debug('Child Apex Interface');
    }
}

// ApexInterfaceChild aic=new ApexInterfaceChild();
// aic.show();