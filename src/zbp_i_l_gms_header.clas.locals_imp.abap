CLASS lhc_GMSHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR GMSHeader RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR GMSHeader RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE GMSHeader.

    METHODS earlynumbering_cba_Gmsdata FOR NUMBERING
      IMPORTING entities FOR CREATE GMSHeader\_Gmsdata.

    METHODS earlynumbering_cba_Gmspdf FOR NUMBERING
      IMPORTING entities FOR CREATE GMSHeader\_Gmspdf.

    METHODS earlynumbering_cba_Gmsuser FOR NUMBERING
      IMPORTING entities FOR CREATE GMSHeader\_Gmsuser.

    METHODS uploadExcelData FOR MODIFY
      IMPORTING keys FOR ACTION GMSHeader~uploadExcelData.

ENDCLASS.

CLASS lhc_GMSHeader IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA: LV_TODAY    TYPE SY-DATUM,
          LV_DATE_STR TYPE STRING,
          LV_PREFIX   TYPE STRING,
          LV_COUNT    TYPE I,
          LV_COUNT1   TYPE I,
          LV_COUNT2   TYPE I,
          LV_NEXT_ID  TYPE STRING,
          LV_INDEX    TYPE STRING.
    DATA(LV_USER) = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( ).
    LV_TODAY = SY-DATUM.
    LV_DATE_STR = |{ LV_TODAY DATE = ISO }|. "VD: 20250407
    REPLACE ALL OCCURRENCES OF '-' IN LV_DATE_STR WITH ''.
    LV_PREFIX = |GMS.{ LV_DATE_STR }.|.

    "Đếm số bản ghi đã tạo hôm nay để sinh index tăng dần
    SELECT COUNT(*)
      FROM ZTB_L_GMS_HEADER
      INTO @LV_COUNT1.
    SELECT COUNT(*)
      FROM ZTB_GMS_HEAD_DR
      INTO @LV_COUNT2.
    LV_COUNT =  LV_COUNT1 + LV_COUNT2.
    LOOP AT ENTITIES ASSIGNING FIELD-SYMBOL(<LFS_ENTITIES>).
      APPEND CORRESPONDING #( <LFS_ENTITIES> ) TO MAPPED-GMSHEADER
        ASSIGNING FIELD-SYMBOL(<LFS_GMSHEADER>).

      IF <LFS_GMSHEADER>-MAGMS IS INITIAL.
        lv_count = lv_count + 1.
        LV_INDEX = |{ LV_COUNT }|.
        LV_NEXT_ID = LV_PREFIX && LV_INDEX.
        <LFS_GMSHEADER>-MAGMS = LV_NEXT_ID.
      ENDIF.
     ENDLOOP.
  ENDMETHOD.

  METHOD earlynumbering_cba_Gmsdata.
    DATA: LV_COUNT     TYPE I,
          LV_NEW_LINES TYPE I.
    LV_COUNT = 1.

*    DATA(LV_TOTAL_ENTITIES) = LINES( ENTITIES ).
    LOOP AT ENTITIES ASSIGNING FIELD-SYMBOL(<LFS_ENTITIES>).
      "get data lines
      READ ENTITIES OF ZI_L_GMS_HEADER IN LOCAL MODE
      ENTITY GMSHEADER BY \_GMSDATA
      ALL FIELDS WITH CORRESPONDING #( <LFS_ENTITIES>-%TARGET )
      RESULT DATA(LT_EXISTING_XLDATA).
      LV_NEW_LINES = LINES( LT_EXISTING_XLDATA ).

      DATA(LV_LINES) = LINES( <LFS_ENTITIES>-%TARGET ).
      IF <LFS_ENTITIES>-%TARGET[ 1 ]-ENDUSER IS INITIAL AND <LFS_ENTITIES>-%TARGET[ 1 ]-FILEID IS INITIAL.
        TRY.
            APPEND VALUE #(
        %KEY = <LFS_ENTITIES>-%TARGET[ 1 ]-%KEY
        %CID = <LFS_ENTITIES>-%TARGET[ 1 ]-%CID
        %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ 1 ]-%IS_DRAFT
        ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
        FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
        LINEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
        LINENUMBER = LV_NEW_LINES + 1
      ) TO MAPPED-GMSDATA.
          CATCH CX_UUID_ERROR.
            "Do nothing Proceed to other entry
        ENDTRY.
      ELSE.
        IF LV_LINES = 1.
          TRY.
              APPEND VALUE #(
          %KEY = <LFS_ENTITIES>-%TARGET[ 1 ]-%KEY
          %CID = <LFS_ENTITIES>-%TARGET[ 1 ]-%CID
          %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ 1 ]-%IS_DRAFT
*          ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
*          FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
*          LINEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
        ) TO MAPPED-GMSDATA.
            CATCH CX_UUID_ERROR.
              "Do nothing Proceed to other entry
          ENDTRY.
        ELSE.
          WHILE LV_COUNT <= LV_LINES.
            TRY.
                APPEND VALUE #(
            %KEY = <LFS_ENTITIES>-%TARGET[ LV_COUNT ]-%KEY
            %CID = <LFS_ENTITIES>-%TARGET[ LV_COUNT ]-%CID
            %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ LV_COUNT ]-%IS_DRAFT
*            ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
*            FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
*            LINEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
          ) TO MAPPED-GMSDATA.
              CATCH CX_UUID_ERROR.
                "Do nothing Proceed to other entry
            ENDTRY.
            LV_COUNT = LV_COUNT + 1.
          ENDWHILE.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD earlynumbering_cba_Gmspdf.
    LOOP AT ENTITIES ASSIGNING FIELD-SYMBOL(<LFS_ENTITIES>).

      IF <LFS_ENTITIES>-%TARGET[ 1 ]-ENDUSER IS INITIAL.
        TRY.
            APPEND VALUE #(
        %KEY = <LFS_ENTITIES>-%TARGET[ 1 ]-%KEY
        %CID = <LFS_ENTITIES>-%TARGET[ 1 ]-%CID
        %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ 1 ]-%IS_DRAFT
        ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
        FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
      ) TO MAPPED-GMSPDF.
          CATCH CX_UUID_ERROR.
            "Do nothing Proceed to other entry
        ENDTRY.
      ELSE.
        TRY.
            APPEND VALUE #(
        %KEY = <LFS_ENTITIES>-%TARGET[ 1 ]-%KEY
        %CID = <LFS_ENTITIES>-%TARGET[ 1 ]-%CID
        %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ 1 ]-%IS_DRAFT
        ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
        FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
      ) TO MAPPED-GMSPDF.
          CATCH CX_UUID_ERROR.
            "Do nothing Proceed to other entry
        ENDTRY.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
*
  METHOD earlynumbering_cba_Gmsuser.
    LOOP AT ENTITIES ASSIGNING FIELD-SYMBOL(<LFS_ENTITIES>).

      IF <LFS_ENTITIES>-%TARGET[ 1 ]-ENDUSER IS INITIAL.
        TRY.
            APPEND VALUE #(
        %KEY = <LFS_ENTITIES>-%TARGET[ 1 ]-%KEY
        %CID = <LFS_ENTITIES>-%TARGET[ 1 ]-%CID
        %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ 1 ]-%IS_DRAFT
        ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
        FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
      ) TO MAPPED-GMSUSER.
          CATCH CX_UUID_ERROR.
            "Do nothing Proceed to other entry
        ENDTRY.
      ELSE.
        TRY.
            APPEND VALUE #(
        %KEY = <LFS_ENTITIES>-%TARGET[ 1 ]-%KEY
        %CID = <LFS_ENTITIES>-%TARGET[ 1 ]-%CID
        %IS_DRAFT = <LFS_ENTITIES>-%TARGET[ 1 ]-%IS_DRAFT
        ENDUSER = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( )
        FILEID  = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( )
      ) TO MAPPED-GMSUSER.
          CATCH CX_UUID_ERROR.
            "Do nothing Proceed to other entry
        ENDTRY.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD uploadExcelData.
    DATA: LT_ROWS         TYPE STANDARD TABLE OF STRING,
          LV_CONTENT      TYPE STRING,
          LO_TABLE_DESCR  TYPE REF TO CL_ABAP_TABLEDESCR,
          LO_STRUCT_DESCR TYPE REF TO CL_ABAP_STRUCTDESCR,
          LT_EXCEL        TYPE STANDARD TABLE OF ZBP_I_L_GMS_HEADER=>GTY_PR_XL,
          LT_DATA         TYPE TABLE FOR CREATE ZI_L_GMS_HEADER\_GMSDATA,
          LV_INDEX        TYPE SY-INDEX.

    FIELD-SYMBOLS: <LFS_COL_HEADER> TYPE STRING.

    DATA(LV_USER) = CL_ABAP_CONTEXT_INFO=>GET_USER_TECHNICAL_NAME( ).

    READ ENTITIES OF ZI_L_GMS_HEADER IN LOCAL MODE
    ENTITY GMSHEADER BY \_GMSUSER
    ALL FIELDS WITH CORRESPONDING #( KEYS )
    RESULT DATA(LT_FILE_ENTITY).

    DATA(LV_ATTACHMENT) = LT_FILE_ENTITY[ 1 ]-ATTACHMENT.
    CHECK LV_ATTACHMENT IS NOT INITIAL.

    "Move Excel Data to Internal Table
    DATA(LO_XLSX) = XCO_CP_XLSX=>DOCUMENT->FOR_FILE_CONTENT(
      IV_FILE_CONTENT = LV_ATTACHMENT )->READ_ACCESS( ).
    DATA(LO_WORKSHEET) = LO_XLSX->GET_WORKBOOK( )->WORKSHEET->AT_POSITION( 1 ).
    DATA(LO_SELECTION_PATTERN) = XCO_CP_XLSX_SELECTION=>PATTERN_BUILDER->SIMPLE_FROM_TO( )->GET_PATTERN( ).
    DATA(LO_EXECUTE) = LO_WORKSHEET->SELECT(
      LO_SELECTION_PATTERN )->ROW_STREAM( )->OPERATION->WRITE_TO(
        REF #( LT_EXCEL ) ).
    LO_EXECUTE->SET_VALUE_TRANSFORMATION(
      XCO_CP_XLSX_READ_ACCESS=>VALUE_TRANSFORMATION->STRING_VALUE )->IF_XCO_XLSX_RA_OPERATION~EXECUTE( ).

    " Get number of columns in upload file for validation
    TRY.
        LO_TABLE_DESCR ?= CL_ABAP_TABLEDESCR=>DESCRIBE_BY_DATA( P_DATA = LT_EXCEL ).
        LO_STRUCT_DESCR ?= LO_TABLE_DESCR->GET_TABLE_LINE_TYPE( ).
        DATA(LV_NO_OF_COLS) = LINES( LO_STRUCT_DESCR->COMPONENTS ).
      CATCH CX_SY_MOVE_CAST_ERROR.
        "Implement error handling
    ENDTRY.

    "Validate Header record
    DATA(LS_EXCEL) = VALUE #( LT_EXCEL[ 1 ] OPTIONAL ).
    IF LS_EXCEL IS NOT INITIAL.
      DO LV_NO_OF_COLS TIMES.
        LV_INDEX = SY-INDEX.
        ASSIGN COMPONENT LV_INDEX OF STRUCTURE LS_EXCEL TO <LFS_COL_HEADER>.
        CHECK <LFS_COL_HEADER> IS ASSIGNED.
        DATA(LV_VALUE) = TO_UPPER( <LFS_COL_HEADER> ).
        DATA(LV_HAS_ERROR) = ABAP_FALSE.

        CASE LV_INDEX.
          WHEN 1.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'TÊN HÀNG HÓA' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 2.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'NHÓM HÀNG HÓA' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 3.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'SỐ LƯỢNG' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 4.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'ĐƠN VỊ TÍNH' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 5.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'GIÁ(VND)' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 6.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'THÀNH TIỀN' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 7.
            LV_HAS_ERROR = COND #( WHEN LV_VALUE <> 'ĐƠN VỊ TIỀN' THEN ABAP_TRUE ELSE LV_HAS_ERROR ).
          WHEN 10. "More than 8 columns (error)
            LV_HAS_ERROR = ABAP_TRUE.
        ENDCASE.

        IF LV_HAS_ERROR = ABAP_TRUE.
          APPEND VALUE #( %TKY = LT_FILE_ENTITY[ 1 ]-%TKY ) TO FAILED-GMSUSER.
          APPEND VALUE #(
            %TKY = LT_FILE_ENTITY[ 1 ]-%TKY
            %MSG = NEW_MESSAGE_WITH_TEXT(
            SEVERITY = IF_ABAP_BEHV_MESSAGE=>SEVERITY-ERROR
            TEXT     = 'Wrong File Format!!'
            )
          ) TO REPORTED-GMSUSER.

          UNASSIGN <LFS_COL_HEADER>.
          EXIT.
        ENDIF.

        UNASSIGN <LFS_COL_HEADER>.
      ENDDO.
    ENDIF.

    CHECK LV_HAS_ERROR = ABAP_FALSE.

    DELETE LT_EXCEL INDEX 1.
    DELETE LT_EXCEL WHERE PRODUCT_NAME IS INITIAL.



    LOOP AT LT_EXCEL ASSIGNING FIELD-SYMBOL(<LFS_EXCEL>).
      "Fill Line ID / Line Number
      TRY.
          DATA(LV_LINE_ID) = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( ).
        CATCH CX_UUID_ERROR.
      ENDTRY.
      <LFS_EXCEL>-LINE_ID = LV_LINE_ID.
      <LFS_EXCEL>-LINE_NUMBER = SY-TABIX.
    ENDLOOP.

    "Prepare Data for Child Entity (XLData)
    LT_DATA = VALUE #(
      ( %CID_REF  = KEYS[ 1 ]-%CID_REF
        %IS_DRAFT = KEYS[ 1 ]-%IS_DRAFT
        MAGMS     = KEYS[ 1 ]-MAGMS
        %TARGET   = VALUE #(
                         FOR LWA_EXCEL IN LT_EXCEL (
            "%cid = { lwa_excel-po_number }_{ lwa_excel-po_item }_{ lwa_excel-site_id }
                         %CID      = KEYS[ 1 ]-%CID_REF
                         %IS_DRAFT = KEYS[ 1 ]-%IS_DRAFT
                         %DATA     = VALUE #(
                                             ENDUSER      = LV_USER
                                             FILEID       = LT_FILE_ENTITY[ 1 ]-FILEID
                                             MAGMS        = KEYS[ 1 ]-MAGMS
                                             LINEID       = LWA_EXCEL-LINE_ID
                                             LINENUMBER   = LWA_EXCEL-LINE_NUMBER
                                             CURRENCY     = LWA_EXCEL-CURRENCY
                                             PRICE        = LWA_EXCEL-PRICE
                                             PRODUCTGROUP = LWA_EXCEL-PRODUCT_GROUP
                                             UNIT         = LWA_EXCEL-UNIT
                                             PRODUCTNAME  = LWA_EXCEL-PRODUCT_NAME
                                             QUANTITY     = LWA_EXCEL-QUANTITY
                                             TOTALPRICE   = LWA_EXCEL-TOTAL_PRICE
                                          )

                         %CONTROL  = VALUE #(
                                             ENDUSER      = IF_ABAP_BEHV=>MK-ON
                                             FILEID       = IF_ABAP_BEHV=>MK-ON
                                             MAGMS        = IF_ABAP_BEHV=>MK-ON
                                             LINEID       = IF_ABAP_BEHV=>MK-ON
                                             LINENUMBER   = IF_ABAP_BEHV=>MK-ON
                                             CURRENCY     = IF_ABAP_BEHV=>MK-ON
                                             PRICE        = IF_ABAP_BEHV=>MK-ON
                                             PRODUCTGROUP = IF_ABAP_BEHV=>MK-ON
                                             UNIT         = IF_ABAP_BEHV=>MK-ON
                                             PRODUCTNAME  = IF_ABAP_BEHV=>MK-ON
                                             QUANTITY     = IF_ABAP_BEHV=>MK-ON
                                             TOTALPRICE   = IF_ABAP_BEHV=>MK-ON
                                             )
                         )
                         )
      )
                     )

.

    "Delete Existing entry for user if any
    READ ENTITIES OF ZI_L_GMS_HEADER IN LOCAL MODE
    ENTITY GMSHEADER BY \_GMSDATA
    ALL FIELDS WITH CORRESPONDING #( KEYS )
    RESULT DATA(LT_EXISTING_XLDATA).

    IF LT_EXISTING_XLDATA IS NOT INITIAL.
      MODIFY ENTITIES OF ZI_L_GMS_HEADER IN LOCAL MODE
      ENTITY GMSDATA DELETE FROM VALUE #(
        FOR LWA_DATA IN LT_EXISTING_XLDATA (
        %KEY      = LWA_DATA-%KEY
        %IS_DRAFT = LWA_DATA-%IS_DRAFT
        )
      )
      MAPPED DATA(LT_DEL_MAPPED)
      REPORTED DATA(LT_DEL_REPORTED)
      FAILED DATA(LT_DEL_FAILED).
    ENDIF.

    "Add New Entry for XLData (association)
    MODIFY ENTITIES OF ZI_L_GMS_HEADER IN LOCAL MODE
    ENTITY GMSHEADER CREATE BY \_GMSDATA
    AUTO FILL CID WITH LT_DATA.

    "Read Updated Entry
    READ ENTITIES OF ZI_L_GMS_HEADER IN LOCAL MODE
    ENTITY GMSHEADER ALL FIELDS WITH CORRESPONDING #( KEYS )
    RESULT DATA(LT_UPDATED_XLHEAD).
  ENDMETHOD.


ENDCLASS.
