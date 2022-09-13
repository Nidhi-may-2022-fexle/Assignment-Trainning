import { LightningElement, wire } from 'lwc';
import getAccount from '@salesforce/apex/AccountRelatedContact.getAccount';
import getContact from '@salesforce/apex/AccountRelatedContact.getContact';
import getCase from '@salesforce/apex/AccountRelatedContact.getCase';
import getOpportunity from '@salesforce/apex/AccountRelatedContact.getOpportunity';

export default class AccountRelatedContact extends LightningElement {
    
    acccolumns = [{ label: 'Name', fieldName: 'Name' }, {label:'Id', fieldName: 'Id'}];
    accountNameWithWire;

    @wire(getAccount)accountWire({data, error}){
        if(data){
            this.accountNameWithWire = data;
        } else(error) => {
            console.log(error);
        }

    }

    accountName;
    handleShow(){
        getAccount()
        .then((result) =>{
            this.accountName = result;

        })
        .catch((error) => {
            console.log(error);

        })
    }


    contactList;
    caseList;
    oppList;
    accountId;

    contactcolumns = [{ label: 'FirstName', fieldName: 'FirstName' }, {label:'LastNmae', fieldName: 'LastName'} ,{ label: 'Id', fieldName: 'Id'}];
    caseColumns = [{label: 'SuppliedName', fieldName: 'SuppliedName'}, {label: 'Id', fieldName: 'Id'}];
    opportunityColumns = [{label: 'Name', fieldName: 'Name' }, {label: 'Id', fieldName: 'Id' }];

    accountIdChangeHandle(event){
        this.accountId = event.target.value;
        this.relatedRecord();
    }

    relatedRecord(){
        getContact({accId : this.accountId})
        .then((conResult) => {
            this.contactList = conResult;

        }).catch(()=>{
            console.log(error);
        })

        getCase({accId : this.accountId})
        .then((caseResult) => {
            this.caseList = caseResult;
        }).catch(()=>{
            console.log(error);
        })

        getOpportunity({accId :this.accountId})
        .then((oppResult) => {
            this.oppList = oppResult;
        }).catch(()=>{
            console.log(error);
        })
        
    }

/*  contactcolumns = [{ label: 'FirstName', fieldName: 'FirstName' }, {label:'LastNmae', fieldName: 'LastName'} ,{ label: 'Id', fieldName: 'Id'}];
    caseColumns = [{label: 'SuppliedName', fieldName: 'SuppliedName'}, {label: 'Id', fieldName: 'Id'}];

    contactNameWithWire;
    caseWithWire;
    accIdWithWire;
    contact;
    case;

    changeHandleWithWire(event){
        this.accIdWithWire = event.target.value;
        this.contact = this.getcontactWithWire;
        this.case = this.getcaseWithWire;
    }

   @wire(getContact, {accId: this.accIdWithWire})getcontactWithWire({data, error}){
        if(data){
            this.contactNameWithWire = data;
        } else(error) => {
            console.log(error);
        }
    }

    @wire(getCase, {aacId: this.accIdWithWire})getcaseWithWire({data,error}){
        if(data){
            this.caseWithWire = data;
        } else(error) => {
            console.log(error);
        }
    }*/
    

}