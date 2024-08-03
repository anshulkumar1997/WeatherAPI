/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class WeatherAPITest {
    // This Test method is to Test the Without API key given method
    @isTest
    static void getWeatherOpenMeteoMethodTest() {
        Test.startTest();    // Start the test
        Test.setMock(HttpCalloutMock.class, new WeatherMockWithoutKey());
        WeatherAPI.getWeatherOpenMeteoMethod();
        Test.stopTest();    // End the test
        
    }

    // This Method is to test the API call with Key and Location given
    @isTest
    static void getWeatherAPIMethodTestWithoutFailure() {
        Test.startTest();    // Start the test
        Test.setMock(HttpCalloutMock.class, new WeatherMockWithKey());
        WeatherAPI.weatherAPIOutputWrapper result = WeatherAPI.getWeatherAPIMethod('London');
        System.assertEquals('London', result.locationOutput.name, 'Location name does not match');
        System.assertEquals('City of London, Greater London', result.locationOutput.region, 'Location region does not match');
        Test.stopTest();    // End the test
        
    }

    @isTest
    static void getWeatherAPIMethodTestWithFailure() {
        Test.startTest();    // Start the test
        Test.setMock(HttpCalloutMock.class, new WeatherMockWithKeyFailure());
        WeatherAPI.weatherAPIOutputWrapper result = WeatherAPI.getWeatherAPIMethod('');
        System.assertEquals(400, result.StatusCode, 'Status Code does not match');
        Test.stopTest();    // End the test
        
    }
}