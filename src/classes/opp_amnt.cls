public class opp_amnt{
  
    public static void opp_amnt_methd(list<opportunity> lst){
       
    double totl_amnt = 0;
        
        for(opportunity opp1:[select amount from opportunity where createddate=today
                                                        and createdbyid=:userinfo.getuserid()]){
            totl_amnt +=opp1.amount;
        }
        
        for(opportunity opp2 : lst) {
          
            totl_amnt +=opp2.amount;
            
            if(totl_amnt > 1000)
            opp2.adderror('entered max amount per a day');
        }
    }
}