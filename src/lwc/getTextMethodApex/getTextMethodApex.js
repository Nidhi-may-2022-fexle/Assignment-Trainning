import { LightningElement, wire } from 'lwc';
import getTextMethod1 from '@salesforce/apex/LwcApexClass.getTextMethod1';
import getTextMethod2 from '@salesforce/apex/LwcApexClass.getTextMethod2';
import getTextMethod3 from '@salesforce/apex/LwcApexClass.getTextMethod3';

export default class GetTextMethodApex extends LightningElement {

    result1;
    result2;
    result3;


    apexMethods() {
        getTextMethod1()
        .then((method1) => {
            this.result1 = 'Method1 result:   '  + method1;
            getTextMethod2()
            .then((method2) => {
                this.result2 = 'Method2 result:   '  + method1 +  '  '  + method2;

                getTextMethod3()
                .then((method3) => {
                    this.result3 = 'Method3 result:   ' + method1 +  '   '   + method2 +   '  '   + method3;
                })
            })
        })
    }


 /*   wireResult1;
    wireResult2;
    wireResult3;

    @wire(getTextMethod1) wireMethod1({data, error }) {
        if (data) {
            this.wireResult1 = data;
        } else (error) => {
            console.log(error);
        }
    }

    @wire(getTextMethod2) wireMethod2({data , error}){
        if(data){
            this.wireResult2 = this.wireResult1 + data;
        } else (error) => {
            console.log(error);
        }
    }

    @wire(getTextMethod3) wireMethod3({data , error}){
        if(data){
            this.wireResult3 =   this.wireResult2   +  data;
        } else (error) => {
            console.log(error);

        }
    } 

    resultWithWire;
    apexMethodWithWire(){
        this.resultWithWire = 'Method1 result:'  + this.wireMethod1;
        this.resultWithWire =  'Method2 result: ' + this.wireMethod2;
        this.resultWithWire =  'Method1 result:' +  this.wireMethod3;

    } */


    promiseResult1;
    promiseResult2;
    promiseResult3;

  /*  promiseHandleChange(){
        const promise = new Promise ((resolve, reject) => {
            setTimeout(()=>{
                resolve(getTextMethod1);
                resolve(getTextMethod2);
                resolve(getTextMethod3);

            },2000);
        });

        promise
        .then(() =>{
            getTextMethod1()
            .then((method1) =>{
                this.promiseResult1 = method1;
            }).catch(()=>{
                console.log(Error);
            })
            getTextMethod2()
            .then((method2)=>{
                this.promiseResult2 = this.promiseResult1 + method2;
            }).catch(()=>{
                console.log(Error);
            })
            getTextMethod3()
            .then((method3)=>{
                this.promiseResult3 = this.promiseResult2 + method3;
            }).catch(()=>{
                console.log(Error);
            })

        })
    } */

    promiseHandleChange(){
        const promise = new Promise ((resolve, reject) => {
            setTimeout(() =>{
                resolve(getTextMethod1);
                resolve(getTextMethod2);
                resolve(getTextMethod3);   
            }, 2000);

        });

        promise
        .then(() =>{
            getTextMethod1()
            .then((method1) => {
                this.promiseResult1 = 'Method1 result:   '  +  method1;
                getTextMethod2()
                .then((method2) => {
                    this.promiseResult2 = 'Method2 result:   '  + method1 +  '  '  +  method2;
                    
                    getTextMethod3()
                    .then((method3) => {
                        this.promiseResult3 = 'Method3 result:   ' + method1 +  '   '   + method2 +   '  '   +  method3;
                    })
                    .catch(()=>{
                        console.log(error);
                    })
                }).catch(()=>{
                    console.log(error);
                })
            }).catch(()=>{
                console.log(error);
            })
        })
    } 
}