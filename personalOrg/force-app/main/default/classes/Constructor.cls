public with sharing class Constructor {
    String name;
    public Constructor(){
        System.debug('Non Parameterize Constructor');
    }
    public Constructor(String name){
        this.name=name;
        System.debug('Parameterize Constructor => '+this.name);
    }
    public Constructor(Constructor con){
        System.debug('Copy Constructor ==>'+con.name);
    }
}

//Constructor con=new Constructor('Ankit Gupta');
//Constructor con1=new Constructor(con);