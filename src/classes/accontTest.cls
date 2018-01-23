@istest
public class accontTest{
 
  static testmethod void accontmethTest(){
 
     account a1 = new account();
     a1.name='account24';
     insert a1;
 
   list<contact> conl = new list<contact>();
   
   for(integer i=1;i<=6;i++){
    contact con = new contact();
    
    con.lastname ='contact24'+i;
    con.accountid = a1.id;   
   
   }
   insert conl;
   
   accont.accontmeth(conl);

   }

}