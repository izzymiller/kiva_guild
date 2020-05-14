view: loans {
  sql_table_name: kiva_20.loans ;;
  drill_fields: [loan_id]

  dimension: loan_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.LOAN_ID ;;
  }

  dimension: activity_name {
    type: string
    sql: ${TABLE}.ACTIVITY_NAME ;;
  }

  dimension: borrower_genders {
    type: string
    sql: ${TABLE}.BORROWER_GENDERS ;;
  }

  dimension: borrower_names {
    type: string
    sql: ${TABLE}.BORROWER_NAMES ;;
  }

  dimension: borrower_pictured {
    type: string
    sql: ${TABLE}.BORROWER_PICTURED ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.COUNTRY_CODE ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.COUNTRY_NAME ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.CURRENCY ;;
  }

  dimension: currency_exchange_coverage_rate {
    type: number
    sql: ${TABLE}.CURRENCY_EXCHANGE_COVERAGE_RATE ;;
  }

  dimension: currency_policy {
    type: string
    sql: ${TABLE}.CURRENCY_POLICY ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: description_translated {
    type: string
    sql: ${TABLE}.DESCRIPTION_TRANSLATED ;;
  }

  dimension_group: disburse {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DISBURSE_TIME ;;
  }

  dimension: distribution_model {
    type: string
    sql: ${TABLE}.DISTRIBUTION_MODEL ;;
  }

  dimension: funded_amount {
    type: number
    sql: ${TABLE}.FUNDED_AMOUNT ;;
  }

  dimension: image_id {
    type: number
    sql: ${TABLE}.IMAGE_ID ;;
  }

  dimension: lender_term {
    type: number
    sql: ${TABLE}.LENDER_TERM ;;
  }

  dimension: loan_amount {
    type: number
    sql: ${TABLE}.LOAN_AMOUNT ;;
  }

  dimension: loan_name {
    type: string
    sql: ${TABLE}.LOAN_NAME ;;
  }

  dimension: loan_use {
    type: string
    sql: ${TABLE}.LOAN_USE ;;
  }

  dimension: num_bulk_entries {
    type: number
    sql: ${TABLE}.NUM_BULK_ENTRIES ;;
  }

  dimension: num_journal_entries {
    type: number
    sql: ${TABLE}.NUM_JOURNAL_ENTRIES ;;
  }

  dimension: num_lenders_total {
    type: number
    sql: ${TABLE}.NUM_LENDERS_TOTAL ;;
  }

  dimension: original_language {
    type: string
    sql: ${TABLE}.ORIGINAL_LANGUAGE ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.PARTNER_ID ;;
  }

  dimension_group: planned_expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.PLANNED_EXPIRATION_TIME ;;
  }

  dimension_group: posted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.POSTED_TIME ;;
  }

  dimension_group: raised {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.RAISED_TIME ;;
  }

  dimension: repayment_interval {
    type: string
    sql: ${TABLE}.REPAYMENT_INTERVAL ;;
  }

  dimension: sector_name {
    type: string
    sql: ${TABLE}.SECTOR_NAME ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.TAGS ;;
  }

  dimension: town_name {
    type: string
    sql: ${TABLE}.TOWN_NAME ;;
  }

  dimension: video_id {
    type: number
    sql: ${TABLE}.VIDEO_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      loan_id,
      activity_name,
      loan_name,
      sector_name,
      country_name,
      town_name,
      loans_lenders.count
    ]
  }
}
