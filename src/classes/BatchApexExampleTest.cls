//Test class for BatchApexExample

@isTest
public class BatchApexExampleTest {

    static testmethod void test(){

        // test accounts to be updated by batch

        List<Account> accList = new List<Account>();

        for (Integer i=0;i<400;i++) {
            Account ac = new Account(Name = 'Account ' + i);
            accList.add(ac);
        }

        insert accList;

        System.Test.startTest();
            BatchApexExample b = new BatchApexExample();
        Database.executeBatch(b);
        System.Test.stopTest();

        List<Account> accUpdatedList = [SELECT Id, Name FROM Account];
        System.assert(accUpdatedList[0].Name.Contains('sfdcpoint'));

    }

}