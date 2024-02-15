trigger OpportunityWebhookTrigger on Opportunity (after insert, after update) {
    for (Opportunity opp : Trigger.new) {
        webhookOpp.handleWebhook(opp.Id);
    }
}