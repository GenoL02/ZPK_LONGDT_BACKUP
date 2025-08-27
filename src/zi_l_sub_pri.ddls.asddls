@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Priority search help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_L_SUB_PRI as select from ztb_l_sub_pri
{
    @UI.textArrangement: #TEXT_ONLY
    @ObjectModel.text.element: [ 'Priority' ]
    key line_number as LineNumber,
    priority as Priority
}
