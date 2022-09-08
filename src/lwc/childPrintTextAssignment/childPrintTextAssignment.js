import { LightningElement, api} from 'lwc';
export default class ChildPrintTextAssignment extends LightningElement {

    text = 'Default Child Text';

   @api handleChangeChild(){

       this.text = 'Changed Text';
   }

}