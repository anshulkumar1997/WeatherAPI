/* 	This class explains the use of the Weather API to get the current weather in a given city
	The API is used in a RESTFul way, so we use the HTTP Class to send our request and receive a response
	The response is converted into a deserialised using JSON Object and then into a Apex Class to be used
*/
public with Sharing class WeatherAPI {
    // Method to get the Current weather in a city with GET Call, REST API
    public static void getWeatherOpenMeteoMethod(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m,relative_humidity_2m,dew_point_2m&timezone=auto&forecast_days=1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        weatherWrapper results = (weatherWrapper) JSON.deserialize(response.getBody(),weatherWrapper.class);
        hourly_units hourly_unit =(hourly_units) results.hourly_units;
        hourly hours = (hourly) results.hourly;
        system.debug(hourly_unit);
        system.debug(hours);
    }
    // Method to get the Current weather in a city given by EndUser with GET Call, REST API
    @AuraEnabled(cacheable=true)
    public static weatherAPIOutputWrapper getWeatherAPIMethod(String location){
        weatherAPIInputWrapper results = new weatherAPIInputWrapper();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('key', System.Label.WeatherAPIKey); //API Key in Custom Label
        String city = location;
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint('https://api.weatherapi.com/v1/current.json?q='+city);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
            results = (weatherAPIInputWrapper) JSON.deserialize(response.getBody(),weatherAPIInputWrapper.class);
            weatherAPIOutputWrapper resultsOutput = new weatherAPIOutputWrapper();
            resultsOutput.name = results.location.name;
            resultsOutput.region = results.location.region;
            resultsOutput.country = results.location.country;
            resultsOutput.localtime = results.location.localtime;
            resultsOutput.tz_id = results.location.tz_id;
            resultsOutput.temp_c = results.current.temp_c;
            resultsOutput.temp_f = results.current.temp_f;
            resultsOutput.wind_kph = results.current.wind_kph;
            resultsOutput.wind_mph = results.current.wind_mph;
            resultsOutput.wind_dir = results.current.wind_dir;
            resultsOutput.cloud = results.current.cloud;
            resultsOutput.feelslike_c = results.current.feelslike_c;
            resultsOutput.feelslike_f = results.current.feelslike_f;
            resultsOutput.pressure_mb = results.current.pressure_mb;
            resultsOutput.pressure_in = results.current.pressure_in;
            resultsOutput.humidity = results.current.humidity;
            resultsOutput.precip_mm = results.current.precip_mm;
            resultsOutput.precip_in = results.current.precip_in;
            resultsOutput.Status=response.getStatus();
            resultsOutput.StatusCode=response.getStatusCode();
            system.debug(resultsOutput);
            return resultsOutput;
        }
        else {
            system.debug('Error Status'+response.getStatus());
            system.debug('Error Status Code'+response.getStatusCode());
            weatherAPIOutputWrapper resultsOutput = new weatherAPIOutputWrapper();
            resultsOutput.Status=response.getStatus();
            resultsOutput.StatusCode=response.getStatusCode();
            return resultsOutput;
        }
    }
    
    //Wrapper Class for Output to LWC to display on Screen
    public class weatherAPIOutputWrapper{
        @AuraEnabled
        public String name;
        @AuraEnabled
        public String region;
        @AuraEnabled
        public String country;
        @AuraEnabled
        public String localtime;
        @AuraEnabled
        public String tz_id;
        @AuraEnabled
        public Decimal temp_c;
        @AuraEnabled
        public Decimal temp_f;
        @AuraEnabled
        public Decimal wind_mph;
        @AuraEnabled
        public Decimal wind_kph;
        @AuraEnabled
        public string wind_dir;
        @AuraEnabled
        public Decimal cloud;
        @AuraEnabled
        public Decimal feelslike_c;
        @AuraEnabled
        public Decimal feelslike_f;
        @AuraEnabled
        public Decimal pressure_mb;
        @AuraEnabled
        public Decimal pressure_in;
        @AuraEnabled
        public Decimal humidity;
        @AuraEnabled
        public Decimal precip_mm;
        @AuraEnabled
        public Decimal precip_in;
        @AuraEnabled
        public string status;
        @AuraEnabled
        public integer StatusCode;
    }
    
    // Wrapper class to support the deserialisation of RESTful JSON response of Open WeatherAPI
    public class weatherAPIInputWrapper{
        public location location;
        public current current;
    }
    // Wrapper class to support the deserialisation of RESTful JSON response of OPEN METEO
    public class weatherWrapper{
        public Double latitude;
        public Double longitude;
        public Double generationtime_ms;
        public Integer utc_offset_seconds;
        public String timezone;
        public String timezone_abbreviation;
        public Double elevation;
        hourly_units hourly_units = new hourly_units();
        hourly hourly = new hourly();
    }
    // Supporting the Wrapper with inside JSONs
    public class hourly_units{
        public String temperature_2m;
        public String relative_humidity_2m;
        public String dew_point_2m;
    }
    public class hourly{
        public List<Decimal> temperature_2m;
        public List<Integer> relative_humidity_2m;
        public List<Decimal> dew_point_2m;
    }
    public class location{
        public String name;
        public String region;
        public String country;
        public Decimal lat;
        public Decimal lon;
        public String tz_id;
        public Decimal localtime_epoch;
        public String localtime;
    }  
    public class current{
        public Decimal last_updated_epoch;
        public String last_updated;
        public Decimal temp_c;
        public Decimal temp_f;
        public Integer is_day;
        public Decimal wind_mph;
        public Decimal wind_kph;
        public Decimal wind_degree;
        public string wind_dir;
        public Decimal pressure_mb;
        public Decimal pressure_in;
        public Decimal humidity;
        public Decimal precip_mm;
        public Decimal precip_in;
        public Decimal cloud;
        public Decimal feelslike_c;
        public Decimal feelslike_f;
        public Decimal windchill_c;
        public Decimal windchill_f;
        public Decimal heatindex_c;
        public Decimal heatindex_f;
        public Decimal dewpoint_c;
        public Decimal dewpoint_f;
        public Decimal vis_km;
        public Decimal vis_miles;
        public Decimal uv;
        public Decimal gust_mph;
        public Decimal gust_kph;
        public condition condition;
    }    
    public class condition{
        public String text;
        public String icon;
        public Integer code;
    }
}