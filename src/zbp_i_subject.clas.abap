CLASS zbp_i_subject DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBP_I_SUBJECT IMPLEMENTATION.


   METHOD if_oo_adt_classrun~main.

    DATA: lt_data TYPE STANDARD TABLE OF ztb_l_subject,
          ls_data TYPE ztb_l_subject.

    " Xóa dữ liệu cũ nếu cần reset
    DELETE FROM ztb_l_subject.

    " ======================
    " STEP01 + SUBSTEPS
    " ======================
    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP02'.
    ls_data-line_number      = '1'.
    ls_data-subject      = 'Đầu mối xây dựng đầu bài GMS'.
    ls_data-date_from    = '20250408'.
    ls_data-sent_on      = '20250510'.
    ls_data-priority     = 'Medium'.
    ls_data-due_date     = '20250807'.
    ls_data-status       = 'ready'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP02'.
    ls_data-line_number      = '2'.
    ls_data-subject      = 'Đầu mối xây dựng đầu bài GMS'.
    ls_data-date_from    = '20250408'.
    ls_data-sent_on      = '20250510'.
    ls_data-priority     = 'Medium'.
    ls_data-due_date     = '20250807'.
    ls_data-status       = 'ready'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP02'.
    ls_data-line_number      = '3'.
    ls_data-subject      = 'Đầu mối xây dựng đầu bài GMS'.
    ls_data-date_from    = '20250408'.
    ls_data-sent_on      = '20250510'.
    ls_data-priority     = 'Medium'.
    ls_data-due_date     = '20250807'.
    ls_data-status       = 'ready'.
    APPEND ls_data TO lt_data.
**

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP03'.
    ls_data-line_number      = '1'.
    ls_data-subject      = 'Đầu mối xây dựng đầu bài GMS'.
    ls_data-date_from    = '20250408'.
    ls_data-sent_on      = '20250510'.
    ls_data-priority     = 'Medium'.
    ls_data-due_date     = '20250807'.
    ls_data-status       = 'ready'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP05'.
    ls_data-line_number      = '1'.
    ls_data-subject      = 'Đầu mối xây dựng đầu bài GMS'.
    ls_data-date_from    = '20250408'.
    ls_data-sent_on      = '20250510'.
    ls_data-priority     = 'Medium'.
    ls_data-due_date     = '20250807'.
    ls_data-status       = 'ready'.
    APPEND ls_data TO lt_data.
    " ======================
    " Insert vào bảng ZTB_L_STEP
    " ======================
    INSERT ztb_l_subject FROM TABLE @lt_data.
    COMMIT WORK.

    out->write( |Đã insert { lines( lt_data ) } dòng vào bảng ZTB_L_SUBJECT| ).

  ENDMETHOD.
ENDCLASS.
