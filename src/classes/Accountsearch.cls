public class Accountsearch {

    public string accname { get; set; }
    public list<contact> conlist { get; set; }
    
    public void go() {
    
        conlist=new list<contact>();
        
        conlist=[select id,name,phone from contact where account.name =:accname];
    }
}