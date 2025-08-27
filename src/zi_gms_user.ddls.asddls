@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - GMS User'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_GMS_USER as select from ztb_gms_exc_user

association to parent ZI_L_GMS_HEADER as _GMSHeader on $projection.Magms  = _GMSHeader.Magms
//composition [0..1]  of ZI_GMS_DATA as _GMSData
{
    key end_user as EndUser,
    key file_id as FileId,
    key magms  as Magms,
    attachment as Attachment,
    @Semantics.mimeType: true
    mimetype as Mimetype,
    filename as Filename,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _GMSHeader
//    _GMSData
}
