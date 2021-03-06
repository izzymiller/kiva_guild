connection: "lookerdata"

# include all the views
include: "/views/**/*.view"

datagroup: kiva_default_datagroup {
  sql_trigger: SELECT MAX(LOAN_ID) FROM `lookerdata.kiva_20.loans`;;
}

persist_with: kiva_default_datagroup



explore: loans {
  view_label: "Loan"
  description: "Contains all information about microloans and lenders."
  join: loans_lenders {
    #Pass through lookup table.
    fields: []
    type: left_outer
    relationship: one_to_many
    sql_on: ${loans.loan_id} = ${loans_lenders.loan_id} ;;
  }
  join: lenders {
    view_label: "Lender"
    type: full_outer
    relationship: many_to_one
    sql_on: ${lenders.permanent_name} = ${loans_lenders.lender};;
  }
  join: loan_words {
    view_label: "Words (from Description)"
    type: left_outer
    sql_on: ${loans.loan_id} = ${loan_words.loan_id} ;;
    relationship: one_to_many
  }
  join: loan_because_words {
    view_label: "Words (from Loan Reason)"
    type: left_outer
    sql_on: ${lenders.permanent_name} = ${loan_because_words.permanent_name} ;;
    relationship: one_to_many
  }
}
