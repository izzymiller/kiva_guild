connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/views/**/*.view"

datagroup: kiva_default_datagroup {
  sql_trigger: SELECT MAX(LOAN_ID) FROM `lookerdata.kiva_20.loans`;;
}

persist_with: kiva_default_datagroup

# needed for turtling
# aggregate_awareness: yes



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
  join: comparitor {
    type: cross
    relationship: one_to_many
  }

#   ### some starter turtles ###
#
#   query: loans_by_disbursed_year {
#     description: "Select fields you want displayed alongside turtled query. Then press 'Turtle' and run!"
#     dimensions: [disburse_year]
#     measures: [count]
#     sort: {field:disburse_year desc:no}
#   }
#
#   query: top_10_loan_count_by_country {
#     description: "Select fields you want displayed alongside turtled query. Then press 'Turtle' and run!"
#     dimensions: [country_name]
#     measures: [count]
#     sort: {field:count desc:yes}
#     limit: 10
#   }
#
#   query: top_5_loan_count_by_category {
#     description: "Select fields you want displayed alongside turtled query. Then press 'Turtle' and run!"
#     dimensions: [category]
#     measures: [count]
#     sort: {field:count desc:yes}
#     limit: 5
#   }
#
#   query: top_5_words_count {
#     description: "Select fields you want displayed alongside turtled query. Then press 'Turtle' and run!"
#     dimensions: [words]
#     measures: [count_occurrences]
#     sort: {field:count_occurrences desc:yes}
#     limit: 5
#    }

}
