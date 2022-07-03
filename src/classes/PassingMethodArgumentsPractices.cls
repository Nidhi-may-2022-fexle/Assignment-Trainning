/**
*  Description     :  Passing Method Arguments by Value And Reference
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/28/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class PassingMethodArgumentsPractices {
    public static void createTemperatureHistory() {
        List<Integer> fillMe = new List<Integer>();        
        reference(fillMe);
        // The list is modified and contains five items
        // as expected.
        System.assertEquals(fillMe.size(),5);  
        System.debug(fillMe);      
        
        List<Integer> createMe = new List<Integer>();
        referenceNew(createMe);
        // The list is not modified because it still points to the original list, not the new list, that the method created.
        System.assertEquals(createMe.size(),0);   
        System.debug(createMe);  
    }
            
    public static void reference(List<Integer> list1) {
        // Add rounded temperatures for the last five days.
        list1.add(70);
        list1.add(68);
        list1.add(75);
        list1.add(80);
        list1.add(82);
    }    
        
    public static List<Integer> referenceNew(List<Integer> list2) {
        // Assign argument to a new List of, five temperature values.
        list2 = new List<Integer>{55, 59, 62, 60, 63};
        return list2;
    }
}