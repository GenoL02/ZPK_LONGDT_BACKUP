@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity for GMS Pdf'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_L_GMS_PDF as select from ztb_gms_pdf
  association to parent ZI_L_GMS_HEADER  as _GMSHeader on  $projection.Magms = _GMSHeader.Magms
{
    key end_user as EndUser,
    key file_id as FileId,
    key magms as Magms,
    @Semantics.mimeType: true
    attachment as Attachment,
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
}
