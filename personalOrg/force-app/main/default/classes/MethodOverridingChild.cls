public class MethodOverridingChild extends MethodOverriding {
    public override void display(){
        System.debug('Child');
    }
}

// MethodOverridingChild child=new MethodOverridingChild();
// child.display();

// MethodOverriding parent=new MethodOverriding();
// parent.display();