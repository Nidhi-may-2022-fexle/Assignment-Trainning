/**
*  Description     :  super subclass Keyword
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/
public class SubClass extends SuperClass {

     /**
     * 
     *   @description    :   Override the printName
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public override void printName() {
        super.printName();
        System.debug('But you can call me ' + super.getFirstName());
    }
}