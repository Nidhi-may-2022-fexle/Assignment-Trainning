/**
*  Description     :  This class handele all the pre and post operation on Opportunity Object
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/30/2022
*
*  Revision Logs   :  V1.0 - Created - Nidhi Kumari
*
**/
public class TriggerOpportunityHandler {
    /**
     * 
     *   @description    :   Inserts and update the Automobile records and send mail to Opportunity Owner with Shipment Details
     *
     *   @args           :   New Opportunity list and Old Opportunity Map
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/30/2022 - Nidhi Kumari 
     * 
     **/
    public static void automobileRecord (List<Opportunity> opportunityList, Map<Id, Opportunity> oldOppMap){
        
        List<SObject> insertRecordList = New List<SObject>();
    	List<SObject> updateRecordList = New List<SObject>();
        set<Id> setOfNewOpportunityIds = new set<Id>();
        Map<String, SObject> oldAutomobileRecordsMap = new Map<String, SObject>();
        List<SObject> oldAutomobileRecords = New List<SObject>();
        
        List<Messaging.SingleEmailMessage> emailList = New List<Messaging.SingleEmailMessage>();
        
        //Add all Automobile Id Into Set
        for(Opportunity opp : opportunityList){
            setOfNewOpportunityIds.add(opp.Id); 
        }
        
        oldAutomobileRecords.addAll([SELECT Id, Name, Account__c, Opportunity__c FROM Automobile_Sensor__c
                                    WHERE Opportunity__c IN:setOfNewOpportunityIds]);
        oldAutomobileRecords.AddAll([SELECT Id, Name, Account__c, Opportunity__c FROM Automobile_Presence_Sensor__c
                                    WHERE Opportunity__c IN:setOfNewOpportunityIds]);
        oldAutomobileRecords.AddAll([SELECT Id, Name, Account__c, Opportunity__c FROM Automobile_TDU__c
                                    WHERE Opportunity__c IN:setOfNewOpportunityIds]);
        oldAutomobileRecords.AddAll([SELECT Id, Name, Account__c, Opportunity__c FROM Automobile_Tag__c
                                    WHERE Opportunity__c IN:setOfNewOpportunityIds]);
        
        for(Sobject oldRecord :oldAutomobileRecords){
            oldAutomobileRecordsMap.put((String)oldRecord.get('Name'),oldRecord);
    	}
        
       
        
        for(Opportunity opp : opportunityList){
            //Automobile_Tag_Details 
            if((opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return To HQ' || opp.StageName == 'Return To Customer') &&
                  (oldOppMap == null || opp.StageName != oldOppMap.get(opp.Id).StageName || 
                   opp.Automobile_Tag_Details_1__c != oldOppMap.get(opp.Id).Automobile_Tag_Details_1__c || 
                   opp.Automobile_Tag_Details_2__c != oldOppMap.get(opp.Id).Automobile_Tag_Details_2__c || 
                   opp.Automobile_Tag_Details_3__c != oldOppMap.get(opp.Id).Automobile_Tag_Details_3__c || 
                   opp.Return_To_HQ__c != oldOppMap.get(opp.Id).Return_To_HQ__c)){
                       
                       //Email Processing

                       Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                       String body = 'Sensor shipment process is completed. Please refer below mentioned details to get all the success and failure details.</br>';
                       String messageDetail = '';
                       String subject;
                       List<String> mailToSend = new List<String>();
                       mailToSend.add('nidhi.kumari@fexle.com');
                       mail.setToAddresses(mailToSend);
                       mail.subject = opp.Name+ ' , ' +date.today();
                       messageDetail+= '<b> Successful: </b> <table border="1" cellpadding=5 cellspacing=0>' + '<tr><th>Automobile Type</th><th>Name</th> <th>Message</th></tr>';
                      // add all tags into set
                      Set<String> tagSet = new Set<String>();
                      if(opp.Automobile_Tag_Details_1__c != Null){
                          for(String atag : opp.Automobile_Tag_Details_1__c.split('\n')){
                              tagSet.add(atag.trim()); 
                          }   
                      }
                       if(opp.Automobile_Tag_Details_2__c != Null){
                           for(String atag : opp.Automobile_Tag_Details_2__c.split('\n')){
                               tagSet.add(atag.trim());
                           }
                       }
                       if(opp.Automobile_Tag_Details_3__c != Null){
                           for(String atag : opp.Automobile_Tag_Details_3__c.split('\n')){
                               tagSet.add(atag.trim());
                           }
                       }
                      
                      if(tagSet != Null){
                          for (String tagDetail : tagSet) {
                              if(tagDetail.length() > 18){
                                  tagDetail.trim();
                                  tagDetail = tagDetail.substring(0, 18);
                              } 
                              if(tagDetail.startsWith('00:11:CE:00')){
                                  //update case for Automobile_Sensor__c
                                  if(oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_Sensor__c automoblieSensorRecord = (Automobile_Sensor__c)oldAutomobileRecordsMap.get(tagDetail);
                                      if((opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer') && 
                                         (automoblieSensorRecord.Account__c != opp.Installation_Account__c
                                          || automoblieSensorRecord.Opportunity__c != opp.Id)){
                                              
                                          automoblieSensorRecord.Account__c = opp.Installation_Account__c;
                                          automoblieSensorRecord.Opportunity__c = opp.Id;
                                          updateRecordList.add(automoblieSensorRecord);
                                          System.debug('line 79 -> ' + automoblieSensorRecord);
                                      }
                                      
                                      if(opp.StageName == 'Return to Customer' && automoblieSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td>Sensor</td><td>'+tagDetail+'</td><td>Sensor cannot inserted  under installation account' + opp.Installation_Account__c + 'b/c it is already exists under the installation account.</td></tr>';
                                          system.debug('update automobile sensore -->' + messageDetail);
                                      }
                                  }
                                  //insert case for Automobile_Sensor__c
                                  if(!oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_Sensor__c automoblieSensorRecord = new Automobile_Sensor__c();
                                      automoblieSensorRecord.Name = tagDetail;
                                      automoblieSensorRecord.Opportunity__c = opp.Id;
                                      if(opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer'){
                                          automoblieSensorRecord.Account__c = opp.Installation_Account__c;
                                      }
                                      else if(opp.StageName == 'Return to HQ'){
                                          automoblieSensorRecord.Account__c = opp.Shipment_Account__c;
                                      }
                                      insertRecordList.add(automoblieSensorRecord);
                                      
                                      if(opp.StageName == 'Shipped To Customer' && automoblieSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td>Sensor</td><td>'+tagDetail+'</td><td>Sensor inserted under installation account : '+ opp.Installation_Account__c +'</td></tr>';
                                          system.debug('message details with automobile sensor insert -->' + messageDetail);
                                      }
                                  }
                                  

                              }
                              //Update function for Automobile_Presence_Sensor__c
                              if(tagDetail.startsWith('00:11:CE:D')){
                                  if(oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_Presence_Sensor__c automobliePresenceSensorRecord = (Automobile_Presence_Sensor__c)oldAutomobileRecordsMap.get(tagDetail);
                                      if((opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer') &&
                                        (automobliePresenceSensorRecord.Account__c != opp.Installation_Account__c
                                          || automobliePresenceSensorRecord.Opportunity__c != opp.Id)){
                                              
                                          automobliePresenceSensorRecord.Account__c = opp.Installation_Account__c;
                                          automobliePresenceSensorRecord.Opportunity__c = opp.Id;
                                          updateRecordList.add(automobliePresenceSensorRecord);
                                      }
                                      if(opp.StageName == 'Return to Customer' && automobliePresenceSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td> Presence Sensor</td><td>'+tagDetail+'</td><td> Sensor cannot inserted  under installation account' + opp.Installation_Account__c   + ' b/c it is already exists under the installation account.</td></tr>';
                                         
                                      }
                                  }
                                  //Insert function for Automobile_Presence_Sensor__c
                                  if(!oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_Presence_Sensor__c automobliePresenceSensorRecord = new Automobile_Presence_Sensor__c();
                                      automobliePresenceSensorRecord.Name = tagDetail;
                                      automobliePresenceSensorRecord.Opportunity__c = opp.Id;
                                      if(opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer'){
                                          automobliePresenceSensorRecord.Account__c = opp.Installation_Account__c;
                                      }
                                      else if(opp.StageName == 'Return to HQ'){
                                          automobliePresenceSensorRecord.Account__c = opp.Shipment_Account__c;
                                      }
                                      insertRecordList.add(automobliePresenceSensorRecord);
                                      if(opp.StageName == 'Shipped To Customer' && automobliePresenceSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td>Presence Sensor</td><td>'+tagDetail+'</td><td>Sensor inserted under installation account : '+ opp.Installation_Account__c  +'</td></tr>';
                                          system.debug('message details with automobile sensor insert -->' + messageDetail);
                                      }
                                  }
                                 
                              }
                              //Update function for Automobile_TDU__c
                              if(tagDetail.startsWith('00:11:CE:E')){
                                  if(oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_TDU__c automoblieTduSensorRecord = (Automobile_TDU__c)oldAutomobileRecordsMap.get(tagDetail);
                                      if((opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer') &&
                                        (automoblieTduSensorRecord.Account__c != opp.Installation_Account__c
                                          || automoblieTduSensorRecord.Opportunity__c != opp.Id)){
                                              
                                          automoblieTduSensorRecord.Account__c = opp.Installation_Account__c;
                                          automoblieTduSensorRecord.Opportunity__c = opp.Id;
                                          updateRecordList.add(automoblieTduSensorRecord);
                                      }
                                      if(opp.StageName == 'Return to Customer' && automoblieTduSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td>TDU</td><td>'+tagDetail+'</td><td>Sensor cannot inserted  under installation account' + opp.Installation_Account__c + ' b/c it is already exists under the installation account.</td></tr>';
                                          
                                      }
                                  }
                                  //Insert function for Automobile_TDU__c
                                  if(!oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_TDU__c automoblieTduSensorRecord = new Automobile_TDU__c();
                                      automoblieTduSensorRecord.Name = tagDetail;
                                      automoblieTduSensorRecord.Opportunity__c = opp.Id;
                                      if(opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer'){
                                          automoblieTduSensorRecord.Account__c = opp.Installation_Account__c;
                                      }
                                      else if(opp.StageName == 'Return to HQ'){
                                          automoblieTduSensorRecord.Account__c = opp.Shipment_Account__c;
                                      }
                                      insertRecordList.add(automoblieTduSensorRecord);
                                      if(opp.StageName == 'Shipped To Customer' && automoblieTduSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td> TDU </td><td>'+tagDetail+'</td><td>Sensor inserted under installation account : '+ opp.Installation_Account__c +'</td></tr>';
                                          system.debug('message details with automobile sensor insert -->' + messageDetail);
                                      }
                                  }
                              }
                              //Update function for Automobile_Tag__c
                              if(tagDetail.isNumeric() && tagDetail.substring(3,4) == '-' && tagDetail.substring(7,8) == '-' && tagDetail.length() == 10){
                                  if(oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_Tag__c automoblieTagSensorRecord = (Automobile_Tag__c)oldAutomobileRecordsMap.get(tagDetail);
                                      if((opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer') &&
                                        (automoblieTagSensorRecord.Account__c != opp.Installation_Account__c
                                          || automoblieTagSensorRecord.Opportunity__c != opp.Id)){
                                              
                                          automoblieTagSensorRecord.Account__c = opp.Installation_Account__c;
                                          automoblieTagSensorRecord.Opportunity__c = opp.Id;
                                          updateRecordList.add(automoblieTagSensorRecord);
                                      }
                                      if(opp.StageName == 'Return to Customer' && automoblieTagSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td>Tag</td><td>'+tagDetail+'</td><td>Sensor cannot inserted  under installation account' + opp.Installation_Account__c + ' b/c it is already exists under the installation account.</td></tr>';
                                         
                                      }
                                  }
                                  //Insert function for Automobile_Tag__c
                                  if(!oldAutomobileRecordsMap.containsKey(tagDetail)){
                                      Automobile_Tag__c automoblieTagSensorRecord = new Automobile_Tag__c();
                                      automoblieTagSensorRecord.Name = tagDetail;
                                      automoblieTagSensorRecord.Opportunity__c = opp.Id;
                                      if(opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer'){
                                          automoblieTagSensorRecord.Account__c = opp.Installation_Account__c;
                                      }
                                      else if(opp.StageName == 'Return to HQ'){
                                          automoblieTagSensorRecord.Account__c = opp.Shipment_Account__c;
                                      }
                                      insertRecordList.add(automoblieTagSensorRecord);
                                      if(opp.StageName == 'Shipped To Customer' && automoblieTagSensorRecord.Account__c == opp.Installation_Account__c){
                                          messageDetail+= '<tr><td> Tag </td><td>'+tagDetail+'</td><td>Sensor inserted under installation account : '+ opp.Installation_Account__c +'</td></tr>';
                                          system.debug('message details with automobile sensor insert -->' + messageDetail);
                                      }
                                  }
                              }
                              
                          }
                      }
                      // Update When stage is in 'Return To HQ'
                      if(opp.StageName == 'Return To HQ' && (opp.Return_To_HQ__c != null || opp.Return_To_HQ__c != '')){
                          Set<String> tagSetForReturnToHq = new Set<String>();
                          for(String atag : opp.Return_To_HQ__c.split('\n')){
                              tagSetForReturnToHq.add(atag.trim());
                          }
                          
                          if(tagSetForReturnToHq.size() > 0){
                              for(String hqTag : tagSetForReturnToHq){
                                  if(oldAutomobileRecordsMap.containsKey(hqTag)){
                                     // update Automobile_Sensor__c When stage is in 'Return To HQ'
                                      if(hqTag.startsWith('00:11:CE:00')){
                                          Automobile_Sensor__c automoblieSensorRecord = (Automobile_Sensor__c)oldAutomobileRecordsMap.get(hqTag);
                                          automoblieSensorRecord.Account__c = opp.Shipment_Account__c;
                                          System.debug('line 114 -> ' + automoblieSensorRecord);
                                          updateRecordList.add(automoblieSensorRecord);
                                          messageDetail+= '<tr><td>Sensor</td><td>'+hqTag+'</td><td>Sensor moved from installation account to Shipment account : '+ opp.Shipment_Account__c +'</td></tr>';
                                      }
                                      //update Automobile_Presence_Sensor__c When stage is in 'Return To HQ'
                                      if(hqTag.startsWith('00:11:CE:D')){
                                          Automobile_Presence_Sensor__c automobliePresenceSensorRecord = (Automobile_Presence_Sensor__c)oldAutomobileRecordsMap.get(hqTag);
                                          automobliePresenceSensorRecord.Account__c = opp.Shipment_Account__c;
                                          updateRecordList.add(automobliePresenceSensorRecord);
                                          messageDetail+= '<tr><td>Presence Sensor</td><td>'+hqTag+'</td><td>Presence Sensor moved from installation account to Shipment account : '+ opp.Shipment_Account__c +'</td></tr>';
                                      }
                                      //update Automobile_TDU__c When stage is in 'Return To HQ'
                                      if(hqTag.startsWith('00:11:CE:E')){
                                          Automobile_TDU__c automoblieTduSensorRecord = (Automobile_TDU__c)oldAutomobileRecordsMap.get(hqTag);
                                          automoblieTduSensorRecord.Account__c = opp.Shipment_Account__c;
                                          updateRecordList.add(automoblieTduSensorRecord);
                                          messageDetail+= '<tr><td>TDU</td><td>'+hqTag+'</td><td>TDU moved from installation account to Shipment account : '+ opp.Shipment_Account__c +'</td></tr>';
                                      }
                                      //update Automobile_Tag__c When stage is in 'Return To HQ'
                                      if(hqTag.isNumeric() && hqTag.substring(3,4) == '-' && hqTag.substring(7,8) == '-' && hqTag.length() == 10){
                                          Automobile_Tag__c automoblieTagSensorRecord = (Automobile_Tag__c)oldAutomobileRecordsMap.get(hqTag);
                                          automoblieTagSensorRecord.Account__c = opp.Shipment_Account__c;
                                          updateRecordList.add(automoblieTagSensorRecord);
                                          messageDetail+= '<tr><td>Tag</td><td>'+hqTag+'</td><td>Tag moved from installation account to Shipment account : '+ opp.Shipment_Account__c + '</td></tr>';
                                      }
                                  }
                              }
                          }
                      }
                      body = body + messageDetail+'</table>'+'<br/>';
                       system.debug('body ---> '+ body);
                       string messageDetail2 = ' ';
                       //Unsuccessful
                       if(!tagset.isEmpty()){
                           messageDetail2+= '<b> Unsuccessful:</b> <table border="1" cellpadding=5 cellspacing=0>' + '<tr><th>Automobile Type</th><th>Name</th> <th>Message</th></tr>';
                           for(String tag : tagSet){
                               if(!tag.startsWith('00:11:CE:00') && !tag.startsWith('00:11:CE:D') && !tag.startsWith('00:11:CE:E') && !tag.substring(0,3).isNumeric()
                                 && (opp.StageName == 'Return To HQ' || opp.StageName == 'Shipped To Customer' || opp.StageName == 'Return to Customer')){
                                     
                                   messageDetail2+= '<tr><td>Sensor</td><td>'+tag+'</td><td>Invalid sensor</td></tr>';
                                   system.debug('Invalid sensor -->' + messageDetail);
                               }
                              
                           }
                           body+= messageDetail2+'</table>'+'<br/>';
                       }
                       //body = body + messageDetail+'</table>'+'<br/>';
                       system.debug('body 306 ---> '+ body);
                       mail.setHtmlBody(body);
                       emailList.add(mail);
                  }
        }
        if(updateRecordList.size()>0){
            Update updateRecordList;
        }
        if(insertRecordList.size()>0){
            Insert insertRecordList;
        }
        if(emailList.size()>0){
           Messaging.sendEmail(emailList);
        }
    }
    
}