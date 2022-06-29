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
public class CustomerPurchaseOrder implements PurchaseOrder {
    public Double discount() {
        return .05;  // Flat 5% discount
    }
}