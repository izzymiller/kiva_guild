#############################################################################################################
# Owner: Izzy Miller
# Created: May 14 2020
# Purpose: Information on Kiva Microloans. For use in the Data Explorers Guild. From: https://www.kiva.org/build/data-snapshots
#############################################################################################################


view: loans {
  sql_table_name: kiva_20.loans ;;
  drill_fields: [loan_id]

###### Primary Keys (A→Z) #########

  dimension: loan_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.LOAN_ID ;;
    #Also foreign_key to loans_lenders
  }

###### Foreign Keys (A→Z) #########


###### Dimensions (A→Z) #########

  dimension: activity_name {
    label: "Activity"
    description: "Category of Activity the loan is requested for"
    type: string
    sql: ${TABLE}.ACTIVITY_NAME ;;
  }

  dimension: borrower_genders {
    view_label: "Borrower"
    label: "Gender"
    description: "Gender of Borrower (binary)"
    type: string
    sql: ${TABLE}.BORROWER_GENDERS ;;
  }

  dimension: borrower_names {
    #Potential project: split out the names!
    view_label: "Borrower"
    label: "Names"
    description: "Name(s) of Borrowers. Some have multiple, most have 1."
    type: string
    sql: ${TABLE}.BORROWER_NAMES ;;
  }

  dimension: has_borrower_picture {
    view_label: "Borrower"
    label: "Has picture?"
    description: "Does the borrower have a displayed picture?"
    type: yesno
    sql: ${TABLE}.BORROWER_PICTURED = true ;;
  }

  dimension: country_code {
    view_label: "Borrower"
    label: "Country Code"
    description: "2 letter country code of Borrower"
    type: string
    sql: ${TABLE}.COUNTRY_CODE ;;
  }

  dimension: country_name {
    view_label: "Borrower"
    label: "Country Name"
    description: "Full country name of borrower"
    type: string
    sql: ${TABLE}.COUNTRY_NAME ;;
  }

  dimension: currency {
    label: "Currency"
    description: "Currency of Loan"
    type: string
    sql: ${TABLE}.CURRENCY ;;
  }

  dimension: currency_exchange_coverage_rate {
    label: "Currency Exchange Coverage Rate"
    description: "For non-USD loans, rate of exchange"
    type: number
    sql: ${TABLE}.CURRENCY_EXCHANGE_COVERAGE_RATE ;;
  }

  dimension: currency_policy {
    label: "Currency Policy"
    description: "For non-USD loans, is Risk Protection enabled?"
    type: string
    sql: ${TABLE}.CURRENCY_POLICY ;;
  }

  dimension: description {
    label: "Description"
    description: "Description of the Loan"
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: description_translated {
    label: "Description (Translated)"
    description: "If loan is not in English, translated description"
    type: string
    sql: ${TABLE}.DESCRIPTION_TRANSLATED ;;
  }

  dimension_group: disburse {
    label: "Disburse"
    description: "Time of loan disbursement (delivery to borrower)"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month,
      month_name,
      day_of_week,
      day_of_week_index
    ]
    sql: ${TABLE}.DISBURSE_TIME ;;
  }

  dimension: distribution_model {
    label: "Distribution Model"
    description: "How will the loan be distributed to the borrower?"
    type: string
    case: {
      when: {
        label: "Direct"
        sql: ${TABLE}.DISTRIBUTION_MODEL = "direct" ;;
      }
      when: {
        label: "Field Partner"
        sql: ${TABLE}.DISTRIBUTION_MODEL = "field_partner" ;;
      }
    }
  }

  dimension: funded_amount {
    label: "Funded Amount"
    description: "Amount of the requested Loan that has been funded so far"
    type: number
    value_format_name: usd
    sql: ${TABLE}.FUNDED_AMOUNT ;;
  }

  dimension: has_image {
    label: "Has Image?"
    description: "Does loan have an image?"
    type: yesno
    sql: ${TABLE}.IMAGE_ID is not NULL ;;
  }

  dimension: lender_term {
    label: "Lender Term of Loan (months)"
    description: "How long is the term of the lender's loan in months?"
    type: number
    sql: ${TABLE}.LENDER_TERM ;;
  }

  dimension: loan_amount {
    label: "Loan Amount"
    description: "Total amount requested"
    type: number
    value_format_name: usd
    sql: ${TABLE}.LOAN_AMOUNT ;;
  }

  dimension: loan_name {
    view_label: "Borrower"
    label: "Name"
    description: "Name of Borrower"
    type: string
    sql: ${TABLE}.LOAN_NAME ;;
  }

  dimension: loan_use {
    label: "Loan Use"
    description: "Intended use of Loan"
    type: string
    sql: ${TABLE}.LOAN_USE ;;
  }

  dimension: num_bulk_entries {
    description: "Not yet sure what this is"
    type: number
    sql: ${TABLE}.NUM_BULK_ENTRIES ;;
  }

  dimension: num_journal_entries {
    description: "Number of Journal Entries by the Borrower"
    type: number
    sql: ${TABLE}.NUM_JOURNAL_ENTRIES ;;
  }

  dimension: num_lenders_total {
    hidden: yes
    ## Covered by lenders > Count
    type: number
    sql: ${TABLE}.NUM_LENDERS_TOTAL ;;
  }

  dimension: original_language {
    description: "Original language of the loan, if not English"
    type: string
    sql: ${TABLE}.ORIGINAL_LANGUAGE ;;
  }

  dimension: is_partner_loan {
    description: "Is field partner involved?"
    type: number
    sql: ${TABLE}.PARTNER_ID is not null ;;
  }

  dimension_group: planned_expiration {
    description: "When is the loan scheduled to expire?"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      week_of_year,
      day_of_week,
      day_of_week_index
    ]
    sql: ${TABLE}.PLANNED_EXPIRATION_TIME ;;
  }

  dimension_group: posted {
    description: "When was the loan first posted?"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      month_num,
      week_of_year,
      day_of_week,
      day_of_week_index,
      time_of_day,
      hour_of_day
    ]
    sql: ${TABLE}.POSTED_TIME ;;
  }

  dimension_group: raised {
    description: "When did the loan raise the full amount?"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      month_num,
      week_of_year,
      day_of_week,
      day_of_week_index,
      time_of_day,
      hour_of_day
    ]
    sql: ${TABLE}.RAISED_TIME ;;
  }

  dimension: repayment_interval {
    description: "How will the loan be repaid?"
    type: string
    case: {
      when: {
        label: "Bullet"
        sql: ${TABLE}.REPAYMENT_INTERVAL = "bullet" ;;
      }
      when: {
        label: "Irregular"
        sql: ${TABLE}.REPAYMENT_INTERVAL = "irregular" ;;
      }
      when: {
        label: "Monthly"
        sql: ${TABLE}.REPAYMENT_INTERVAL = "monthly" ;;
      }
    }
  }

  dimension: category {
    label: "Category"
    description: "Category of loan"
    type: string
    sql: ${TABLE}.SECTOR_NAME ;;
  }

  dimension: status {
    description: "Status of Loan"
    type: string
    case: {
      when: {
        label: "Expired"
        sql: ${TABLE}.STATUS = "expired" ;;
      }
      when: {
        label: "Funded"
        sql: ${TABLE}.STATUS = "funded" ;;
      }
      when: {
        label: "Fundraising"
        sql: ${TABLE}.STATUS = "fundRaising" ;;
      }
      when: {
        label: "Refunded"
        sql: ${TABLE}.STATUS = "refunded" ;;
      }
    }
  }

  dimension: tags {
    label: "Tags List"
    description: "Rolled list of tags, separated by ',' and prefixed by '#'"
    type: string
    sql: ${TABLE}.TAGS ;;
  }

  dimension: town_name {
    view_label: "Borrower"
    description: "Name of town"
    type: string
    sql: ${TABLE}.TOWN_NAME ;;
  }

  dimension: has_video {
    description: "Does loan have a video?"
    type: yesno
    sql: ${TABLE}.VIDEO_ID is not null ;;
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
      category,
      country_name,
      town_name,
      loans_lenders.count
    ]
  }
}
