import { LightningElement } from 'lwc';
export default class ChildProgressbarAssignment extends LightningElement {

    handleChildChange(event){
        const childEvent = new CustomEvent("childvaluechange", {detail : event.target.value});
        this.dispatchEvent(childEvent);

    }

}