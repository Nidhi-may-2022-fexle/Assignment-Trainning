/**
*  Description     : Inner class outer class 
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/30/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class InnerClassOuterClass {
    class InnerClass{
        public void show() {
         System.debug('Hello');
        }
       }
       public void showMessage(){
        InnerClass innObj = new InnerClass();
        innObj.show();
       }

}