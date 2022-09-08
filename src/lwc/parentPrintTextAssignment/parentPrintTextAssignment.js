import { LightningElement } from 'lwc';
export default class ParentPrintTextAssignment extends LightningElement {

    changeHandle(){
        this.template.querySelector("c-Child-Print-Text-Assignment").handleChangeChild();
    }

}