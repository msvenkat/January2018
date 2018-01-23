public class SOQL {
    
    public void que(){
/*To fetch single record*/    
    account acc=[select id,name from account limit 1];
    	system.debug('accout fields with single record= '+ acc);
        
/*To fetch multiple records*/
	list<account> ac=[select name,phone from account limit 5];
    	system.debug('accout fields with multiple record= '+ ac);    

//SOQL Types
		//child to parent
			//contact with account--both standard objs
	list<contact> chld2prnt=[select id,name,account.name,account.phone from contact limit 1];
		system.debug('child to parent b/w 2 stndrd objcts reltnshp values='+ chld2prnt);        
        
    		//Job with Account  -- Custom and standard
    list<job__c> c2p1= [select id,name,AccountName__r.name from job__c limit 1];
        system.debug('child to parent b/w stndrd&Custom objcts reltnshp values='+ c2p1);
    
    	//Parent to Child
    		//Account with contact
	list<account> p2c=[select id,name,(select id,name from contacts) from account limit 1];  
        system.debug('Prnt2chld b/w 2 stndrd obj= '+ p2c);
    
    		//Account with Job
    list<account> p2c1=[select name,phone,(select name from jobs__r) from account limit 3];
        system.debug('Prnt2chld b/w stndrd&custm obj= '+ p2c1);
    }
    
}