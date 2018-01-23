public class totalcont12 {
    
    public static void totalcont13(list<contact> conlist){
        set<id> con=new set<id>();
    
    for(contact c:conlist){
        con.add(c.accountid);
        }
        
     list<account> acclist=[select id,totalcont__c,(select id,accountid from contacts) from account where id in:con];
     
    for(account a:acclist){
         a.totalcont__c=a.contacts.size();
      
         }
 
        update acclist;
       }
    }