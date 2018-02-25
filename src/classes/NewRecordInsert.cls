public class NewRecordInsert {
   
   public Account accnt{get;set;}
   
    public void sav() {
      
      account acc = new account();
      
      acc.Name = accnt.Name;
      //acc.AccountNumber = accnt.Number;
      acc.Phone = accnt.Phone;
      
      
    }

}