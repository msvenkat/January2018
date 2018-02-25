public class DynamicPickList {

   public string country { get;set; }
    
    
    public list<selectoption> getitem() {
        
        list<selectoption> option=new list<selectoption>();
            
            option.add(new selectoption('USA','America'));
            option.add(new selectoption('UK','London'));
            option.add(new selectoption('INDIA','Bharat'));
            
            return option;
       
    }

    public void test(){
    
    }
}