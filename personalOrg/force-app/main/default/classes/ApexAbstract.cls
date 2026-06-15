public  abstract with sharing class ApexAbstract {
    public ApexAbstract(){} //default Constructor
    public abstract void show();//abstract method,
    public void display(){
        System.debug('This is normal method');
    }
}