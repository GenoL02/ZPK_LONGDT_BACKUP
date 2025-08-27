@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for SubStep'
@ObjectModel.dataCategory: #HIERARCHY
define hierarchy ZI_L_SUBSTEP as parent child hierarchy (
    source ZI_L_TASK
    child to parent association _Parent
    start where RefStep is initial
    siblings order by Step ascending
  )
{
    key Step as Step,
    RefStep as RefStep    
}
