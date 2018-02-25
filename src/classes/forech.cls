public class forech {
    
    list<integer> intl= new list<integer>{10,20,30};
        public void fre1(){
            for(integer i:intl){
                system.debug('Before adding='+ i);
                i=i+5;
                system.debug('after adding='+ i);
            }
        }
}