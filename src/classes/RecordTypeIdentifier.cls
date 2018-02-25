public class RecordTypeIdentifier {

    public Notification__c NotificationRecordType      {get;set;}
    public string  recordid                            {get;set;}
    public Boolean renderpage1                         {get;set;}
    public Boolean renderpage2                         {get;set;}
    public Boolean renderpage3                         {get;set;}
    public Boolean renderpage4                         {get;set;}
    public string  NotificationType                    {get;set;}
    public string  format                              {get;set;}
    
    Public pagereference QualityNotification(){
             PageReference openvfpage = New Pagereference('/apex/PDF');
             openvfpage.getparameters().put('idv1',recordid);
             openvfpage.getparameters().put('type',format);
             return openvfpage.setRedirect(true);
    } 
    Public pagereference ServiceNotification(){
            
             PageReference openvfpage = New Pagereference('/apex/PDF');
             openvfpage.getparameters().put('idv1',recordid);
             openvfpage.getparameters().put('type',format);
             return openvfpage.setRedirect(true);
    } 
    Public pagereference SaftyBoardNotification(){
             PageReference openvfpage = New Pagereference('/apex/PDF');
             openvfpage.getparameters().put('idv1',recordid);
             openvfpage.getparameters().put('type',format);
             return openvfpage.setRedirect(true);
    } 
    Public pagereference QuickHitterNotification(){
             PageReference openvfpage = New Pagereference('/apex/PDF');
             openvfpage.getparameters().put('idv1',recordid);
             openvfpage.getparameters().put('type',format);
             return openvfpage.setRedirect(true);
    } 
      
    public RecordTypeIdentifier(ApexPages.StandardController controller) {
        
        recordid =ApexPages.CurrentPage().getparameters().get('id');
        NotificationRecordType=[select id,RecordType.Name,RecordType.description,Account__c,GMMI__c,LineID__c,Lot_Number__c,Material_Number__c
                              from Notification__c where id =: recordid limit 1 ];
                         
            
               if(NotificationRecordType.RecordType.name == 'QN'){
                  renderpage1=true;
                  NotificationType=NotificationRecordType.RecordType.description;
                  format='pdf';
                }
               else if(NotificationRecordType.RecordType.name =='SN'){
                  renderpage2=true;
                  NotificationType=NotificationRecordType.RecordType.description;
                  format='pdf';
                }
              else if(NotificationRecordType.RecordType.name=='SBN'){
                  renderpage3=true;
                  NotificationType=NotificationRecordType.RecordType.description;
                  format='pdf';
                }
                if(NotificationRecordType.RecordType.name=='QH'){
                  renderpage4=true;
                  NotificationType=NotificationRecordType.RecordType.description;
                  format='pdf';
                }
             
    }
    
}