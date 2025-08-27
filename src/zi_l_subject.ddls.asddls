@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Subject'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_L_SUBJECT as select from ztb_l_subject 
association to parent ZI_L_TASK as _Task on $projection.Step  = _Task.Step
{
    key step as Step,
    key line_number as line_number,
    subject as Subject,
    date_from as DateFrom,
    sent_on as SentOn,
    priority as Priority,
    due_date as DueDate,
    status as Status,
    forward_by as ForwardBy,
//    'https://www.google.com' as DefaultUrl
    _Task
}
