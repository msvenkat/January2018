/*Approval process with trigger*/

public class OpportunityApprovalMatrix{
    public static void ApprovalMatrixMatch(Set<Id> OpportunitySet){
      
      set<string> countrySet = new set<string>();
      List<Opportunity> Oppty = new List<Opportunity>();
      list<id> Opptyid = new list<id>();
      list<Opportunity> updatedOpptyList = new  list<Opportunity>();
      list<Approval.ProcessSubmitRequest> submitRequestList = new list<Approval.ProcessSubmitRequest>();
      
       list<Opportunity> opptyList = [select id,name,country__c,Approver1__c,status__c from Opportunity where id in:OpportunitySet];
          for(Opportunity opptyRec : opptyList ){
             countrySet.add(opptyRec.country__c);
             OpptyId.add(opptyRec.id);
          }
       
       list<Approval_Matrix__c> approvalMatrixList=[select id,country__c,User__c from Approval_Matrix__c where id in: OpptyId];
         for(Opportunity opptyRec : opptyList ){
             for(Approval_Matrix__c approvalMatrix : approvalMatrixList ){
               if(opptyRec.country__c == approvalMatrix.country__c){
                 opptyRec.Approver1__c = approvalMatrix.User__c;
                 opptyRec.status__c = 'Open';
                 updatedOpptyList.add(opptyRec);  
                 Oppty.add(opptyRec);              
               }
             }
         } update updatedOpptyList;
// Creating approval request      
       for(Opportunity oppId : Oppty ){
         Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
             req.setComments('Submitting request for approval.');
             req.setObjectId(oppId.id);
             
             // Submit on behalf of a specific submitter
             req.setSubmitterId(oppId.Approver1__c);
             
             // Submit the record to specific process and skip the criteria evaluation
             req.setProcessDefinitionNameOrId('PTO_Request_Process');
             req.setSkipEntryCriteria(true);
             
            //Handling multiple requestes at a time with for loop
             submitRequestList.add(req);
             list<approval.processresult> result = approval.process(submitRequestList);
       }
       
    }

}