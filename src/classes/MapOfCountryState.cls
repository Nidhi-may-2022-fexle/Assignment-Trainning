public with sharing class MapOfCountryState {
    Map<String, Map<String, Map<String, List<String>>>> mapOfCountryWithStateAndDistrict = new Map<String, Map<String, Map<String, List<String>>>>();
    public void countryAndState(){
        dataInitializtion();
    }

    private void dataInitializtion (){
        List<String> listCountry = new List<String>();
        listCountry.add('India');
        listCountry.add('Japan');
        listCountry.add('Nepal');
        listCountry.add('Sri Lanka');

        //List of states of india
        List<String> stateOfIndia = new List<String>{'Bihar','UP', 'Haryana', 'Rajastha'};
        //list of district
        List<String> districtOfBihar = new List<String>{'Patna','Lakhisarai', 'Jamui', 'BhagalPur'};
        List<String> districtOfUP = new List<String>{'Meerut','Agra', 'Mathura', 'Lucknow'};
        List<String> districtOfHaryana = new List<String>{'Panipat','Sonipat', 'Rohtak', 'Ambala'};
        List<String> districtOfRajastha = new List<String>{'Kota','Udaipur', 'Jaipur', 'Sikkar'};


        //list of states of Japan
        List<String> stateOfJapan = new List<String>{'Aichi','Akita', 'Aomori', 'Ehime'};
        //list of district in japan
        List<String> districtOfAichai = new List<String>{'Miyoshi','Nisshin', 'Komenoki', 'Togo'};
        List<String> districtOfAkita = new List<String>{'Kazuno','Galena'};

        
        //list of states of Nepal
        List<String> stateOfNepal = new List<String>{'Janak','Kathmandu', 'Gandaki'};
        //list of district
        List<String> districtOfJanak = new List<String>{'Dhanusha','Janakpur'};
        List<String> districtOfKathmandu = new List<String>{'PoKhara','Hetauda', 'Lalitpur'};

        //list of states of srilanks
        List<String> stateOfSriLanks = new List<String>{'Anuradhapur','Badulla', 'Batticaloa'};
        // list of district
        List<String> districtOfBadulla = new List<String>{'Haputale','Haputale'};



        Map<String, List<String>> mapIndia = new Map<String, List<String>>{'Bihar'=>districtOfBihar , 'UP'=>districtOfUP , 'Rajastha'=>districtOfRajastha};
        Map<String, List<String>> mapJapan = new Map<String, List<String>>{'Aichai'=>districtOfAichai , 'Akita'=>districtOfAkita};
        
        Map<String, List<String>> mapNepal = new Map<String, List<String>>{'Janak'=> districtOfJanak , 'Kathmandu'=>districtOfKathmandu};
        
        Map<String, List<String>> mapSrilanks = new Map<String, List<String>>{'Badulla'=>districtOfBadulla};
       

        Map<String, Map<String, List<String>>> mapWithCountry =  new Map<String, Map<String, List<String>>>{'India'=> mapIndia, 'Japan'=> mapJapan, 
        'Nepal'=> mapNepal, 'Srilanks'=>mapSrilanks};

        Map<String, Map<String, Map<String, List<String>>>> mapOfCountryWithStateAndDistrict = new Map<String, Map<String, Map<String, List<String>>>>{'country'=>mapWithCountry};

        
        //mapOfCountryWithStateAndDistrict.put(mapWithCountry);

        System.debug(mapOfCountryWithStateAndDistrict);

        


    }

       /* public void nameStratWith(String letter){
            Boolean notFoud = true;
    
            //country name
            for (String countries : mapOfCountryWithStateAndDistrict.keySet(listCountry)){
                for(String IndiaStates : stateOfIndia.keySet()){
                    for(String BiharDistricts : districtOfBihar.keySet()){
                        if(mapIndia.containsKey(BiharDistricts) && mapIndia.get(BiharDistricts).contains(IndiaStates) ){
                            System.debug('District of Bihar'+BiharDistricts + ' States'+ IndiaStates);
                        }
                    }
                    for (String UPDistrict : districtOfUP){
                        if(mapIndia.containsKey(UPDistrict) ){
                            System.debug('District of UP'+UPDistrict+ ' States'+ IndiaStates);
                        }
                    }
    
                }
    
            }
        }*/
    
    
}