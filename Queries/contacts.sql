SELECT Employee__c,
  Employee__r.Name,
  Related_UTM__r.Location_Captured__r.Parent_Location__r.Name Parent,
  Week_Ending__c,
  SUM(RT__c),
  SUM(OT__c),
  SUM(DT__c),
  SUM(Total__c)
FROM
  Payroll__c
WHERE
  Void__c = FALSE
  AND Related_UTM__r.Location_Captured__r.Parent_Location__r.Name = '26000 - Amazon SLU'
  AND RecordType.Name = 'Payroll Punch'
  AND Salary_or_Hourly__c = 'Hourly'
  AND Week_Ending__c = THIS_WEEK
GROUP BY
  Employee__c,
  Employee__r.Name,
  Related_UTM__r.Location_Captured__r.Parent_Location__r.Name,
  Week_Ending__c
