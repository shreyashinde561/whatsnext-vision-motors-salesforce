public class OrderTriggerHandler {
    public static void validateStock(List<Order__c> orders) {
        for (Order__c o : orders) {
            Vehicle__c v = [SELECT Stock__c FROM Vehicle__c WHERE Id = :o.Vehicle__c LIMIT 1];
            if (v.Stock__c <= 0) {
                o.addError('Vehicle is out of stock.');
            }
        }
    }

    public static void assignDealer(List<Order__c> orders) {
        for (Order__c o : orders) {
            o.Dealer__c = [SELECT Id FROM Dealer__c WHERE IsActive__c = TRUE LIMIT 1].Id;
        }
    }
}
