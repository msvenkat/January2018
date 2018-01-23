public class Nonstaticclass {
    
    public integer a;
    public integer b;
    
    public void ad(){  
 /* non static method-need to call method with refobj(add) along with constructor */       
        a=1;
        b=2;
        system.debug('a value='+ a+ 'b value ='+ b);
    }

}

/*execution: Nonstaticclass add= new Nonstaticclass();
add.ad();*/