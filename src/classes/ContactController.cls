public class ContactController {
    
    @AuraEnabled
    public static list<contact> findAll(){
        return [select id,name,phone from contact limit 50];
    }
    
    @AuraEnabled
    public static list<contact> findByName(string searchKey){
        String name = '%' + searchKey + '%';
    	return [select id,name,phone from contact where name LIKE :name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
                    FROM Contact WHERE Id = :contactId];
    }

}