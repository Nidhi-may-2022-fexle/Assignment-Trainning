/**
*  Description     :  Instance of Keyword, This KeyWord, Final Keyword
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/04/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/
public with sharing class KeyWords {
      /**
     * 
     *   @description    :   Method for instance of key word
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/04/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public void InstanceOfKeyword() {
        sObject s = new Account();

        if (s instanceOf Account){
            Account acc = new Account();
        }
        else if(s instanceOf Contact){
            Contact contacts = (Contact)s;
        }

    }

    /**
*  Description     :  This keyWord
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/
public with sharing class ThisKeyword {
    
    String str;
    {
        this.str = 'TestString';
    }

    //first constructor for the class
    public thisKeyword(String str2){

    }

    //second constructor for the class
    public ThisKeyword(){
        this('none');

    }

    String value = ' Default value ';
    public void thisKeyword2(String value){
        System.debug(value);
        System.debug(this.value);
        this.value = value;
        system.debug(this.value);
    }

}

  /**
*  Description     :  Final keyWord
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/
    public void finalKeyword(){
        final Integer intI = 6;
        Integer add = intI + 5;
        System.debug(add);

}


}