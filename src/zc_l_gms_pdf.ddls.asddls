@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for GMS Pdf Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_L_GMS_PDF as projection on ZI_L_GMS_PDF
{
    key EndUser,
    key FileId,
    key Magms,
      @Semantics.largeObject: {
      mimeType: 'Mimetype',
      fileName: 'Filename',
//      acceptableMimeTypes: [ 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
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
    _GMSHeader: redirected to parent ZC_L_GMS_HEADER
    
    
}
