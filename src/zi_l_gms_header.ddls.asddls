@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - GMS Header'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_L_GMS_HEADER
as select from ztb_l_gms_header
composition [1..*]  of ZI_GMS_USER as _GMSUser
composition [1..*]  of ZI_L_GMS_TLINE as _GMSTline
composition [1..*] of ZI_GMS_DATA as _GMSData
composition [0..*] of ZI_L_GMS_PDF     as _GMSPdf

{
    key magms as Magms,
    htms as Htms,
    hscg as Hscg,
    ptms as Ptms,
    note as Note,
    _GMSUser,
    _GMSTline,
    _GMSData,
    _GMSPdf
}
