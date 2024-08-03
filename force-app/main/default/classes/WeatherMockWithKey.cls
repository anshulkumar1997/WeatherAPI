@isTest
global class WeatherMockWithKey implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"location": {"name": "London","region": "City of London, Greater London","country": "United Kingdom","lat": 51.52,"lon": -0.11,"tz_id": "Europe/London","localtime_epoch": 1722701317,"localtime": "2024-08-03 17:08"},"current": {"last_updated_epoch": 1722700800,"last_updated": "2024-08-03 17:00","temp_c": 23.6,"temp_f": 74.5,"is_day": 1,"condition": {"text": "Sunny","icon": "//cdn.weatherapi.com/weather/64x64/day/113.png","code": 1000},"wind_mph": 10.5,"wind_kph": 16.9,"wind_degree": 298,"wind_dir": "WNW","pressure_mb": 1010.0,"pressure_in": 29.83,"precip_mm": 0.0,"precip_in": 0.0,"humidity": 41,"cloud": 5,"feelslike_c": 24.7,"feelslike_f": 76.4,"windchill_c": 23.6,"windchill_f": 74.5,"heatindex_c": 24.7,"heatindex_f": 76.4,"dewpoint_c": 9.7,"dewpoint_f": 49.4,"vis_km": 10.0,"vis_miles": 6.0,"uv": 6.0,"gust_mph": 12.4,"gust_kph": 20.0}}');
        response.setStatusCode(200);
        return response; 
    }
}