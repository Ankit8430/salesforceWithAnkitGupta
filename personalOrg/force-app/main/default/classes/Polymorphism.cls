public with sharing class Polymorphism {
    public void add(){
        Integer a=5;
        Integer b=10;
        Integer sum=a+b;
        System.debug('Sum ==> '+sum);
    }
    public void add(Integer a,Integer b){
        Integer sum=a+b;
        System.debug('Sum => '+sum);
    }
}
//Polymorphism p=new Polymorphism();
//p.add(10,20);