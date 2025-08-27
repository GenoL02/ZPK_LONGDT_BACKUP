@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for GMS Header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.resultSet.sizeCategory: #XS
define root view entity ZC_L_GMS_HEADER provider contract transactional_query
as projection on ZI_L_GMS_HEADER
{
    key Magms,
    @Consumption.valueHelpDefinition: [{ entity: { 
        name: 'ZI_L_HTMS',
        element: 'Htms'
   } }]
//   @ObjectModel.text.element: ['Htms']
    Htms,
    @Consumption.valueHelpDefinition: [{ entity: { 
        name: 'ZI_L_HSCG',
        element: 'Hscg'
   } }]
//   @ObjectModel.text.element: ['Hscg']
    Hscg,
    @Consumption.valueHelpDefinition: [{ entity: { 
        name: 'ZI_L_PTMS',
        element: 'Ptms'
   } }]
//   @ObjectModel.text.element: ['Ptms']
    Ptms,
    Note,
    /* Associations */
    _GMSUser: redirected to composition child ZC_GMS_USER,
    _GMSTline: redirected to composition child ZC_L_GMS_TLINE,
    _GMSData: redirected to composition child ZC_GMS_DATA,
    _GMSPdf: redirected to composition child ZC_L_GMS_PDF
}
