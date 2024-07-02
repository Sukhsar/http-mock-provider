# http-mock-provider

A populer and helpful http mocker used to mock http callout during unit testing.  

This is very helpfull initially. However, As we progress, I end up adopting an integration design pattern and the main class responsible for external callout went behind a factory pattern and every unit testing situation, I end up stubbing the polymoprphic instance variable. So, eventually, I no longer use it. I might use it in future if I can't fit a new integration requirement within the pattern.

## Usage:

```apex
@isTest
public class SampleTest {

    @isTest 
    static void demoSuccessTest() {
        // Prepare mock responses
        final Integer BULK_SIZE = 5;
        List<System.HttpResponse> mockResponses = 
            new List<System.HttpResponse>();
        for(Integer i = 0; i < BULK_SIZE; i++) {
        	System.HttpResponse res = new System.HttpResponse();
            res.setBody('Test Body - ' + i);
            res.setStatusCode(200);    
            mockResponses.add(res);
        }
        System.HttpCalloutMock mocker = 
            new HttpCalloutMocker(mockResponses);
        System.Test.setMock(System.HttpCallOutMock.class, mocker);
        
        System.Test.StartTest();
        // TODO: Unit test that makes call out will receive  
        // mock responses in same order as added.
        System.Test.stopTest();
    }
}
```
