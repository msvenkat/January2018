// Submits a record for approval and then approves the request.

public class TestApproval{
     public static void submitAndProcessApprovalRequest(){
     
     account a = new account(name='test');
     insert a;   
     user u1 = [select id from user where alias='Rajesh'];
     
//Create an approval request for the account
            approval.processSubmitrequest req1 = new approval.processsubmitrequest();
            req1.setcomments('submitting for approval');        //To put the comments
            req1.setobjectid(a.id);                             //To specify on which bject 
            req1.setsubmitterid(u1.id);                         //To assign submitter id
            
         //Submit the record to specific process and skip the criteria evaluation
            req1.setProcessDefinitionNameOrId('PTO_Request_Process');
            req1.setSkipEntryCriteria(true);

         //Submit the approval request for that account and assign result to variable to validate with system assert functions
            approval.processresult result = approval.process(req1);          
            system.assert(result.isSuccess());
            system.assertequals('Pending'+ result.getInstanceStatus(),'Instance Status'+ result.getinstancestatus());
           
//Approve the submitted request
         //First, get the ID of the newly created item
               List<Id> Newid = result.getNewWorkitemIds();
      
         //Initiate the new ProcessWorkitemRequest object and populate it
               approval.processworkitemrequest req2 = new approval.processworkitemrequest();
               req2.setcomments('approve the request');
               req2.setaction('approve');
              // req2.setNextapproverids(new id[] {UserInfo.getUserId()});    //Opitional:To get next approver details
               req2.setworkitemid(Newid.get(0));                            //To specify newly created item id that need to be work
               
         //Submit the request for approval
            approval.processResult result1 = approval.process(req2);
            system.assert(result1.isSuccess(),'Result1 Status:'+result1.isSuccess());
            system.assertequals('Approved'+ result1.getInstanceStatus(),'Instance Status'+ result1.getinstancestatus());
    }
}