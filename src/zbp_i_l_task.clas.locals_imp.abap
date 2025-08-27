CLASS lhc_Task DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Task RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Task RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE Task.

    METHODS earlynumbering_cba_Subject FOR NUMBERING
      IMPORTING entities FOR CREATE Task\_Subject.

ENDCLASS.

CLASS lhc_Task IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
  ENDMETHOD.

  METHOD earlynumbering_cba_Subject.
    DATA: lv_count     TYPE i,
          lv_new_lines TYPE i.
    lv_count = 1.

*    DATA(LV_TOTAL_ENTITIES) = LINES( ENTITIES ).
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entities>).
      "get data lines
      READ ENTITIES OF zi_l_task IN LOCAL MODE
      ENTITY Task  BY \_Subject
      ALL FIELDS WITH CORRESPONDING #( <lfs_entities>-%target )
      RESULT DATA(lt_existing_xldata).
      lv_new_lines = lines( lt_existing_xldata ).

      DATA(lv_lines) = lines( <lfs_entities>-%target ).
      WHILE lv_count <= lv_lines.
        TRY.
            APPEND VALUE #(
        %key = <lfs_entities>-%target[ lv_count ]-%key
        %cid = <lfs_entities>-%target[ lv_count ]-%cid
        %is_draft = <lfs_entities>-%target[ lv_count ]-%is_draft
        line_number = lv_new_lines + 1

      ) TO mapped-subject.

            lv_new_lines = lv_new_lines + 1.
          CATCH cx_uuid_error.
            "Do nothing Proceed to other entry
        ENDTRY.
        lv_count = lv_count + 1.
      ENDWHILE.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
