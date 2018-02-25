public class SendMailToMultipleUsers{

    /*public void SendMailToMultipleUsers(list<account> MailID){
        list<string> mailids = new list<string>();
        for(Account AE : MailID){
            mailids.add(AE.psy__Email_Address__c);
            mailids.add(AE.psy__Branch__c);
        }
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = mailids;
        
//ToAdress,CcAdess,BccAddess are always string array
//Set who the email is sent from.
        message.setReplyTo('sirdavid@bankofnigeria.com');
        message.setSenderDisplayName('Official Bank of Nigeria');
        
//Cc addresses
        list<String> ccTo = new List<String>();
        ccTo.add('pc00469453@techmahindra.com');
        message.setCcAddresses(ccTo);
        
//Bcc Addresses
        list<String> BccTo = new List<String>();
        BccTo.add('puttaiahsfdc43@gmail.com');
        message.setCcAddresses(BccTo);
        
        message.charset       = 'Not Sure';
        message.subject       = 'Hello Salesforce Testing';
        message.plainTextBody = 'Hello Good Morning Salesforce';
        
//Set HTML Body.
        String body = 'Dear ' + MailID[0].name+ ', ';
        body += 'I confess this will come as a surprise to you.';
        body += 'I am John Alliston CEO of the Bank of Nigeria.';
        message.setHtmlBody(body);
        
//We can use any of the below . All are represents the same.
        Messaging.SingleEmailMessage[] messages = new list<Messaging.SingleEmailMessage>{message};
        //3.Messaging.SingleEmailMessage[] messages     = new Messaging.SingleEmailMessage[]{message};
        
        //1.list<Messaging.SingleEmailMessage> messages = new list<Messaging.SingleEmailMessage>();
        //messages.add(message);
        //2.list<Messaging.SingleEmailMessage> messages = new list<Messaging.SingleEmailMessage>{message};
        
       
//Sending mails in different ways.
        messaging.SendEmail(Messages);
        //messaging.sendEmail(new Messaging.SingleEmailMessage [] {message});
        
        //Messaging.SendEmailResult[] result = messaging.SendEmail(Messages);
        /*if(result[0].success){
            system.debug('Message has been sent to ' +result[0]);
        }
        else{
            system.debug('Message ffailed to send to ' +result[0].errors[0].message);
        }
    }*/

}