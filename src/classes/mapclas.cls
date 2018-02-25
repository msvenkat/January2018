public class mapclas {
   public static void mm(){
      integer i=0;
      list<account> acclist=new list<account>();
       
      for(i=0;i<=10;i++){
        account acc=new account(name='Account'+i,phone='123');
        acclist.add(acc);
    }
  insert acclist;  
}
}