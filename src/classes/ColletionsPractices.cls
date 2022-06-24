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
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    //List Collection
    public static void listPractices(){
        List<String> Dept = new List<String>{'CSE', 'Civil', 'ECE'};
        System.debug(Dept);
        //Add List Element
        Dept.add('EEE');
        Dept.add('IT');
        System.debug(Dept);
        //Add List element with index
        Dept.add(0,'Mech');
        Dept.add(4,'CS');
        System.debug(Dept);
        //Add all from list
        List<String> Depttest = new List<String>();
        Depttest.addAll(Dept);
        System.debug(Depttest);
        //size
        Integer s = Dept.size();
        System.debug(s);
        //get-index
        String str = Dept.get(2);
        System.debug(str);
        //is empty
        Boolean b = Dept.isEmpty();
        System.debug(b);
        //clone
        List<String> Depttest2 = new List<String>();
        Depttest2 = Dept.clone();
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
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
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
        Set<String> s1 = new Set<String>();
        s1.add('something');
        s1.add('more');
        System.debug(s1);
        //create a new instance to the set class by copying the element of the other (sign :- public Set<T>(Set<T> setToCopy))(SetToCopy)
        Set<String> s2 = new Set<String>(s1);
        System.debug(s2);

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
        Map<Integer, String> m = new Map<Integer, String>();
        //Add items
        m.put(1, 'First item');
        m.put(2, 'Second item');
        System.debug(m);
        // Copy items
        Map<Integer, String> m2 = new Map<Integer, String>(m);
        System.debug(m2);
        //map methods
        Account a = new Account( Name='Acme', BillingCity='New York');

        Map<Integer, Account> map1 = new Map<Integer, Account> {};
        map1.put(1, a);
        System.debug(a);

        Map<Integer, Account> map2 = map1.clone();
        map1.get(1).BillingCity = 'San Francisco';

        System.assertEquals('San Francisco', map1.get(1).BillingCity);
        System.assertEquals('San Francisco',map2.get(1).BillingCity);
        System.debug(map1);

    }


}