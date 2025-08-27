@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Tline'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_L_GMS_TLINE as projection on ZI_L_GMS_TLINE
{
    key Magms,
    key Manhomcv,
    Tennhomcv,
    Begda,
    Endda,
    /* Associations */
    _GMSHeader: redirected to parent ZC_L_GMS_HEADER
}
