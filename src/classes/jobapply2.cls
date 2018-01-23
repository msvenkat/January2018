public class jobapply2 {

   public string jobname2 {get;set;}
   public blob resume{get;set;}
   
  public jobapply2(){
    
    jobname2=apexpages.currentpage().getparameters().get('name1');
  }
}