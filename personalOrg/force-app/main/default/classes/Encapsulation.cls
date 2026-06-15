public with sharing class Encapsulation {
    String name;
    public void setName(String name){
        this.name=name;
    }
    public void getName(){
        System.debug(this.Name);
    }
}

// Encapsulation encap=new Encapsulation();
// encap.setName('Ankit Gupta');
// encap.getName();