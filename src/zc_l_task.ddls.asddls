@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Task'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality:#X,
  sizeCategory:#S,
  dataClass:#MIXED
}
@Metadata.allowExtensions:true
//@Search.searchable:true

@OData.hierarchy.recursiveHierarchy: [{ entity.name: 'ZI_L_SUBSTEP' }]
define root view entity ZC_L_TASK as projection on ZI_L_TASK

association of many to one ZC_L_TASK as _Parent
    on $projection.RefStep = _Parent.Step
{
    key Step,
    SubStep,
//    @Search.defaultSearchElement: true
    StepDescr,
    RefStep,
//    @Search.defaultSearchElement: true
    SubstepDescr,
    /* Associations */
    _Parent,
    _Subject: redirected to composition child ZC_L_SUBJECT
}
