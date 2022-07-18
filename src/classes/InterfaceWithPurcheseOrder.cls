public with sharing class InterfaceWithPurcheseOrder {
    
    public interface PurchaseOrder {
        Double discount();
    
        
    }

    /**
*  Description     :  customer Purchase Order Class
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/

    class CustomerPurchaseOrder implements PurchaseOrder {
        public Double discount() {
            return .05;  // Flat 5% discount
        }
    }

    /**
*  Description     :  Employee Purchase Order Class
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/


    class EmployeePurchaseOrder implements PurchaseOrder {
        public Double discount() {
            return .10;  // 10% discount
          } 
    }

    /**
*  Description     :  Sellers Purchase Order Class
*
*  Created By      :  Nidhi Kumari
*
*  Created Date    :  06/29/2022
*
*  Revision Logs   :    V1.0 - Created - Nidhi Kumari
*				   
*
**/

    class SellerPerchaseOrder implements PurchaseOrder {
        public Double discount() {
            return .30;  // 30% discount
          }
    }

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

    public class ProcessPurchesOrder {
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
    


}