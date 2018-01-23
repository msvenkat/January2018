public class AccExtn4PDF {

    public string NotificationRecordID       {get;set;}
    public Notification__c Notilist          {get;set;}
    public list<Notification__c> Notifieldlist {get;set;}
    public string NotificationType           {get;set;}
    public string NotificationNumber         {get;set;}
    public string TargetAudience             {get;set;}
    public string Organiztion                {get;set;}
    public string Version                    {get;set;}
    public string datevalue                  {get;set;}
   
   
    public AccExtn4PDF(ApexPages.StandardController controller) {
        Notifieldlist =new list<Notification__c>();
        
        Datetime LastModifiedDateTime = Datetime.now();  
        Date modi= LastModifiedDateTime.Date();
        datevalue =String.valueOf(modi);
        
        NotificationRecordID=ApexPages.CurrentPage().getparameters().get('id');
        
        Notilist=[select id,RecordType.Name,RecordType.description,Account__c,GMMI__c,LineID__c,Lot_Number__c,Material_Number__c,Target_Audience__c,Organization__c
                              ,Version__c,Components__c,Attachments__c from Notification__c where id =: NotificationRecordID];
          
           if(Notilist.RecordType.Name == 'QN'){
                  headerfields();
            }
           
           else if(Notilist.RecordType.Name == 'SN'){
                  headerfields(); 
           }
           
           else if(Notilist.RecordType.Name == 'SBN'){
                  headerfields();
           }
           
           else if(Notilist.RecordType.Name == 'QH'){
                  headerfields();
           }
           else{
           }
     }
     
     Public void headerfields(){
             NotificationType=Notilist.RecordType.description;
             
             TargetAudience=Notilist.Target_Audience__c;
             Organiztion=Notilist.Organization__c;
             Version=Notilist.Version__c;
           }
}