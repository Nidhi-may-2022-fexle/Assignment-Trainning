//Test class for AccountQueueableExample

@isTest
public with sharing class AccountQueueableExampleTest {

    //this setup method will reduce execution time when record is large
    @testSetup
    static void setup(){
        List<Account> accountList = new List<Account>();

        for (Integer i = 0; i < 100; i++) {
            accountList.add(new Account(name='Test Account'+i));
        }
        insert accountList;
    }

    static testmethod void testQueueable(){

        // query for test data to pass to queueable class
        List<Account> accounts = [select id, name from account where Name = 'Test Account'];
     
        AccountQueueableExample accQObj = new AccountQueueableExample(accounts);
        System.Test.startTest();        
        System.enqueueJob(accQObj);
        System.Test.stopTest();  

        System.assertEquals(100, [select count() from account where Name ='sfdcpoint']);

    }

    static testmethod void test1(){
        // startTest/stopTest block to force async processes 
        //   to run in the test.
        System.Test.startTest();        
      //  System.enqueueJob( new AccountQueueableExample());
        System.Test.stopTest();

        // Validate that the job has run
        // by verifying that the record was created.
        // This query returns only the account created in test context by the 
        // Queueable class method.
        Account acct = [SELECT Name,Phone FROM Account WHERE Name='Acme' LIMIT 1];
        System.assertNotEquals(null, acct);
        System.assertEquals('(415) 555-1212', acct.Phone);
    }

}