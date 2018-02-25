public class sample {

  public pagereference openpage(){
   pagereference pg = new pagereference('/apex/wrprcls');
   pg.setredirect(false);
   return pg;
  }
}