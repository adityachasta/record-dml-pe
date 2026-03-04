/*
* Name              : RecordDMLEventTrigger
* Description       : Trigger on Record_DML_Event__e to act as a subscriber
* Created           : 4th March 2026
* ------------------------- Change History -----------------------------
* Change Type       : Created
* Change Date       : 4th March 2026
* Change Description: Created
*/

trigger RecordDMLEventTrigger on Record_DML_Event__e (after insert) {
    RecordDMLEventTriggerHandler.handleAfterInsert(Trigger.new);
}