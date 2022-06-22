trigger updatingthebookprice on Book__c (before insert) {
   Book__c[] books = Trigger.new;
   updatingthebookprice.applyDiscount(books);

}