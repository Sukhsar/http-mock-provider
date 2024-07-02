@isTest 
public class HttpCalloutMocker implements HttpCalloutMock {
    protected List<HttpResponse> orderedResponses = 
        new List<HttpResponse>();
    
    public HttpCalloutMocker(HttpResponse response) {
        System.debug('HttpCalloutMocker: with response');
        this.orderedResponses.add(response);
    }
    
    public HttpCalloutMocker(List<HttpResponse> orderedResponses) {
        this.orderedResponses = orderedResponses;
    }

    public HttpResponse respond(HttpRequest request) {
        return this.orderedResponses.remove(0);
    }
}
