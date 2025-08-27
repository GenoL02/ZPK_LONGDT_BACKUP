@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Subject'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
@Metadata.allowExtensions:true
@Search.searchable:true
define view entity ZC_L_SUBJECT as projection on ZI_L_SUBJECT
{
    key Step,
    key line_number,
    @Search.defaultSearchElement: true
    Subject,
    @Search.defaultSearchElement: true
    DateFrom,
    @Search.defaultSearchElement: true
    SentOn,
    @Search.defaultSearchElement: true
    @Consumption.valueHelpDefinition: [{ entity: { 
        name: 'ZI_L_SUB_PRI',
        element: 'Priority'
   } }]
    Priority,
    @Search.defaultSearchElement: true
    DueDate,
    @Search.defaultSearchElement: true
    @Consumption.valueHelpDefinition: [{ entity: { 
        name: 'ZI_L_SUB_status',
        element: 'Status'
   } }]
    Status,
    @Search.defaultSearchElement: true
    ForwardBy,
    /* Associations */
    _Task: redirected to parent ZC_L_TASK
}
