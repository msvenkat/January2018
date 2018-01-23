public class StaticClass {
 
    public static integer a=1;
    public static integer b=2;
    
 
    public static void ad() {  //Need to use Void for return type Methods
     /* values of variables in the method will change for that  alone even if we declared them as static*/
        a=100;
        b=200;
        system.debug('a value='+   a+   'b value='+   b);
    }

//exe: StaticClass.ad();

    public static void add(integer x, integer y) {
    
        a=x;
		b=y;
        system.debug('a value='+   a+   'b value='+   b);
    }
//exe: StaticClass.add(10,20);
}