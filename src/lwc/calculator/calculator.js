import { LightningElement, track } from 'lwc';
export default class Calculator extends LightningElement {
   @track firstNumber;
   @track secondNumber;
   result;

   handleChange1(event){
       this.firstNumber = parseInt(event.target.value);
   }
   handleChange2(event){
       this.secondNumber = parseInt(event.target.value);
   }

    
   add() {
        this.result = parseFloat(this.firstNumber + this.secondNumber).toFixed(3);
    }
    Subtract() {
        this.result = parseFloat(this.firstNumber - this.secondNumber).toFixed(3);
    }
    Multiply() {
        this.result = parseFloat(this.firstNumber * this.secondNumber).toFixed(3);
    }
    Divide() {
        this.result = parseFloat(this.firstNumber / this.secondNumber).toFixed(3);
        
    }

}