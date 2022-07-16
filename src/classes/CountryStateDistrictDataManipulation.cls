/**
*  Description     :  Printing Map Country State District DataManipulation 
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/15/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class CountryStateDistrictDataManipulation {
   Map<String,Map<String,List<String>>> mapOfCountryWithStateAndDistrict = new Map<String,Map<String,List<String>>>();

    /**
     * 
     *   @description    :   Method for aggregareResult
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/05/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public CountryStateDistrictDataManipulation(){
        // aggregate Query on state
        List<State__c> updateState = new List<State__c>();
        AggregateResult[] districtAggregateResultWithState = [SELECT Count(Id) Total_District, State_Name__c  FROM District__c GROUP BY State_Name__c];
        System.debug(districtAggregateResultWithState);
        for(AggregateResult ar : districtAggregateResultWithState){
            State__c states = new State__c();
            states.Id = (Id)ar.get('State_Name__c');
            states.Total_Number_of_Districts__c = (Integer)ar.get('Total_District');
            system.debug('District for states' + states);
            updateState.add(states);
            
        }
        //update total number of District in state
        if(updateState.size()>0){
            update updateState;

        }
      
        //aggregate Query on district
        List<Country__c> updateCountryWithDistrict = new List<Country__c>();
        AggregateResult[] districtAggregateResultWitCountry = [SELECT COUNT(Id) Total_District, State_Name__r.Country_Name__c countryId FROM District__c GROUP BY State_Name__r.Country_Name__c];
        for(AggregateResult ar :districtAggregateResultWitCountry){
            Country__c districtWithCountry = new Country__c();
            districtWithCountry.Id = (Id)ar.get('countryId');
            districtWithCountry.Total_Number_of_Districts__c = (Integer)ar.get('Total_District');
            System.debug(districtWithCountry);
        }
        //update total number of district with country
        if(updateCountryWithDistrict.size()>0){
            update updateCountryWithDistrict;

        }

        //agrregate Query on country
        List<Country__c> updateCountry = new List<Country__c>();
        AggregateResult[] stateAggregateResultWithCountry = [SELECT Count(Id) Total_State, sum(Total_Number_of_Districts__c) totalDistrict , Country_Name__c  FROM State__c GROUP BY Country_Name__c];
        for(AggregateResult ar : stateAggregateResultWithCountry){
            Country__c country = new Country__c();
            country.Id = (Id)ar.get('Country_Name__c');
            country.Total_Number_of_States__c = (Integer)ar.get('Total_State');
            country.Total_Number_of_Districts__c = (Decimal)ar.get('totalDistrict');
            System.debug('State of country' + country);
            updateCountry.add(country);
        }
        //update total number of state with country
        if(updateCountry.size()>0){
            update updateCountry;

        }
    }    

     /**
     * 
     *   @description    :   Method for dynamically map filling
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/15/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public CountryStateDistrictDataManipulation(String latter){
        List<District__c> district = new List<District__c>();
        district = [SELECT  Name,State_Name__r.Name FROM District__c];

        List<State__c> state = new List<State__c>();
        state = [SELECT Name, Country_Name__r.Name FROM State__c];

        List<Country__c> country = new List<Country__c>();
        country = [SELECT Name FROM Country__c];



        for(Country__c countries : country){
            mapOfCountryWithStateAndDistrict.put(countries.Name, New Map<string ,List<string>>());
                for(State__c states : state){
                    if(states.Country_Name__r.Name == countries.Name){
                        mapOfCountryWithStateAndDistrict.get(countries.Name).put(states.Name, New List<String>());

                        for(District__c districts : district){
                            List<String> listOfDistrict = new List<String>();
                            if(districts.State_Name__r.Name == states.Name){
                                listOfDistrict.add(districts.Name);
                                mapOfCountryWithStateAndDistrict.get(countries.Name).get(states.Name).addAll(listOfDistrict);

                            }
                        }
                    }
                
                }
        }
        
        System.debug(mapOfCountryWithStateAndDistrict);
    }

     /**
     * 
     *   @description    :   Method to print the country state and district name start with s
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/15/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public void letterStartWithMethod (String Latter){
        for(String countries : mapOfCountryWithStateAndDistrict.keySet() ){
            if (countries.startsWith('Latter')){
                for (string states : mapOfCountryWithStateAndDistrict.get(countries).keyset()){
                    if (states.startsWith('Latter')){
                        for(string districts : mapOfCountryWithStateAndDistrict.get(countries).get(states)){
                            if (districts.startsWith('Latter')){
                                system.debug(countries + '--' + states + '--' + districts );
                            }
                                
                        }
                        
                    }
                }
                    
            }   

        }

    }

     /**
     * 
     *   @description    :  Wrapper Class
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/07/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    //Wrapper class 
    public class CountryWrapperClass {
        public String countryName;
        public Integer countryCode;
        public Integer totalStates;
        public Integer totalDistricts;
        public List<StateWrapperClass> states;
    }

    public class StateWrapperClass {
        public String stateName;
        public List<DistrictWrapperClass> districts;

    }

    public class DistrictWrapperClass{
        public String districts;
    }

     /**
     * 
     *   @description    :   Method for json Data
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/07/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public void CountryJSONGenerator(String countryName){
        List<Country__c> countries = [SELECT Name, Total_Number_of_Districts__c, Total_Number_of_States__c, Country_Code__c, Country_JSON_Data__c FROM Country__c WHERE Name =:CountryName];
        if(countries.size() > 0){
            List<StateWrapperClass> StateWrapperObjectList = new List<StateWrapperClass>();
            for(String state : mapOfCountryWithStateAndDistrict.get(CountryName).keySet()){
                StateWrapperClass StateWrapperObject = new StateWrapperClass();
                StateWrapperObject.StateName = state;

                List<DistrictWrapperClass> DistrictWrapperObjectList = new List<DistrictWrapperClass>();
                for(String district : mapOfCountryWithStateAndDistrict.get(CountryName).get(state)){
                    DistrictWrapperClass DistrictWrapperObject = new DistrictWrapperClass();
                	DistrictWrapperObject.districts = district;
                	DistrictWrapperObjectList.add(DistrictWrapperObject);
                }
                StateWrapperObject.Districts = DistrictWrapperObjectList;
            	StateWrapperObjectList.add(StateWrapperObject);

            }
            CountryWrapperClass CountryWrapperObject = new CountryWrapperClass();
            CountryWrapperObject.CountryName = countries[0].Name;
            CountryWrapperObject.CountryCode = (Integer)countries[0].Country_Code__c;
            CountryWrapperObject.TotalStates = (Integer)countries[0].Total_Number_of_States__c;
        	CountryWrapperObject.TotalDistricts = (Integer)countries[0].Total_Number_of_Districts__c;
        	CountryWrapperObject.States = StateWrapperObjectList;

            System.debug(CountryWrapperObject);
            System.debug(JSON.serialize(CountryWrapperObject));
            countries[0].Country_JSON_Data__c = JSON.serialize(CountryWrapperObject);
            update countries[0];
        }
       

    }

}