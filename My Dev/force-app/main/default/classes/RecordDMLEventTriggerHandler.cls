/*
* Name              : RecordDMLEventTriggerHandler
* Description       : Handler class for  Record_DML_Event__e trigger
* Created           : 4th March 2026
* ------------------------- Change History -----------------------------
* Change Type       : Created
* Change Date       : 4th March 2026
* Change Description: Created
*/
public with sharing class RecordDMLEventTriggerHandler {

    /*
    * @methodName      : handleAfterInsert
    * @description     : This method is used to handle the after insert event
    * @param           : List<Record_DML_Event__e>
    * @return          : void
    * @exception       : none
    * @changeHistory   : none
    */
    public static void handleAfterInsert(List<Record_DML_Event__e> newEventList) {
        Map<String, List<sObject>> operationToEventMap = new Map<String, List<sObject>>();
        for (Record_DML_Event__e recordDMLEvent : newEventList) {
            if(!operationToEventMap.containsKey(recordDMLEvent.Operation__c)) {
                operationToEventMap.put(recordDMLEvent.Operation__c, new List<sObject>());
            }
            operationToEventMap.get(recordDMLEvent.Operation__c).addAll((List<sObject>)JSON.deserialize(recordDMLEvent.Record_JSON__c, List<sObject>.class));
        }
        
        if(operationToEventMap.size() > 0) {
            RecordDMLService.processDML(operationToEventMap);
        }
    }
}