import { LightningElement } from 'lwc';
export default class CalculateInterest extends LightningElement {

    principalAmount;
    time;
    rate;
    result;

    principalAmountHandleChange(event){
       this.principalAmount = parseInt(event.target.value);
   }

   timeHandleChange(event){
       this.time = parseInt(event.target.value);
   }

   rateHandleChnage(event){
       this.rate = parseFloat(event.target.value);
   }

   simpleInterest(){
       this.result = 'Simple Interest =  '  + parseFloat((this.principalAmount * this.time * this.rate) /100).toFixed(3);

   }

   compoundInterest(){
       this.result = 'Compound Interest = ' + parseFloat(this.principalAmount * ( Math.pow ((1 + this.rate / 100), this.time))).toFixed(3) ;
   }

}