@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Task'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_L_TASK as select from ztb_l_step
composition [1..*]  of ZI_L_SUBJECT as _Subject
association to ZI_L_TASK as _Parent on $projection.RefStep = _Parent.Step
{
    key step as Step,
    sub_step as SubStep,
    step_descr as StepDescr,
    ref_step as RefStep,
    substep_descr as SubstepDescr,
    _Parent,
    _Subject
}
