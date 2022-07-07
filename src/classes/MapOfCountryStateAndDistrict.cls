/**
*  Description     :  Printing Map With Country Code And Name, state and city
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/05/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class MapOfCountryStateAndDistrict {
    Map<String, Map<String, Map<String, List<String>>>> mapOfCountryWithStateAndDistrict = new Map<String, Map<String, Map<String, List<String>>>>();

    public MapOfCountryStateAndDistrict(){
        List<String> listCountry = new List<String>();
        listCountry.add('India');
        listCountry.add('Japan');
        listCountry.add('Nepal');
        listCountry.add('Sri Lanka');

        //filling map with list of state and city
        //city of india with state 
        Map<String, List<String>> mapOfStateWithCityOfIndia = new Map<String, List<String>>();
        mapOfStateWithCityOfIndia.put('Bihar', new List<String>{'Patna','Lakhisarai', 'Jamui', 'BhagalPur'});
        mapOfStateWithCityOfIndia.put('Uttar Pradesh', new List<String>{'Meerut','Agra', 'Mathura', 'Lucknow'});
        mapOfStateWithCityOfIndia.put('Haryana', new List<String>{'Panipat','Sonipat', 'Rohtak', 'Ambala'});
        mapOfStateWithCityOfIndia.put('Rajastha', new List<String>{'Kota','Udaipur', 'Jaipur', 'Sikkar'});

        //city of Japan With state 
        Map<String, List<String>> mapOfStateWithCityOfJapan = new Map<String, List<String>>();
        mapOfStateWithCityOfJapan.put('Aichi', new List<String>{'Miyoshi','Nisshin', 'Komenoki', 'Togo'});
        mapOfStateWithCityOfJapan.put('Akita', new List<String>{'Kazuno','Galena'});

        //city of Nepal with state
        Map<String, List<String>> mapOfStateWithCityOfNepal = new Map<String, List<String>>();
        mapOfStateWithCityOfNepal.put('Janak', new List<String>{'Dhanusha','Janakpur'});
        mapOfStateWithCityOfNepal.put('Kathmandu', new List<String>{'PoKhara','Hetauda', 'Lalitpur'});

        //city of Srilanks with state
        Map<String, List<String>> mapOfStateWithCityOfSriLanka = new Map<String, List<String>>();
        mapOfStateWithCityOfSriLanka.put('Badulla', new List<String>{'Haputale','Haputale'});
        mapOfStateWithCityOfSriLanka.put('Seethawakapura', new List<String>{'Sevanagala','Samanthurai'});


        //states of India
        Map<String, Map<String, List<String>>> mapofCountryWithstatesIndia = new Map<String, Map<String, List<String>>>();
        mapofCountryWithstatesIndia.put('India', mapOfStateWithCityOfIndia);

        //states Of Japan
        Map<String, Map<String, List<String>>> mapofCountryWithstatesJapan = new Map<String, Map<String, List<String>>>();
        mapofCountryWithstatesJapan.put('Japan', mapOfStateWithCityOfJapan);

        //states of Nepal
        Map<String, Map<String, List<String>>> mapofCountryWithstatesNepal = new Map<String, Map<String, List<String>>>();
        mapofCountryWithstatesNepal.put('Nepal', mapOfStateWithCityOfNepal);

        //states of Sri Lanka
        Map<String, Map<String, List<String>>> mapofCountryWithstatesSriLanka = new Map<String, Map<String, List<String>>>();
        mapofCountryWithstatesSriLanka.put('Sri Lanka', mapOfStateWithCityOfSriLanka);

        
        mapOfCountryWithStateAndDistrict.put('+91', mapofCountryWithstatesIndia);
        mapOfCountryWithStateAndDistrict.put('+81', mapofCountryWithstatesJapan);
        mapOfCountryWithStateAndDistrict.put('+977', mapofCountryWithstatesNepal);
        mapOfCountryWithStateAndDistrict.put('+94', mapofCountryWithstatesSriLanka);

        //System.debug(mapOfCountryWithStateAndDistrict);
        for (String countryCode :mapOfCountryWithStateAndDistrict.keySet()) {
            System.debug(countryCode + ' -- ' + mapOfCountryWithStateAndDistrict.get(countryCode));
            
        }

    }
    
    /**
     * 
     *   @description    :   Method to print the country state and city name start with s
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/07/2022 - Developer Name - Nidhi Kumari
     * 
     **/


    public void mapDataProcess(){
        for (String countrycode : mapOfCountryWithStateAndDistrict.keySet()){
            for(String countryName : mapOfCountryWithStateAndDistrict.get(countrycode).keySet() ){
                if (countryName.startsWith('S')){
                    for (string stateName : mapOfCountryWithStateAndDistrict.get(countrycode).get(countryName).keyset()){
                        if (stateName.startsWith('S')){
                            for(string cityName : mapOfCountryWithStateAndDistrict.get(countrycode).get(countryName).get(stateName)){
                                if (stateName.startsWith('S')){
                                    system.debug(countrycode + '--' + countryName + '--' + stateName + '--' + cityName );
                                }
                                
                            }
                        
                    	}
                    }
                    
                }   

            }

        }

    }
    
     /**
     * 
     *   @description    :   Method to print the country state and city name start with length provided by the user
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/07/2022 - Developer Name - Nidhi Kumari
     * 
     **/

    public void findListWithLength(integer length){
        for(string countrycode :mapOfCountryWithStateAndDistrict.keySet()){
            for(string countryName : mapOfCountryWithStateAndDistrict.get(countrycode).keyset()){
                for(string stateName : mapOfCountryWithStateAndDistrict.get(countrycode).get(countryName).keyset()){
                    for(string cityName : mapOfCountryWithStateAndDistrict.get(countrycode).get(countryName).get(stateName)){
                        if(cityName.length() >= length){
                            system.debug(countrycode + '--' + countryName + '--' + stateName + '--' + cityName);
                        }
                    }
                }
            }
        }
    }
}