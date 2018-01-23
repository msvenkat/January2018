//Trigger casrtgr handler class

public class casetgrclass{
 
  public static void meth(list<case> clist){
    map<string,Technician__c> t=Technician__c.getall();
     for(case c1:clist){
       c1.Technician_Email_Address__c =t.get(c1.Technician__c).Email__c;
     }
  
  } 

}