@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - GMS Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_GMS_DATA as select from ztb_gms_exc_data
//association to parent ZI_GMS_USER as _GMSUser on $projection.EndUser = _GMSUser.EndUser
//                                             and $projection.FileId  = _GMSUser.FileId
//                                             and $projection.Magms   = _GMSUser.Magms
association to parent ZI_L_GMS_HEADER  as _GMSHeader on  $projection.Magms = _GMSHeader.Magms

{
    key end_user as EndUser,
    key file_id as FileId,
    key magms as Magms,
    key line_id as LineId,
    key line_no as LineNumber,
    product_name as ProductName,
    product_group as ProductGroup,
    quantity as Quantity,
    unit as Unit,
    @Semantics.amount.currencyCode : 'currency'
    price as Price,
    @Semantics.amount.currencyCode : 'currency'
    total_price as TotalPrice,
    currency as Currency,
//    _GMSUser,
    _GMSHeader
}
