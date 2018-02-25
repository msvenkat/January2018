public class jobapply {

   public boolean checkbox;
   public list<job__c> joblist;
   public list<innerclass> wraper{get;set;}
   public string jobname{get;set;}
   public string detail{get;set;}
     
    public jobapply(){
      checkbox=false;
      joblist=new list<job__c>();
      wraper=new list<innerclass>();
      detail='';
      
      joblist=[select id,name,description__c from job__c where description__c !=:null ];
      
      for(job__c j:joblist){
        
        innerclass inr = new innerclass(checkbox,j);
          wraper.add(inr);
      }
    }
     
   public class innerclass{
     public boolean checkbx{get;set;}
     public job__c job {get;set;}
   
       public innerclass(boolean b,job__c jo){
          checkbx=b;
          job=jo;
       }
   }  
   
  public pagereference openpage(){
     apply();
     pagereference pg = page.jobportal2;
     pg.getparameters().put('name',jobname);
     pg.getparameters().put('desc',detail);
     return pg;
  }
  
   public void Apply(){
     for(innerclass i:wraper){
        if(i.checkbx){
          jobname = i.job.name;
          detail = i.job.description__c;
         } 
     }
     }
}