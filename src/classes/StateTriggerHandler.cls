/**
*  Description     :  This class handele all the pre and post operation on State Object
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/14/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/

public class StateTriggerHandler {
    
    /**
     * 
     *   @description    :   Count the number of State on Country 
     *
     *   @args           :   New State list and Old State List
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/14/2022 - Nidhi Kumari 
     * 
     **/
    
    public static void countStateOnCountry(List<State__c> stateNewList, List<State__c> stateOldList){
        
        //set of state id with country
        set<id> countryIdSet = new set<Id>();
        
        //state new list
        if(stateNewList!=null){
            for(State__c state : stateNewList){
                if(state.Id!=Null){
                    countryIdSet.add(state.Id);
                    countryIdSet.add(state.Country_Name__c);
                    
                }
            }
        }
        
        //state old list
        if(stateOldList!=null){
            for(State__c state : stateOldList){
                if(state.Id!=null){
                    countryIdSet.add(state.Id);
                    countryIdSet.add(state.Country_Name__c);
                }
            }
        }
        
        Map<Id, Country__c> countryMap = new Map<Id, Country__c>();
        
        //list on country with old data
        List<Country__c> countryOldList = [SELECT Id, Name , Country_JSON_Data__c ,Total_Number_of_Districts__c, Total_Number_of_States__c, (SELECT Id FROM States__r)
                                           FROM Country__c WHERE Id IN: countryIdSet];
        
        //loop to fill countryMap with countryOldList
         for(Country__c country : countryOldList){
             countryMap.put((Id)country.get('Id'),country);
         }
        
        AggregateResult[] stateAggregateResultGroupByCountry = [SELECT Count(Id) total_State , Sum(Total_Number_of_Districts__c) sumOfTotalDistrictsOnCountry , Country_Name__c 
                                                                   FROM State__c  GROUP BY Country_Name__c];
        
        	//function to count total number of state on country
        for(AggregateResult ar : stateAggregateResultGroupByCountry){
            Id countryId = (Id)ar.get('Country_Name__c');
            
            if(countryMap.containsKey(countryId)){
                countryMap.get(countryId).Id = countryId;
                countryMap.get(countryId).Total_Number_of_Districts__c = (Decimal)ar.get('sumOfTotalDistrictsOnCountry');
            }
        }
            
        if(countryMap.Size()>0){
            update countryMap.values();
        }
       
    }
    
    
     /**
     * 
     *   @description    :   fill JSON Data On Country
     *
     *   @args           :   New State list and Old State List
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/15/2022 - Nidhi Kumari 
     * 
     **/
    
    public static void countryJsonDataFill(List<State__c> stateNewList, List<State__c> oldStateList){
        
        //set of state id with country
        set<id> stateIdSet = new set<Id>();
        
        //new state list
        if(stateNewList!=null){
            for(State__c state : stateNewList){
                stateIdSet.add(state.Country_Name__c);
            }
        }
       
        //old state list
        if(oldStateList!=null){
            for(State__c state : oldStateList){
                stateIdSet.add(state.Country_Name__c);
            }
        }

        //map on country with data
        Map<Id, Country__c> countryMap = new Map<Id, Country__c>([SELECT Id, Name, Country_Code__c, Country_JSON_Data__c,Total_Number_of_Districts__c,
                                                                  Total_Number_of_States__c FROM Country__C WHERE Id IN:stateIdSet]);

        //map on state with data
        Map<Id, State__c> stateMap = new Map<Id, State__c>([SELECT Id, Name, Total_Number_of_Districts__c,Country_Name__c
                                                           FROM State__c WHERE Country_Name__c IN: stateIdSet]);
        
        //map on district with data
        Map<Id, District__c> districtMap = new Map<Id,District__c>([SELECT Id, Name, State_Name__c, State_Name__r.Country_Name__c 
                                                                   FROM District__c WHERE State_Name__r.Country_Name__c  IN: stateIdSet]); 
        
        //function to fill json data on country with wrapper class
        if(!countryMap.isEmpty()){
            
            for(Country__c country : countryMap.values()){
                List<StateWrapper> StateWrapperObjectList = new List<StateWrapper>();
                system.debug('state wrapper list-->' + StateWrapperObjectList );
                for(State__c state : stateMap.values()){
                    if(state.Country_Name__c == country.Id){
                        StateWrapper StateWrapperObject = new StateWrapper();
                        StateWrapperObject.StateName = state.Name;
                        
                        List<DistrictWrapper> DistrictWrapperObjectList = new List<DistrictWrapper>();
                        for(District__c district: districtMap.values()){
                            if(district.State_Name__c == state.Id){
                                DistrictWrapper DistrictWrapperObject = new DistrictWrapper();
                                DistrictWrapperObject.Districts = district.Name;
                                DistrictWrapperObjectList.add(DistrictWrapperObject);
                            }
                        }
                        StateWrapperObject.Districts = DistrictWrapperObjectList;
                        StateWrapperObjectList.add(StateWrapperObject);
                    }
                }
                CountryWrapper CountryWrapperObject = new CountryWrapper();
                CountryWrapperObject.CountryName = country.Name;
                CountryWrapperObject.CountryCode = (Integer)country.Country_Code__c;
                CountryWrapperObject.TotalStates = (Integer)country.Total_Number_of_States__c;
                CountryWrapperObject.TotalDistricts = (Integer)country.Total_Number_of_Districts__c;
                CountryWrapperObject.State = StateWrapperObjectList;
                
                country.Country_JSON_Data__c = JSON.serialize(CountryWrapperObject);
                
            }
            update countryMap.values();
            system.debug('country map' + countryMap);
        }
    }
    
    //Country Wrapper Class
    public class CountryWrapper{
        public String CountryName;
        public Integer CountryCode;
        public Integer TotalStates;
        public Integer TotalDistricts;
        Public List<StateWrapper> State;
    }
    
    //District Wrapper Class
    public class DistrictWrapper{
        public String Districts;
    }
    
    //State Wrapper Class
    public class StateWrapper{
        public String StateName;
        public List<DistrictWrapper> Districts;
    }
    

}