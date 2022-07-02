/**
*  Description     : Process Purches Order
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  07/01/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				    . 
*
**/
public with sharing class ProcessPurchesOrder {
    public ProcessPurchesOrder() {

        PurchaseOrder order1 = new EmployeePurchaseOrder();
        PurchaseOrder order2 = new CustomerPurchaseOrder();
        PurchaseOrder order3 = new SellerPerchaseOrder();

        //orders
        processOrder(order1);
        processOrder(order2);
        processOrder(order3);



    }

    /**
     * 
     *   @description    :  Display discount
     *
     *   @args           :  
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 07/01/2022 - Developer Name - Nidhi Kumari
     * 
     **/
    
    public void processOrder(PurchaseOrder Order){
        System.debug(Order.discount());
     }
}