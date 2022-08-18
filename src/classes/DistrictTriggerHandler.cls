/**
*  Description     :  This class handele all the pre and post operation on District Object
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  08/12/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/
public class DistrictTriggerHandler {
    
     /**
     * 
     *   @description    :   Count the number of District on State and Country 
     *
     *   @args           :   New District list and Old District List
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/12/2022 - Nidhi Kumari 
     * 
     **/
    
    public static void countDistrictOnState(List<District__c> districtNewList, List<District__c> districtOldList){
        
        set<id> districstateIdSet = new set<Id>();
        
        if(districtNewList!=null){
            for(District__c dis : districtNewList){
                districstateIdSet.add(dis.State_Name__c);
            }
        }
       
        if(districtOldList!=null){
            for(District__c dis : districtOldList){
                districstateIdSet.add(dis.State_Name__c);
            }
        }
        

        List<State__c> totalDistrictOnState = new List<State__c>();
        
        AggregateResult[] districtAggregateResultForState = [SELECT Count(Id) Total_Number_of_Districts, Count(Name) , State_Name__c  
                                                             FROM District__c  GROUP BY State_Name__c];
  
        
        List<State__c> oldStateList = [SELECT Id, Name , State_JSON_Data__c,Total_Number_of_Districts__c, (SELECT Id FROM Districts__r)
                                       FROM State__c WHERE Id IN: districstateIdSet];
        
        Map<Id, State__c> stateMap = new Map<Id, State__c>();
        for(State__c state : oldStateList){
            stateMap.put((Id)state.get('Id'),state);
        }
        
        for(AggregateResult ar : districtAggregateResultForState){
            Id stateIds = (Id)ar.get('State_Name__c');
            
            if(stateMap.containsKey(stateIds)){
                stateMap.get(stateIds).Id = stateIds;
                stateMap.get(stateIds).Total_Number_Of_Districts__c = (Integer)ar.get('Total_Number_of_Districts');
            }
        }

        
        if(stateMap.size() >0){
            update stateMap.values();
            system.debug('state map --->' + stateMap );
        }

        
        
        AggregateResult[] stateAggregateResultGroupByCountry = [SELECT Count(Id) total_State , Sum(Total_Number_of_Districts__c) sumOfTotalDistrictsOnCountry , Country_Name__c 
                                                                   FROM State__c  GROUP BY Country_Name__c];
        

        List<Country__c> countryOldList = [SELECT Id, Name, Total_Number_of_Districts__c, (SELECT Id, Total_Number_of_Districts__c  FROM States__r) FROM Country__C];

        Map<Id, Country__c> countryMap = new Map<Id, Country__c>();
        
         for(Country__c country : countryOldList){
            countryMap.put((Id)country.get('Id'),country);
        }
        
        for(AggregateResult ar :stateAggregateResultGroupByCountry){
            Id countryIds = (Id)ar.get('Country_Name__c');
            
            if(countryMap.containsKey(countryIds)){
                countryMap.get(countryIds).Id = countryIds;
                countryMap.get(countryIds).Total_Number_of_Districts__c = (Decimal)ar.get('sumOfTotalDistrictsOnCountry');
            }
        }
        
        if(countryMap.Size() >0){
            update countryMap.Values();
        }
        
    }
       
     /**
     * 
     *   @description    :   fill JSON Data On State
     *
     *   @args           :   New District list and Old District List
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 08/15/2022 - Nidhi Kumari 
     * 
     **/ 
    
    public static void stateJsonDAta(List<District__c> districtNewList, List<District__c> districtOldList){
        set<id> districstateIdSet = new set<Id>();
        
        if(districtNewList!=null){
            for(District__c dis : districtNewList){
                districstateIdSet.add(dis.State_Name__c);
            }
        }
       
        if(districtOldList!=null){
            for(District__c dis : districtOldList){
                districstateIdSet.add(dis.State_Name__c);
            }
        }
        

        Map<Id, State__c> stateMap = new Map<Id, State__c>([SELECT Id, Name, State_Code__c,Total_Number_of_Districts__c, State_JSON_Data__c
                                                           FROM State__c WHERE Id IN:districstateIdSet]);
   
        
        Map<Id, District__c> districtMap = new Map<Id,District__c>([SELECT Id, Name, State_Name__c FROM District__c WHERE State_Name__c  IN:districstateIdSet]); 
        
        if(!stateMap.isEmpty()){
            
                List<stateWrapperClass> StateWrapperObjectList = new List<stateWrapperClass>();
            
                for(State__c state : stateMap.values()){
                    
                        stateWrapperClass StateWrapperObject = new stateWrapperClass();
                        StateWrapperObject.StateName = state.Name;
                        stateWrapperObject.stateCode = (Integer)state.State_Code__c;
        				stateWrapperObject.totalDistrict = (Integer)state.Total_Number_of_Districts__c;
                        
                        List<districtWrapperClass> DistrictWrapperObjectList = new List<districtWrapperClass>();
                    
                        for(District__c district: districtMap.values()){
                            
                            if(district.State_Name__c == state.Id){
                                districtWrapperClass DistrictWrapperObject = new districtWrapperClass();
                                DistrictWrapperObject.Districts = district.Name;
                                DistrictWrapperObjectList.add(DistrictWrapperObject);
                            }
                        }
                        StateWrapperObject.Districts = DistrictWrapperObjectList;
                        StateWrapperObjectList.add(StateWrapperObject);
                        
                        state.State_JSON_Data__c = JSON.serialize(StateWrapperObject);
                    
                    
                    
                }
            
            if(stateMap.size() >0){
                update stateMap.values();
            }
          
        }
    }
    
    //State Wrapper 
    public class stateWrapperClass {
        public String stateName;
        public Integer totalDistrict;
        public Integer stateCode;
        public List<districtWrapperClass> districts;
    }
    
    //District Wrapper 
    public class districtWrapperClass{
        public String districts;
    }

}