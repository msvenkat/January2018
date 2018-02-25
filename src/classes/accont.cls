public class accont{
  
  public static void accontmeth(list<contact> conlist){
   
   set<id> setid = new set<id>();
   
     for(contact a:conlist){
      setid.add(a.accountid);
     }
  
    list<account> acclist=[select id,name,(select id,accountid from contacts) 
                                            from account where id in:setid];
    
    for(account aa:acclist){
      aa.totalcont__c= aa.contacts.size();
    } 
    update acclist;
  }

}