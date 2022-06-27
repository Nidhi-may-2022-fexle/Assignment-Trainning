/**
*  Description     :  Collection Practices
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/24/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/

public class ColletionsPractices {
    /**
     * 
     *   @description    :   Practices of Lists collection
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    //List Collection
    public static void listPractices(){
        List<String> DeptTest = new List<String>{'CSE', 'Civil', 'ECE'};
        System.debug(DeptTest);
        //Add List Element
        DeptTest.add('EEE');
        DeptTest.add('IT');
        System.debug(DeptTest);
        //Add List element with index
        DeptTest.add(0,'Mech');
        DeptTest.add(4,'CS');
        System.debug(DeptTest);
        //Add all from list
        List<String> Depttest1 = new List<String>();
        Depttest1.addAll(DeptTest);
        System.debug(Depttest1);
        //size
        Integer test = DeptTest.size();
        System.debug(test);
        //get-index
        String str = DeptTest.get(2);
        System.debug(str);
        //is empty
        Boolean bool = DeptTest.isEmpty();
        System.debug(bool);
        //clone
        List<String> Depttest2 = new List<String>();
        Depttest2 = DeptTest.clone();
        System.debug(Depttest2);
        //clear
        Depttest2.clear();
        System.debug(Depttest2);
        
    }
    //Collection - Sets
    /**
     * 
     *   @description    :   Practices of Sets collection
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public static void setsPractices(){
        Set<String> myStringSet = new Set<String>();
        Set<String> set1 = new Set<String>{'New', 'Old'};
        Set<Integer>mySet = new Set<Integer>();
        //add element in set
        mySet.add(1);
        mySet.add(3);
        System.assert(mySet.contains(1));
        System.debug(set1 );
        System.debug(mySet);
        //remove element in set
        mySet.remove(1);
        System.debug(set1);

        //Define new set
        Set<Integer>mySet2 = new Set<Integer>(mySet);
        System.Assert(mySet2.Size() == 1);
        System.debug(mySet2);

        //create a new instance of the set class (signature :-- public Set<T>())
        Set<String> str1 = new Set<String>();
        str1.add('something');
        str1.add('more');
        System.debug(str1);
        //create a new instance to the set class by copying the element of the other (sign :- public Set<T>(Set<T> setToCopy))(SetToCopy)
        Set<String> str2 = new Set<String>(str1);
        System.debug(str2);

    }
    /**
     * 
     *   @description    :   Practices of maps collection
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void mapsPractices(){
        Map<Integer, String> mapOfIntegerWithString = new Map<Integer, String>();
        //Add items
        mapOfIntegerWithString.put(1, 'First item');
        mapOfIntegerWithString.put(2, 'Second item');
        System.debug(mapOfIntegerWithString);
        // Copy items
        Map<Integer, String> mapOfIntegerWithString2 = new Map<Integer, String>(mapOfIntegerWithString);
        System.debug(mapOfIntegerWithString2);
        //map methods
        Account acc = new Account( Name='Acme', BillingCity='New York');

        Map<Integer, Account> map1 = new Map<Integer, Account> {};
        map1.put(1, acc);
        System.debug(acc);

        Map<Integer, Account> map2 = map1.clone();
        map1.get(1).BillingCity = 'San Francisco';

        System.assertEquals('San Francisco', map1.get(1).BillingCity);
        System.assertEquals('San Francisco',map2.get(1).BillingCity);
        System.debug(map1);

    }


}