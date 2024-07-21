public class WeatherAPI {
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
    Public class weatherWrapper{
        Public Double latitude;
        Public Double longitude;
		Public Double generationtime_ms;
        Public Integer utc_offset_seconds;
        Public String timezone;
        Public String timezone_abbreviation;
        Public Double elevation;
        hourly_units hourly_units = new hourly_units();
        hourly hourly = new hourly();
    }
    public class hourly_units{
            Public String temperature_2m;
            Public String relative_humidity_2m;
            Public String dew_point_2m;
        }
    public class hourly{
            Public List<Decimal> temperature_2m;
            Public List<Integer> relative_humidity_2m;
            Public List<Decimal> dew_point_2m;
        }
}