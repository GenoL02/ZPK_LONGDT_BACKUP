@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for GMS User'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_GMS_USER 
as projection on ZI_GMS_USER
{
    key EndUser,
    key FileId,
    key Magms,
    @Semantics.largeObject:
    {
        mimeType: 'Mimetype',
        fileName: 'Filename',
//        acceptableMimeTypes: [ 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
        contentDispositionPreference: #INLINE
    }
    Attachment,
    Mimetype,
    Filename,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
//    _GMSData: redirected to composition child ZC_GMS_DATA,
    _GMSHeader: redirected to parent ZC_L_GMS_HEADER
}
