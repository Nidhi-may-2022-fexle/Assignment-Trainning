/**
*  Description     :  This class is to refer to the LWC Component
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  09/01/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/
public class LwcApexClass {

    /**
     * 
     *   @description    :   Method to get first Text Method-1
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/01/2022 - Nidhi Kumari 
     * 
     **/
    
    @AuraEnabled(cacheable=true)
    public static String getTextMethod1(){
        return 'METHOD-1';
    }
    
     /**
     * 
     *   @description    :   Method to get second Text Method-2
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/01/2022 - Nidhi Kumari 
     * 
     **/
    @AuraEnabled(cacheable=true)
    public static String getTextMethod2(){
        return 'METHOD-2';
    }
    
     /**
     * 
     *   @description    :   Method to get third Text Method-3
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 09/01/2022 - Nidhi Kumari 
     * 
     **/
    @AuraEnabled(cacheable=true)
    public static String getTextMethod3(){
        return 'METHOD-3';
    }

}