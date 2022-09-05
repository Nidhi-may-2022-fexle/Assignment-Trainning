import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    firstName = "World";

    handleChange(event) {
        this.firstName = event.target.value;
        console.log(event.target.value);
    }

}