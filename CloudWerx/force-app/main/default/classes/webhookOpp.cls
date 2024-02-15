public class webhookOpp {
    @future(callout=true)
    public static void handleWebhook(Id opportunityId) {
        String webhookUrl = System.Label.Webhook_URL_Label;


        if (String.isBlank(webhookUrl)) {
            System.debug('Webhook URL is empty');

            return;
        }

        HttpRequest req = new HttpRequest();
        req.setEndpoint(webhookUrl);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody('{"opportunityId": "' + opportunityId + '"}'); 

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() != 200) {
            System.debug('Webhook call failed with status code: ' + res.getStatusCode());
        }
    }
}