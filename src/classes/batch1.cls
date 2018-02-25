global class batch1 implements database.batchable<sobject>{

    global database.querylocator start(database.batchablecontext BC){
    
        string query='select name from job__c';
        return database.getquerylocator(query);  }
        
     global void execute(database.batchablecontext BC, list<sobject> scope) {
         
      
         delete scope;
     }
        
    global void finish(database.batchablecontext BC){
    }
}

//execution
//								batch1 b1 = new batch1();
//								database.execute(b1,optional batch size)

//	calling other batch from one batch - specify in the finish method
//				global void finish(batabase.batchablecontext bc){
//  					batabase.execute(new batch1()--other batch name,size )	}
//  							OR
//  			global void finish(Database.BatchableContext BC) {        
//     						Batchleadconverted b=new BatchLeadConverted();
//     						Id batchId = Database.executeBatch(b, 2);  }