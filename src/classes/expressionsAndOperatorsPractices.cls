/**
*  Description     :  Collection Practices
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/25/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class expressionsAndOperatorsPractices {

    /**
     * 
     *   @description    :   uses of operators
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public static void expressionsPractices(){
        ///Literal Expressions
        Integer var = 20 + 5;
        String str = 'This Number is'+var;
        System.debug(var);
        System.debug(str);

        //collection Expressions
        Account acc = new Account(Id ='0015i000005BIogAAG');
        Integer[] myArray = new Integer[10];
        System.debug('Account Info = ' +acc);
        System.debug('Integer Array = ' + myArray);
        
    }



/**
     * 
     *   @description    :   uses of operators
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void operatorsPractices(){
        Integer s = 45;
        s = s + 55;
        System.debug(s);
        s = s - 10;
        System.debug(s);
        s = s*4;
        System.debug(s); 
        s = s/5;
        System.debug(s);

    }
    /**
     * 
     *   @description    :   Assignment Operators
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void assignmentOperator(){
        // addition assignment operators
        Integer add =100;
        add += 10;
        System.debug(add);
        //Multiplication assignment operators
        Integer mul = 5;
        mul *= 5;
        System.debug(mul);
        //Division Assignment Operators
        Integer div = 55;
        div /= 5;
        System.debug(div);
        //Subtraction Assignment Operators
        Integer sub = 56;
        sub -= 6;
        System.debug(sub);

    }
    /**
     * 
     *   @description    :   Comparison Oprators
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void comparisonOperators(){
         //Equality == 
         Boolean equal = 'mark' == 'mark'; //true
         Boolean notEqual = 5 == 4; //false
         System.debug(equal);
         System.debug(notEqual);
 
         //Inequality !=
         Boolean notEqual2 = 'mark' != 'Steve'; //true
         Boolean equal2 = 6 != 6; //fasle
         System.debug(notEqual2);
         System.debug(equal2);
 
         //Greate Than >
         Boolean greater = 155 > 4; //true
         Boolean notGreater = 4 > 88; //false
         System.debug(greater);
         System.debug(notGreater);
         
         //Less Than <
         Boolean less = 12 < 20;
         Boolean notLess = 9 < 5;
         Boolean lessEqual = 5< 5;
         System.debug(less);
         System.debug(notLess);
         System.debug(lessEqual);
         //Less Than or equal To
         Boolean less2 = 12 <= 20;
         Boolean notLess2 = 9 <= 7;
         System.debug(less2);
         System.debug(notLess2);


    }
    /**
     * 
     *   @description    :   Logical Oprators
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    public static void logicalOpeartors(){
        //AND Operator &&
        Boolean bothTrue = true && true;  //true
        Boolean rightTrue = false && true;  //false
        Boolean leftTrue = true && false;   //false
        Boolean bothFalse = false && false;  //false
        System.debug(bothTrue);
        System.debug(rightTrue);
        System.debug(LeftTrue);
        System.debug(bothFalse);

        //Not operator !
        Boolean data = true;
        Boolean data2 = !data;
        System.debug(data);
        System.debug(data2);


        //Ternary operator
        Integer totalNumber = 80;
        Integer firstNumber = 50;
        Integer secondNumber = 30;
        Boolean correct = firstNumber + secondNumber == totalNumber ? true : false;
        System.debug(correct);
    }

    /**
     * 
     *   @description    :   safe Navigation Operator Practices
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    //Safe Navigation Operator
    public static void safeNavigationOperator(){
        String str ;
        String[] outPut = str?.toUppercase().split(';');
        System.debug(outPut);
    }
     /**
     * 
     *   @description    :   rule Of Conversion Practices
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/24/2022 - Developer Name - Nidhi Kumari
     * 
     **/

     //Rules of Conversion
     public static void ruleOfConversionPractices(){
        //Decimal To Integer
        Decimal mydecval = 15.0;
        Integer myintval = Integer.valueOf(mydecval);
        System.debug(myintval);

        //object to integer
        String str = '32';
        Integer data = Integer.valueOf(str);
        System.debug(data);
     }




}