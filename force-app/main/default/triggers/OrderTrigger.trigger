trigger OrderTrigger on Order__c (before insert, before update) {
    if (Trigger.isBefore && Trigger.isInsert) {
        OrderTriggerHandler.validateStock(Trigger.new);
        OrderTriggerHandler.assignDealer(Trigger.new);
    }
}
