view: loans_lenders {
  derived_table: {
    sql:
    SELECT
    LOAN_ID,
    LENDERS as LENDERS_ARR
    , flattened_lenders AS LENDER
    FROM `lookerdata.kiva_20.loans_lenders` loans_lenders
    LEFT JOIN UNNEST(SPLIT(REPLACE(REPLACE(LENDERS,'[',''),']',''))) as flattened_lenders
    ;;
    sql_trigger_value: SELECT MAX(LOAN_ID) FROM `lookerdata.kiva_20.loans_lenders`  ;;
  }

  dimension: pk {
    type: string
    hidden: yes
    primary_key: yes
    sql: CONCAT(${loan_id}::string,${lender}) ;;
  }


  dimension: lenders_arr {
    label: "Array of Lenders"
    description: "Raw array of the lenders, as stored in the DB. Potentially useful."
    type: string
    sql: ${TABLE}.LENDERS_ARR ;;
  }

  dimension: lender {
    label: "Lender Username"
    description: "The username of the lender. One loan has many lenders."
    type: string
    sql: ${TABLE}.LENDER ;;
  }

  dimension: loan_id {
    hidden: yes
    type: number
    sql: ${TABLE}.LOAN_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      loans.activity_name,
      loans.loan_name,
      loans.sector_name,
      loans.country_name,
      loans.loan_id,
      loans.town_name
    ]
  }
}
