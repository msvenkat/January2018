public class addproduct {
    
    public ApexPages.StandardController controller {get; set;}
    public account Acc {get;set;}
    
    Public string ProductName {get;set;}
    Public string GMMI {get;set;}
    Public string Serial {get;set;}
    Public string GIN {get;set;}    
    
    public addproduct(ApexPages.StandardController controller) {
        
        this.controller =controller;
        this.Acc=(account)controller.getrecord();
    }
   
   
   public void addproduct(){
   
   }
}