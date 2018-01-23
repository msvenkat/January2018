public class DocumentEmailController {

    public String documents { get; set; }
    public String email     { get; set; }

    public PageReference Send() {
        Document doc = [select id, name, body, contenttype, developername, type 
                        from Document where id = :documents];

        //Define File attachment
        //messaging.EmailAttachment attach = new messaging.EmailAttachment(); - where?
        messaging.EmailFileAttachment attach = new messaging.EmailFileAttachment();
        attach.setcontenttype(doc.contenttype);
        attach.setFileName(doc.developername + '-' + doc.type);
        attach.setInline(false);
        attach.body=doc.body;
        
        //Define the mail compossing 
        messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
        mail.SetUseSignature(false);
        mail.SetToAddresses(new string[] {email});
        mail.SetBccSender(false);
        mail.setSenderDisplayName('Salesforce');
        mail.SetSubject('Email with document');
        mail.SetHtmlBody('Hi, Here is the document you requested' + doc.name);
        mail.SetFileAttachments(new messaging.EmailFileAttachment[] {attach});
        
        //Sending mail
        Messaging.sendEmail(New Messaging.SingleEmailMessage[] {mail});
        apexpages.addmessage(new apexpages.Message(apexpages.severity.Info, 'Email with Document is sent' +email));
        return null;
    }
    
   public List<SelectOption> documentss {
    get {
      if (documentss == null) {
        documentss = new List<SelectOption>();
        documentss.add(new SelectOption('015280000009eXK','Image'));
      }
      return documentss;
    }
    set;
  }
}