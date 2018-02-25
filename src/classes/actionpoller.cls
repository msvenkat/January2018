public class actionpoller {

    public PageReference actionpoller() {
        return null;
    }


        public DateTime DT{get;set;}
        
        public string u{get;set;}
        
    public actionpoller(){
        DT=system.now();
        u=userinfo.getuserid();
    }
}