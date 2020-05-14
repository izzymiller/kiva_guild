view: lenders {
  sql_table_name: kiva_20.lenders ;;

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.COUNTRY_CODE ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.DISPLAY_NAME ;;
  }

  dimension: invited_by {
    type: string
    sql: ${TABLE}.INVITED_BY ;;
  }

  dimension: loan_because {
    type: string
    sql: ${TABLE}.LOAN_BECAUSE ;;
  }

  dimension: loan_purchase_num {
    type: number
    sql: ${TABLE}.LOAN_PURCHASE_NUM ;;
  }

  dimension: main_pic_id {
    type: number
    sql: ${TABLE}.MAIN_PIC_ID ;;
  }

  dimension: member_since {
    type: number
    sql: ${TABLE}.MEMBER_SINCE ;;
  }

  dimension: num_invited {
    type: number
    sql: ${TABLE}.NUM_INVITED ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.OCCUPATION ;;
  }

  dimension: other_info {
    type: string
    sql: ${TABLE}.OTHER_INFO ;;
  }

  dimension: permanent_name {
    type: string
    sql: ${TABLE}.PERMANENT_NAME ;;
  }

  dimension: personal_url {
    type: string
    sql: ${TABLE}.PERSONAL_URL ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  measure: count {
    type: count
    drill_fields: [permanent_name, display_name]
  }
}
