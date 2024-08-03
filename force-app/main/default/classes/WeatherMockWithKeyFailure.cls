@isTest
global class WeatherMockWithKeyFailure implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"error": {"code": 1003,"message": "Parameter q is missing."}}');
        response.setStatusCode(400);
        return response; 
    }
}