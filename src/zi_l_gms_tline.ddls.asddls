@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - TLINE'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_L_GMS_TLINE as select from ztb_rap_tline
association to parent ZI_L_GMS_HEADER as _GMSHeader on $projection.Magms = _GMSHeader.Magms 
{
    key magms as Magms,
    key manhomcv as Manhomcv,
    tennhomcv as Tennhomcv,
    begda as Begda,
    endda as Endda,
    _GMSHeader
}
