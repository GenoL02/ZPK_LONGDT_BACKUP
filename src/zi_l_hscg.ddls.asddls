@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HSCG value help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_L_HSCG as select from ztb_l_hscg
{
    @UI.textArrangement: #TEXT_ONLY
    @ObjectModel.text.element: [ 'Hscg' ]
    key id as Id,
    hscg as Hscg
}
