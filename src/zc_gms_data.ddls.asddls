@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for GMS Data'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_GMS_DATA 
as projection on ZI_GMS_DATA
{
    key EndUser,
    key FileId,
    key Magms,
    key LineId,
    key LineNumber,
    ProductName,
    ProductGroup,
    Quantity,
    Unit,
    @Semantics.amount.currencyCode : 'Currency'
    Price,
    @Semantics.amount.currencyCode : 'Currency'
    TotalPrice,
    Currency,
//    _GMSUser: redirected to parent ZC_GMS_USER,
    _GMSHeader: redirected to parent ZC_L_GMS_HEADER
    
}
