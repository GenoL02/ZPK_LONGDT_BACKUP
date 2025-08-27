CLASS zbp_i_l_add_status DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBP_I_L_ADD_STATUS IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

*    DATA: lt_data TYPE STANDARD TABLE OF ztb_l_sub_status,
*          ls_data TYPE ztb_l_sub_status.
"   Thêm  Status
    " Xóa dữ liệu cũ nếu cần reset
*    DELETE FROM ztb_l_sub_status.
*
*    " ======================
*    " STEP01 + SUBSTEPS
*    " ======================
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '1'.
*    ls_data-status     = 'Waiting'.
*    APPEND ls_data TO lt_data.
***
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '2'.
*    ls_data-status     = 'Ready'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '3'.
*    ls_data-status     = 'Accepted'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '4'.
*    ls_data-status     = 'In Process'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '5'.
*    ls_data-status     = 'Error'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '6'.
*    ls_data-status     = 'Executed'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '7'.
*    ls_data-status     = 'Completed'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '8'.
*    ls_data-status     = 'Logically Deleted'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '9'.
*    ls_data-status     = 'In Preparation'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '10'.
*    ls_data-status     = 'Exception Caught'.
*    APPEND ls_data TO lt_data.
*
*    ls_data-mandt        = sy-mandt.
*    ls_data-line_number         = '11'.
*    ls_data-status     = 'Exception Active'.
*    APPEND ls_data TO lt_data.
*    " ======================
*    " Insert vào bảng ZTB_L_STEP
*    " ======================
*    INSERT ztb_l_sub_status FROM TABLE @lt_data.
*    COMMIT WORK.

 " Thêm Priority
 DATA: lt_data TYPE STANDARD TABLE OF ztb_l_sub_pri,
          ls_data TYPE ztb_l_sub_pri.
    DELETE FROM ztb_l_sub_pri.

    " ======================
    " STEP01 + SUBSTEPS
    " ======================
    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '1'.
    ls_data-priority     = 'Highest - Express'.
    APPEND ls_data TO lt_data.
**
    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '2'.
    ls_data-priority     = 'Very high'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '3'.
    ls_data-priority     = 'Higher'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '4'.
    ls_data-priority     = 'High'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '5'.
    ls_data-priority     = 'Medium'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '6'.
    ls_data-priority     = 'Low'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '7'.
    ls_data-priority     = 'Lower'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '8'.
    ls_data-priority     = 'Very low'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-line_number         = '9'.
    ls_data-priority     = 'Lowest'.
    APPEND ls_data TO lt_data.


    " ======================
    " Insert vào bảng ZTB_L_STEP
    " ======================
    INSERT ztb_l_sub_pri FROM TABLE @lt_data.
    COMMIT WORK.
    out->write( |Đã insert { lines( lt_data ) } dòng vào bảng| ).
   ENDMETHOD.
ENDCLASS.
