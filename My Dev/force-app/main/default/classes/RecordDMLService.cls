/*
* Name              : RecordDMLService
* Description       : This class contains the DML logic
* Created           : 4th March 2026
* ------------------------- Change History -----------------------------
* Change Type       : Created
* Change Date       : 4th March 2026
* Change Description: Created
*/
public with sharing class RecordDMLService {
    
    /*
    * @methodName      : processDML
    * @description     : This method is used to process the async DMLs
    * @param           : Map<String, List<Record_DML_Event__e>>
    * @return          : void
    * @exception       : none
    * @changeHistory   : none
    */
    public static void processDML(Map<String, List<sObject>> operationToEventMap) {
        try {
            if(operationToEventMap.containsKey(RecordDMLConstantUtility.dmlInsert)) {
                INSERT operationToEventMap.get(RecordDMLConstantUtility.dmlInsert);
            }
            if(operationToEventMap.containsKey(RecordDMLConstantUtility.dmlUpdate)) {
                UPDATE operationToEventMap.get(RecordDMLConstantUtility.dmlUpdate);
            }
            if(operationToEventMap.containsKey(RecordDMLConstantUtility.dmlUpdate)) {
                DELETE operationToEventMap.get(RecordDMLConstantUtility.dmlDelete);
            }
        } catch(Exception e) {
            System.debug('Exception: ' + e.getMessage());   
            //Insert Logger
        }
    }
}