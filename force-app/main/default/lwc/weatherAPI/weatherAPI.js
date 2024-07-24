import { LightningElement } from 'lwc';
import getWeatherAPIMethod from '@salesforce/apex/WeatherAPI.getWeatherAPIMethod';
import LightningAlert from 'lightning/alert';

export default class WeatherAPI extends LightningElement {
    location = '';
    locationWithoutSpace ='';
    results;
    locationResults;

    handleLocationChange(event) {
        this.location = event.target.value;
    }
    getCorrectLocation(){
        
        this.locationWithoutSpace=this.location.replaceAll(' ','_');
        console.log(this.locationWithoutSpace);
        //this.handleAlertClick();
    }
    async handleAlertClick() {
        await LightningAlert.open({
            message: 'This is the Weather: '+this.weather,
            theme: 'Success', 
            label: 'Location!', 
        });
        //Alert has been closed
    }
    async getWeather() {
        this.getCorrectLocation();

        getWeatherAPIMethod({ location: this.locationWithoutSpace })
            .then(result => {
                if(result.StatusCode===200){
                    this.results = result;
                    /*LightningAlert.open({
                        message: 'This is the Temperature: '+result.temp_c,
                        theme: 'Success', 
                        label: 'Location!', 
                    });*/
                }
                else{
                    LightningAlert.open({
                        message: 'ERROR! '+result.status,
                        theme: 'error', 
                        label: 'Error!', 
                    });
                }
            })
            .catch(error => {
                console.log(error);
        });
    }
}