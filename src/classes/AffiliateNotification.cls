/*
   @Author Puttaiah Chamarthi   
   @name AffiliateNotification
   @CreatedDate 05.10.2016
   @Description To create New Notification
   @Version <1.0>
   @reference Service Core 1.1
*/

public with sharing class AffiliateNotification {
    
    public Notification__c RecordtypeFromURL {get;set;}
    public String  RecordTypeForPage         {get;set;}
    //public Notification__c AN{get;set;}
    //public string  ImplementationTime        {get;set;}
    //public string  Imtimeperd                {get;set;}
    //public string  ImplementationTimePeriod  {get;set;}
    //public string  Action                    {get;set;}
    
    
    public boolean PITCODE                   {get;set;}
    public boolean MODIFICATIONCODE          {get;set;}
    public boolean Editcontrol               {get;set;}
    public boolean FeedbackCheckBoxDisable   {get;set;}
    //public boolean EMODV {get;set;}
    //public boolean EPITV {get;set;}
    //public boolean FeedDueDate               {get;set;}
    //public boolean FeedDueDateDisable        {get;set;}
    //public boolean PITCheckboxBeforeSavingecord {get;set;}
    //public boolean ModificationCheckboxBeforeSavingecord {get;set;}
    
    
    //Private variables
    //private boolean    PITCheckbox;
    //private boolean    ModificationCheckbox;
    //private boolean    FeedbackCheckbox;
    //Private string     RecordtypeFromURL;
    
    Private recordtype   RecordtypeForQuery;
    private static final string NULL_STR='';
    //private static final string NONE_STR='None';    
    
    private static final string IMPLEMENTATION_TIME_MANADATORY_STR                   ='Field Implemenation Mandatory';
    private static final string IMPLEMENTATION_TIME_MANADATORY_BUSINESS_REQUIRE_STR  ='Field Implementation Business Required';
    private static final string IMPLEMENTATION_TIME_RECOMMENDED_STR                  ='Field Implementation Recommended'; 
        
    private static final string MESSAGE_NOTIFICATION_TITLE_ERROR                     ='Please Enter Notification Title';
    private static final string MESSAGE_NOTIFICATION_STATUS_ERROR                    ='Select Status as "Draft" for New Notification Type';
    private static final string MESSAGE_NOTIFICATION_BUSINESS_AREA_ERROR             ='Please select Business Area corresponding to organization';
    private static final string MESSAGE_NOTIFICATION_ORGANIZATION_ERROR              ='please select organization';
    private static final string MESSAGE_SAFTY_BOARD_MEETING_NUMBER_ERROR             ='Please Enter Safty Board Meeting Number for SBN Notification Type';
    private static final string MESSAGE_TRACKING_CODE_TITLE_ERROR                    ='Please Enter Tracking Code Title When "Modification Tracking Require" or "PIT Tracking Required" is checked';
    private static final string MESSAGE_IMPLEMENTATION_TIMING_ERROR                  ='Please select Implementation Timing When "Modification Tracking Require" is checked';
    
    private static final string MESSAGE_IMPLEMENTATION_DATE_ERROR=
    'Please Enter Implementation date When "Modification Tracking Require" is checked and Implementation Timing is either "Field Implementation Mandatory" or "Field Implementation Business required"';
    private static final string MESSAGE_IMPLEMENTATION_TIMING_PERIOD_ERROR=
    'Please select Implementation Timing Period when Implementation Timing is either "Field Implementation Mandatory" or "Field Implementation Business required"';
    
    public AffiliateNotification(ApexPages.StandardController controller) {
        PITCODE                               =false;
        MODIFICATIONCODE                      =false;
        Editcontrol                           =true;
        FeedbackCheckBoxDisable               =false;
        //AN                                    =new Notification__c();
        //FeedDueDate                           =false;
        //PITCheckboxBeforeSavingecord          =false;
        //ModificationCheckboxBeforeSavingecord =false;
        //EMODV                                 =false;
        //EPITV=false;
        
        //RecordtypeFromURL=apexpages.currentpage().getparameters().get('RecordType');
        this.RecordtypeFromURL=(Notification__c)controller.getrecord();
        RecordtypeForQuery=[select name from recordtype where id =: RecordtypeFromURL.recordtypeid];
        RecordTypeForPage=RecordtypeForQuery.name;
        
        if(RecordtypeFromURL.Status__c =='Published'){
          Editcontrol=false;
          ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Not allowed to edit the notification if the status is Published')); 
        }
        else if(RecordtypeForQuery.name =='SBN' ){
           //FeedbackCheckbox=true;
           FeedbackCheckBoxDisable=true;
           RecordtypeFromURL.Is_feedback_required__c=true;
           if(RecordtypeFromURL.feedback_due_date__c==null){
           //RecordtypeFromURL.feedback_due_date__c=Date.today().addDays(90);
           RecordtypeFromURL.feedback_due_date__c=Date.today().addmonths(+3);
           }
        }
        /*else if(RecordtypeForQuery.name =='SN' || RecordtypeForQuery.name =='QH'){
                //FeedbackCheckbox=false;
                RecordtypeFromURL.Is_feedback_required__c=false;
                FeedbackCheckBoxDisable=true;
        }*/
       
    }
    
    
    public void ModificationCODE(){
        MODIFICATIONCODE=true;
        RecordtypeFromURL.Generate_Modification_Codes__c='sample';
    }
    public void PITCODE(){
        PITCODE=true;
        RecordtypeFromURL.Generate_PIT_Code__c='sample';
    }

    public void TP(){
      if(RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_STR|| RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_BUSINESS_REQUIRE_STR){
        if(RecordtypeFromURL.Implementation_Timing_Period__c=='Next site visit'){
            RecordtypeFromURL.Implementation_date__c=Date.today().addmonths(+6);
        }
        else if(RecordtypeFromURL.Implementation_Timing_Period__c=='Extra site visit'){
                RecordtypeFromURL.Implementation_date__c=Date.today().addmonths(+14);
        }
      }
    }
    
    public void FeedbackDueDate(){
       if(RecordtypeFromURL.Is_feedback_required__c== true && RecordtypeForQuery.name =='QN' ){
             RecordtypeFromURL.feedback_due_date__c=Date.today().addmonths(+3);
       }
    }
    
    //Trigger method to generate AutoNumber    
     public Static void onInsert( list<Notification__c> newList,map<id,Notification__c> oldList){
            system.debug('map list' +oldList);
            integer myDate = system.today().year(); 
            Recordtype RecordtypeForAutoNumber=[select id,name from Recordtype where id=:newlist[0].recordtypeid];
      
             list<Notification__c> ListNotification = [SELECT recordtype.name,NotificationNumber__c,Business_Area__c,Safety_Board_Meeting_No__c FROM Notification__c n 
                                                              where n.recordtypeid =:RecordtypeForAutoNumber.Id and NotificationNumber__c !=null order by createddate desc limit 1];
             
             string num =ListNotification .size() != 0 ? ListNotification [0].NotificationNumber__c.substringAfterLast('-') : '0';
             //string Orgnum =ListNotification [0].NotificationNumber__c.substringAfterLast('-') : '0';
             for(Notification__c N:newList){
                 integer intcount=integer.valueof(num);
                 //intcount++; 
                if(oldList!=null){
                   Notification__c oldnot=oldList.get(N.Id);
                   if(N.Organization__c != oldnot.Organization__c) {
                      N.NotificationNumber__c= RecordtypeForAutoNumber.Name+'-'+N.Business_Area__c+ '-'+ myDate + '-'+ListNotification [0].NotificationNumber__c.substringAfterLast('-'); 
                   }
                 }
                else if(RecordtypeForAutoNumber.name !='SBN'){
                    intcount++;
                    N.NotificationNumber__c= RecordtypeForAutoNumber.Name+'-'+N.Business_Area__c+ '-'+ myDate + '-'+intcount; 
                }
                else{
                    N.NotificationNumber__c= RecordtypeForAutoNumber.Name+'-'+N.Business_Area__c+ '-'+ myDate + '-'+N.Safety_Board_Meeting_No__c;    
                }
            }
     }


    
     public PageReference save1(){
             PageReference Page1;
                
                if(RecordtypeFromURL.Name == Null || RecordtypeFromURL.Name == NULL_STR){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_NOTIFICATION_TITLE_ERROR)); 
                }
                
                else if(RecordtypeFromURL.Status__c== Null){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_NOTIFICATION_STATUS_ERROR)); 
                }
                
                else if(RecordtypeFromURL.Status__c =='Published' && RecordtypeFromURL.Publication_Date__c==null){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Publication Date is required when Status is Published')); 
                }
                
                else if(RecordtypeFromURL.Organization__c == Null){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_NOTIFICATION_ORGANIZATION_ERROR)); 
                }
                
                else if(RecordtypeFromURL.Business_Area__c== Null){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_NOTIFICATION_BUSINESS_AREA_ERROR)); 
                }
                
                else if((RecordtypeFromURL.Safety_Board_Meeting_No__c == Null) && (RecordtypeForQuery.name =='SBN') ){
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_SAFTY_BOARD_MEETING_NUMBER_ERROR));   
                }
                
                else if((RecordtypeFromURL.PIT_Code_Tracking__c || RecordtypeFromURL.Requires_modification_tracking__c) && (RecordtypeFromURL.Modification_Title__c == Null || RecordtypeFromURL.Modification_Title__c == NULL_STR))
                {              
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_TRACKING_CODE_TITLE_ERROR));
                }
                
                else if(RecordtypeFromURL.Requires_modification_tracking__c && RecordtypeFromURL.implementation_timing__c== null )
                {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_IMPLEMENTATION_TIMING_ERROR));
                }
                
                /*else if(RecordtypeFromURL.Requires_modification_tracking__c && RecordtypeFromURL.Implementation_date__c == null &&  (RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_STR|| RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_BUSINESS_REQUIRE_STR))
                {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_IMPLEMENTATION_DATE_ERROR));
                }*/
                
                else if(RecordtypeFromURL.Requires_modification_tracking__c  && RecordtypeFromURL.Implementation_Timing_Period__c== null && (RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_STR|| RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_BUSINESS_REQUIRE_STR))
                {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,MESSAGE_IMPLEMENTATION_TIMING_PERIOD_ERROR));
                }
                
                else if(RecordtypeFromURL.Implementation_Timing_Period__c=='Next site visit' && RecordtypeFromURL.Implementation_date__c > Date.today().addmonths(+6))
                {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Can not be more than 6 months if Implementstion Timing Period is "Next Visit"'));
                }
                
                else if(RecordtypeFromURL.Implementation_Timing_Period__c=='Extra site visit' && RecordtypeFromURL.Implementation_date__c > Date.today().addmonths(+14))
                {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Can not be more than 14 months if Implementstion Timing Period is "Extra Visit"'));
                }
                
                //Insert or Update the record
                else
                {
                   //Re-assign PIT Code filed to Null if PIT Code Tracking is checked and then again unchecked immediately.
                    if(!RecordtypeFromURL.PIT_Code_Tracking__c){
                        //AN.Generate_PIT_Code__c=null;
                        RecordtypeFromURL.Generate_PIT_Code__c=null;
                    }
         
                    //Re-assign below all fileds which are dependent on Modification Tracking to Null if it is checked and then again unchecked immediately.
                    if(!RecordtypeFromURL.Requires_modification_tracking__c){
                        RecordtypeFromURL.Modification_Title__c=null;
                        RecordtypeFromURL.Generate_Modification_Codes__c=null; 
                        RecordtypeFromURL.implementation_timing__c=null;
                        RecordtypeFromURL.Implementation_Timing_Period__c= null; 
                        RecordtypeFromURL.Implementation_date__c=null;  
                        //RecordtypeFromURL.Components__c=null; 
                    }
                    
                    if(!RecordtypeFromURL.Is_feedback_required__c){
                        RecordtypeFromURL.feedback_due_date__c=null;
                    }
                    
                    /*if(RecordtypeFromURL.Requires_modification_tracking__c ==true && RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_RECOMMENDED_STR){
                       RecordtypeFromURL.Implementation_Timing_Period__c= null; 
                       RecordtypeFromURL.Implementation_date__c=null;
                    } */
                    
                  /*  //Dafault assgin Feedback due date to + 3 months(90 days) from current date when NT is "QN" and Feedback Due date is not entered.
                    if(RecordtypeFromURL.feedback_due_date__c == null  && RecordtypeForQuery.name =='QN' ){
                       RecordtypeFromURL.feedback_due_date__c=Date.today().addDays(90);
                    }  
         
                    //Default assign Implementation Date when Modification Tracking is checked and Implementation Date is not entered.
                    if(RecordtypeFromURL.Requires_modification_tracking__c ==true && RecordtypeFromURL.Implementation_date__c ==Null && RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_STR|| RecordtypeFromURL.implementation_timing__c==IMPLEMENTATION_TIME_MANADATORY_BUSINESS_REQUIRE_STR ){
                       
                       //Default to +6 months(180 days) from current date if Implementation Time Period is "Next Visit" 
                       if(RecordtypeFromURL.Implementation_Timing_Period__c=='Next site visit'){
                             RecordtypeFromURL.Implementation_date__c=Date.today().addDays(180);
                       }
                       //Default to +14 months(520 days) from current date if Implementation Time Period is "Next Visit" 
                       else if(RecordtypeFromURL.Implementation_Timing_Period__c=='Extra site visit'){
                             RecordtypeFromURL.Implementation_date__c=Date.today().addDays(520);
                       }
                     } */
                    
                 //Insert (AN);
                 upsert(RecordtypeFromURL);
                 //Page1 = new PageReference('/'+AN.id);
                 Page1 = new PageReference('/'+RecordtypeFromURL.id);
                 Page1.setRedirect(true);
                }
             return Page1;
    }
    
    public pagereference cancel(){
      PageReference Page = new PageReference('/a0K/o');
      Page.setRedirect(true);
      return Page;    
    }
    
    public pagereference cancelE(){
      PageReference Page = new PageReference('/'+RecordtypeFromURL.id);
      Page.setRedirect(true);
      return Page;    
    }
    
    public pagereference SaveNew(){
      
      String str = ApexPages.currentPage().getUrl().subStringAfter('/').substringBefore('?');
      return new PageReference('/apex/' + str).setRedirect(true);    
    }
   
}