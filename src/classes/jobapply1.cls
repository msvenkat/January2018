public class jobapply1 {

  public string jobname1 {get;set;}
  public string jobdesc1 {get;set;}
      
  public jobapply1(){
  
   jobname1=apexpages.currentpage().getparameters().get('name');
   jobdesc1=apexpages.currentpage().getparameters().get('desc'); 
   }
   
   public pagereference openpage1(){
     pagereference pg1 = page.jobportal3;
     pg1.getparameters().put('name1',jobname1);
     return pg1;
  }
}