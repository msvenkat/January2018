public class wapperclass{


   public boolean checkbox;
   public list<job__c> joblist;
   public list<innerclass> warvariable {get;set;}
   public string jobname{get;set;}
    
    public wapperclass(){
        checkbox = false;
        joblist = new list<job__C>();
        warvariable = new list<innerclass>();
        
        joblist =[select name from job__c limit 10];
        for(job__C j:joblist){
            
           innerclass inr=new innerclass(checkbox,j);
           warvariable.add(inr); 
        }
        
    }
    
    public class innerclass{
        public boolean chkbx{get;set;}
        public job__c job{get;set;}
    
       public innerclass(boolean chk,job__c jo){
            chkbx=chk;
            job=jo;
        }
    }
    
    public void show(){
     for(innerclass i:warvariable){
         if(i.chkbx){
           jobname=i.job.name;
       }    
     }
    }
}