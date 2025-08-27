CLASS zcl_l_add_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_L_ADD_DATA IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    DATA: lt_data TYPE STANDARD TABLE OF ztb_l_step,
          ls_data TYPE ztb_l_step.

    " Xóa dữ liệu cũ nếu cần reset
    DELETE FROM ztb_l_step.

    " ======================
    " STEP01 + SUBSTEPS
    " ======================
    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP01'.
    ls_data-sub_step     = ''.
    ls_data-step_descr   = 'Phê duyệt đầu bài chi tiết'.
    ls_data-ref_step     = ''.
    ls_data-substep_descr = ''.
    APPEND ls_data TO lt_data.
**
    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP02'.
    ls_data-sub_step     = 'SSTEP1.1'.
    ls_data-step_descr   = 'Phê duyệt đầu bài chi tiết'.
    ls_data-ref_step     = 'STEP01'.
    ls_data-substep_descr = 'Xây dựng đầu bài chi tiết'.
    APPEND ls_data TO lt_data.
    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP03'.
    ls_data-sub_step     = 'SSTEP1.2'.
    ls_data-step_descr   = 'Phê duyệt đầu bài chi tiết'.
    ls_data-ref_step     = 'STEP01'.
    ls_data-substep_descr = 'Phê duyệt đầu bài chi tiết'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP04'.
    ls_data-sub_step     = ''.
    ls_data-step_descr   = 'Phê duyệt KQ chấm điểm NCC và PA đàm phán'.
    ls_data-ref_step     = ''.
    ls_data-substep_descr = ''.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP05'.
    ls_data-sub_step     = 'SSTEP2.1'.
    ls_data-step_descr   = 'Phê duyệt KQ chấm điểm NCC và PA đàm phán'.
    ls_data-ref_step     = 'STEP04'.
    ls_data-substep_descr = 'Chấm điểm NCC'.
    APPEND ls_data TO lt_data.
**
    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP06'.
    ls_data-sub_step     = 'SSTEP2.2'.
    ls_data-step_descr   = 'Phê duyệt KQ chấm điểm NCC và PA đàm phán'.
    ls_data-ref_step     = 'STEP04'.
    ls_data-substep_descr = 'Phê duyệt KQ chấm điểm NCC và phương án đàm phán'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP07'.
    ls_data-sub_step     = ''.
    ls_data-step_descr   = 'Phê duyệt NCC, giá, các điều kiện, điều khoản'.
    ls_data-ref_step     = ''.
    ls_data-substep_descr = ''.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP08'.
    ls_data-sub_step     = 'SSTEP3.1'.
    ls_data-step_descr   = 'Phê duyệt NCC, giá, các điều kiện, điều khoản'.
    ls_data-ref_step     = 'STEP07'.
    ls_data-substep_descr = 'Trình NCC, giá và điều kiện, điều khoản NCC'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP09'.
    ls_data-sub_step     = 'SSTEP3.2'.
    ls_data-step_descr   = 'Phê duyệt NCC, giá, các điều kiện, điều khoản'.
    ls_data-ref_step     = 'STEP07'.
    ls_data-substep_descr = 'Phê duyệt NCC, giá và điều kiện, điều khoản'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP10'.
    ls_data-sub_step     = ''.
    ls_data-step_descr   = 'Ký hợp đồng'.
    ls_data-ref_step     = ''.
    ls_data-substep_descr = ''.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP11'.
    ls_data-sub_step     = 'SSTEP4.1'.
    ls_data-step_descr   = 'Ký hợp đồng'.
    ls_data-ref_step     = 'STEP10'.
    ls_data-substep_descr = 'Khởi tạo hợp đồng'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP12'.
    ls_data-sub_step     = 'SSTEP4.2'.
    ls_data-step_descr   = 'Ký hợp đồng'.
    ls_data-ref_step     = 'STEP10'.
    ls_data-substep_descr = 'Phê duyệt và ký hợp đồng'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP13'.
    ls_data-sub_step     = ''.
    ls_data-step_descr   = 'Đăng ký nhà cung cấp'.
    ls_data-ref_step     = ''.
    ls_data-substep_descr = ''.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP14'.
    ls_data-sub_step     = 'SSTEP5.1'.
    ls_data-step_descr   = 'Đăng ký nhà cung cấp'.
    ls_data-ref_step     = 'STEP13'.
    ls_data-substep_descr = 'Khởi tạo đăng ký NCC'.
    APPEND ls_data TO lt_data.

    ls_data-mandt        = sy-mandt.
    ls_data-step         = 'STEP15'.
    ls_data-sub_step     = 'SSTEP5.2'.
    ls_data-step_descr   = 'Đăng ký nhà cung cấp'.
    ls_data-ref_step     = 'STEP13'.
    ls_data-substep_descr = 'Phê duyệt đăng ký NCC'.
    APPEND ls_data TO lt_data.


    " ======================
    " Insert vào bảng ZTB_L_STEP
    " ======================
    INSERT ztb_l_step FROM TABLE @lt_data.
    COMMIT WORK.

    out->write( |Đã insert { lines( lt_data ) } dòng vào bảng ZTB_L_STEP| ).

  ENDMETHOD.
ENDCLASS.
