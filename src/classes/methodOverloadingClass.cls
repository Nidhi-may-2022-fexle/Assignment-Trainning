/**
*  Description     :  Method Overloading
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/25/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class methodOverloadingClass {
    public void overloadingData(){
        system.debug('with no datatype');
    }
    public void overloadingData(integer speed){
        system.debug('integer method speed   :' +speed  );
    }
    public void overloadingData(string name){
        system.debug('string method name  :'  +name);
        this.overloadingData(50);
    }
    public void overloadingData(string name , integer speed){
        system.debug('string and integer method  :' +name +speed);
        this.overloadingData('mahi');
    }
}