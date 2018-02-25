public class AdditionController {

    public integer a { get; set; }
    public integer b { get; set; }
    public integer c { get; set; }
   
    public void add() {
        c=a+b;
    }

    
    public void sub(){
        c=a-b;
    }
}