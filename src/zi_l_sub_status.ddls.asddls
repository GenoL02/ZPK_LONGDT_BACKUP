@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status search help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_L_SUB_STATUS as select from ztb_l_sub_status
{
    @UI.textArrangement: #TEXT_ONLY
    @ObjectModel.text.element: [ 'Status' ]
    key line_number as LineNumber,
    status as Status
}
