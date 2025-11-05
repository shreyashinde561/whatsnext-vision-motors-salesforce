global class StockUpdateBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Stock__c FROM Vehicle__c');
    }
    global void execute(Database.BatchableContext bc, List<Vehicle__c> scope) {
        for (Vehicle__c v : scope) {
            if (v.Stock__c < 1) v.Stock__c = 10;
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc) {
        System.debug('Batch complete');
    }
}
