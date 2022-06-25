/**
*  Description     :   Data Type Practices
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/24/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public class PrimitiveDataTypePractice {
    //Boolean Data Type
    /**
     * 
     *   @description    :   Boolean Data type
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void booleanDataType(){
        boolean isWinner = true;
        System.debug(isWinner);
    }
    //Date Data Type
    /**
     * 
     *   @description    :   Date Data Type
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void dateDataType(){
        String dateStr = Date.today().format();
        System.debug(dateStr);
        //add Months
        date myDate = date.newInstance(1990, 11, 21);
        date newDate = myDate.addMonths(3);
        date expectedDate = date.newInstance(1991, 2, 21);
        system.assertEquals(expectedDate, newDate);
        System.debug(expectedDate);
        //day
        date myDate2 = date.newInstance(1989, 4, 21);
        Integer day = myDate.day();
        system.assertEquals(21, day);
        System.debug(day);
        //day of year
        date myDateY = date.newInstance(1998, 10, 21);
        Integer dayY = myDate.dayOfYear();
        system.assertEquals(294, day);
        System.debug(day);
    }
    //Datetime Data Type
    /**
     * 
     *   @description    :  DateTime Data Type 
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void datetimeDataType(){
        Datetime dt = Datetime.now();
        String dateTimeStr = dt.format('yyyy/mm/dd  hh:mm:ss');
        System.debug(dateTimeStr);
        //addDays(additionalDays)
        Datetime myDateTime = Datetime.newInstance(1960, 2, 17);
        Datetime newDateTime = myDateTime.addDays(2);
        Datetime expectedDateTime = Datetime.newInstance(1960, 2, 19);
        System.assertEquals(expectedDateTime, newDateTime);
        System.debug(expectedDateTime);
        //addHours(additionalHours)
        DateTime myDateTimeA = DateTime.newInstance(1997, 1, 31, 7, 8, 16);
        DateTime newDateTimeA = myDateTimeA.addHours(3);
        DateTime expectedD = DateTime.newInstance(1997, 1, 31, 10, 8, 16);
        System.debug(expectedD);
    }
    /**
     * 
     *   @description    :   decimal data type
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    
    //Decimal Data Type
    public static void decimalDataType(){
        Decimal amount = 544.66;
        System.debug(amount.abs());
    }
    
    //Double Data Type
    /**
     * 
     *   @description    :   double data type
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void doubleDataType(){
        Double data = 5456.45;
        System.debug(data);
    }
    
    //ID Data Type
    /**
     * 
     *   @description    :  ID data type
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void idDataType(){
        ID id = '00300000003T2PGAA0';
        System.debug( id);
    }
    
    //Integer Data Type
    /**
     * 
     *   @description    :   Integer Data Types
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi
     * 
     **/
    public static void integerDatatype(){
        Integer intData = 1;
        System.debug(intData);
    }
    //Long Data Type
    public static void longDataType(){
        Long longData = 545748458L;
        System.debug(longData);
        
    }
    //Object Data Type(You can cast an object that represents a more specific data type to its underlying data type)
    public static void ObjectDataType(){
        Object o = 11;
        Integer int2 = (Integer)o;
        System.assertEquals(11, int2);
    }
    

}