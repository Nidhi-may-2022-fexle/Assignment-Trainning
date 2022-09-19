import { LightningElement } from 'lwc';
export default class ParentProgressbarAssignment extends LightningElement {

    percentage;

    handleParentChange(event) {
        this.percentage =event.detail;
    }

}