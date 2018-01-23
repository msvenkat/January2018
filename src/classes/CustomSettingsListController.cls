public with sharing class CustomSettingsListController {
    public string selectedIso {get;set;}
    
    public list<selectOption> getISOCodes() {
         
         list<selectOption> options=new list<selectOption>();
        
            for(ISO_Countries__c iso : ISO_Countries__c.getall().values()){
                options.add(new selectOption(iso.ISO_Codes__c,iso.Name+ ' - '+iso.ISO_Codes__c));
                
            }
        return options;
            }
     public void test() {
            
        }
    
    }