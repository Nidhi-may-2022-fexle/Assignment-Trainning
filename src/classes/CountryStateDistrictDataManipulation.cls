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


        //Map fillinng
        List<District__c> districtList = [SELECT Name, State_Name__r.Name, State_Name__r.Country_Name__r.Name FROM District__c];
        if(districtList.size() >0){
            for(District__c district : districtList){
                if(!mapOfCountryWithStateAndDistrict.containskey(district.State_Name__r.Country_Name__r.Name)){
                    mapOfCountryWithStateAndDistrict.put(district.State_Name__r.Country_Name__r.Name, New Map<String,List<String>>());
                }
                if(!mapOfCountryWithStateAndDistrict.get(district.State_Name__r.Country_Name__r.Name).containsKey(district.State_Name__r.Name)){
                    mapOfCountryWithStateAndDistrict.get(district.State_Name__r.Country_Name__r.Name).put(district.State_Name__r.Name, new List<String>());
                }
                if(!mapOfCountryWithStateAndDistrict.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).contains(district.Name)){
                    mapOfCountryWithStateAndDistrict.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).add(district.Name);
                

                }
                
            }
            System.debug('Mappp -> ' + mapOfCountryWithStateAndDistrict);
            System.debug(mapOfCountryWithStateAndDistrict);
        }
    
    }


    public CountryStateDistrictDataManipulation(String latter){
        List<String> listOfCountryStateDistrict = new List<String>();
        List<District__c> listWithcombination = [SELECT Name, State_Name__r.Name, State_Name__r.Country_Name__r.Name FROM District__c];
        for(District__c totalList : listWithcombination){
            if(!mapOfCountryWithStateAndDistrict.containskey(totalList.State_Name__r.Country_Name__r.Name)){
                mapOfCountryWithStateAndDistrict.put(totalList.State_Name__r.Country_Name__r.Name, New Map<String,List<String>>());
            }
            if(!mapOfCountryWithStateAndDistrict.get(totalList.State_Name__r.Country_Name__r.Name).containsKey(totalList.State_Name__r.Name)){
                mapOfCountryWithStateAndDistrict.get(totalList.State_Name__r.Country_Name__r.Name).put(totalList.State_Name__r.Name, new List<String>());
            }
            if(!mapOfCountryWithStateAndDistrict.get(totalList.State_Name__r.Country_Name__r.Name).get(totalList.State_Name__r.Name).contains(totalList.Name)){
                mapOfCountryWithStateAndDistrict.get(totalList.State_Name__r.Country_Name__r.Name).get(totalList.State_Name__r.Name).add(totalList.Name);
                if(totalList.State_Name__r.Country_Name__r.Name.startsWithIgnoreCase(latter)){
                    if(totalList.State_Name__r.Name.startsWithIgnoreCase(latter)){
                        if(totalList.Name.startsWithIgnoreCase(latter)){
                            listOfCountryStateDistrict.add(totalList.State_Name__r.Country_Name__r.Name + ' - ' + totalList.State_Name__r.Name + ' - ' + totalList.Name);
                        }
                    }
                }

            }
            
        }
        System.debug('listOfCountryStateDistrict -> ' + listOfCountryStateDistrict);
   
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

    public void CountryJSONGenerator(String CountryName){
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