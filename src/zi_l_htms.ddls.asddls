@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HTMS value help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_L_HTMS as select from ztb_l_htms
{
    @UI.textArrangement: #TEXT_ONLY
    @ObjectModel.text.element: [ 'Htms' ]
    key id as Id,
    htms as Htms
}
