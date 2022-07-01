/**
*  Description     : Constructor 
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/25/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class Constructor {
  private String countryName;
  private Integer countryPopulation;
  //constructor takes a string argument and integer argument
  public void Constructor(String countryName, Integer countryPopulation){
    this.countryName = countryName;
    this.countryPopulation = countryPopulation;
  }

  public void printClassVariable(){
    System.debug('country name' + countryName);
    System.debug('country population' + countryPopulation);
  }






    
     /**
     * 
     *   @description    :  Constructors
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 06/25/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    //Using Constructors
    public class TestObject2 {

        private final Integer DEFAULT_SIZE = 10;
        
        Integer size;
        
           //Constructor with no arguments
           public TestObject2() {
               this(); // Using this(...DEFAULT_SIZE) calls the one argument constructor    
           }
           // Constructor with one argument 
           public TestObject2(Integer ObjectSize) {
             size = ObjectSize;  
           }
           TestObject2 myObject1 = new TestObject2(42);
            TestObject2 myObject2 = new TestObject2();
        }

}