public class collection1 {
    
public list<integer> intList= new list<integer>();
    public void meth() {

/*add fun adds new values at end of the list by default*/        
    intList.add(10);  /*index valu 0-- Default index value starts from 0*/
    intList.add(20);  //1
    intList.add(30);  //2
/*To get all the values in the list variable*/
 		system.debug('All values in the variable= '+ intList);
        
/*add value at specific index value postion but not at the end position*/
    intList.add(2,40);  /* new 40 value stores in 2 and already stored value 
        					will shift to next position 3 i.e 30 ->3 */
		system.debug('new 40 value into index:2 in the variable= '+ intList);
        
/* add value at specific index value postion with set fun*/
     intList.set(3,50);  //variname.set(integer,value);
     system.debug('New 50 value into index:3 in the variable= '+ intList); /*already value 30 in index
                                                                             3 will replace with 50*/
     
/*To get size of the list     */
    system.debug('list size= '+ intList.size());
        
/*To get value from list list variable with particular index value
	 get(index value)*/
        
    system.debug('value in index value 2= '+ intList.get(2));
	system.debug(' list values 1='+ intlist.get(1) +' and 2='+ intlist.get(2));        
 
/*To copy elements of one list to another list*/
     list<integer> intList2= new list<integer>(intList);
        system.debug('copied elements from intList into intList2= '+ intList);
        
/*To copy elements of one Set to  list*/     
     set<integer> set1= new set<integer>();
        set1.add(50);
        set1.add(60);
     list<integer> intList3= new list<integer>(set1);
        system.debug('Elements of Set into list= '+ intList3);
        
/* To clone all the values of a vari into another vari */
	  list<integer> dupl= intList.clone();  /*here not creating any free memory for vari.dirctly assign*/
        system.debug('duplicating values= '+ intList);
        
/* Assign values directly while declaring */
        list<integer> dir= new list<integer>{100,200,300};  
            system.debug('direct assign values= '+ dir);
        
/* Defined memory size while declaring vari */  
        list<integer> dirmem1= new integer[5];
        dirmem1[0] = 1000;
        dirmem1[1] = 2000;
        dirmem1.add(3000);  /*3000 will placed in 4 index value as add fun adds values only at the end*/
          system.debug('direct memory =' + dirmem1); /*o/p:(1000,2000,null,null,3000)*/
        
/* To sorting the values*/ 
        list<integer> srtng1= new list<integer>();
          srtng1.add(2);
          srtng1.add(1);
        srtng1.sort();
        system.debug('sorted values=' + srtng1); 
        
/* To clean all the values in the vari*/
        list<string> clng1= new list<string>{'BRO','MOM','DAD'};
            system.debug('before cleaning=' +clng1);
        clng1.clear();
        	system.debug('after cleaning=' +clng1);
        
/* To remove a value at particular index value*/
        list<string> remv1= new list<string>{'S','A','D'};
            system.debug('before removing=' +remv1);
        remv1.remove(1);
        	system.debug('after cleaning=' +remv1);
        
/*1.Nested List */

        List<list<string>> nestedlistexample= new list<list<string>>();

        list<string> strlist= new list<string>();
			    strlist.add('Venakt');
				strlist.add('Reena');
				strlist.add('Sergey');
        nestedlistexample.add(strlist);
        
/* 1.1.can use same already defined list variable(strlist) name for adding new set of values */ 
        strlist= new list<string>();   
				strlist.add('Naresh');
				strlist.add('Tarun');	
				strlist.add('Dixith');
        nestedlistexample.add(strlist);
        system.debug(' nested list values with same vari='+ nestedlistexample); 
        
/* 1.2.can use different list variable(strlist1) name for adding new set of values */         
        list<string> strlist1= new list<string>();   
				strlist1.add('Rajesh');
				strlist1.add('Bob');	
				strlist1.add('Dinishh');
        nestedlistexample.add(strlist1);
        
        system.debug(' nested list values with diff vari='+ nestedlistexample); 
    }
    
}