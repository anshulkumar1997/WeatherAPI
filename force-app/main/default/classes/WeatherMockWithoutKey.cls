@isTest
global class WeatherMockWithoutKey implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"latitude": 52.52,"longitude": 13.419998,"generationtime_ms": 0.0429153442382813,"utc_offset_seconds": 7200,"timezone": "Europe/Berlin","timezone_abbreviation": "CEST","elevation": 38,"hourly_units": {"time": "iso8601","temperature_2m": "°C","relative_humidity_2m": "%","dew_point_2m": "°C"},"hourly": {"time": ["2024-08-03T00:00","2024-08-03T01:00","2024-08-03T02:00","2024-08-03T03:00","2024-08-03T04:00","2024-08-03T05:00","2024-08-03T06:00","2024-08-03T07:00","2024-08-03T08:00","2024-08-03T09:00","2024-08-03T10:00","2024-08-03T11:00","2024-08-03T12:00","2024-08-03T13:00","2024-08-03T14:00","2024-08-03T15:00","2024-08-03T16:00","2024-08-03T17:00","2024-08-03T18:00","2024-08-03T19:00","2024-08-03T20:00","2024-08-03T21:00","2024-08-03T22:00","2024-08-03T23:00"],"temperature_2m": [18.1, 17.9, 17.7, 17, 16.5, 15.6, 15, 15.2, 16.6, 18.1, 19.8, 21.3, 22.4, 23.3, 23.9, 24.1, 24.5, 25, 24.9, 24.7, 24, 22.7, 21.4, 20.6],"relative_humidity_2m": [78, 80, 83, 86, 87, 89, 90, 88, 85, 77, 64, 57, 55, 48, 46, 47, 47, 45, 47, 47, 51, 59, 66, 69],"dew_point_2m": [14.2, 14.4, 14.8, 14.7, 14.3, 13.8, 13.4, 13.2, 14.1, 14, 12.8, 12.5, 12.9, 11.7, 11.6, 12.1, 12.5, 12.3, 12.9, 12.6, 13.3, 14.3, 14.8, 14.7]}}');
        response.setStatusCode(200);
        return response; 
    }
}