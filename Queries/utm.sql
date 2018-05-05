SELECT Employee__c,
  Employee__r.Name,
  Week_Ending__c,
  SUM(Total_Hours_Scheduled_Only__c)
FROM
  Unified_Time_Management__c
WHERE
  RecordType.Name = 'Schedule'
  And Location_Scheduled__r.Parent_Location__r.Name = '26000 - Amazon SLU'
  AND Salary_Hourly__c = 'Hourly'
  AND In_Time_Scheduled__c > Today
  AND Week_Ending__c = THIS_WEEK
  AND Void_Entire_Shift_Mispunch__c = FALSE
GROUP BY
  Employee__c,
  Employee__r.Name,
  Week_Ending__c

  -- This SOQL queries UTM records for open schedules to be used to update
  -- contact records with currently scheduled hours for this week.
