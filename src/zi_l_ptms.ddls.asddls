@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PTMS value help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_L_PTMS as select from ztb_l_ptms
{
    @UI.textArrangement: #TEXT_ONLY
    @ObjectModel.text.element: [ 'Ptms' ]
    key id as Id,
    ptms as Ptms

}
