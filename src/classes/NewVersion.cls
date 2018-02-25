public with sharing class NewVersion {
    
    private ApexPages.StandardController stdController {get;set;}
    public Notification__c ANE {get;set;}
    
    
    public NewVersion(ApexPages.StandardController controller) {
        //this.stdController= controller;
        this.ANE= (Notification__c )controller.getRecord();
        
        system.debug('YOSHITHA' +ANE);
    }
    
    public PageReference savenewversion() {   
            try{
                update this.ANE;
                }catch(exception e){
                }
            PageReference pageE = new Pagereference('/'+ANE.Id);
            pageE.setRedirect(true);
            return pageE;
 }
}