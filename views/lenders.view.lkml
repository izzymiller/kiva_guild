#############################################################################################################
# Owner: Izzy Miller
# Created: May 14 2020
# Purpose: Information on lenders of Kiva Microloans. For use in the Data Explorers Guild. From: https://www.kiva.org/build/data-snapshots
#############################################################################################################


view: lenders {
  sql_table_name: kiva_20.lenders ;;

###### Primary Keys (A→Z) #########

  dimension: permanent_name {
    # Also a foreign key to loans_lenders
    type: string
    primary_key: yes
    sql: ${TABLE}.PERMANENT_NAME ;;
  }

###### Foreign Keys (A→Z) #########


###### Dimensions (A→Z) #########

  dimension: city {
    label: "City"
    description: "City of Lender"
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: country_code {
    label: "Country Code"
    description: "2 letter Country Code"
    type: string
    sql: ${TABLE}.COUNTRY_CODE ;;
  }

  dimension: display_name {
    label: "Display name"
    description: "Often blank, optional"
    type: string
    sql: ${TABLE}.DISPLAY_NAME ;;
  }

  dimension: invited_by {
    label: "Invited By"
    description: "If user was invited, permanent name of their inviter"
    type: string
    sql: ${TABLE}.INVITED_BY ;;
  }

  dimension: loan_because {
    label: "Reason for Loaning"
    description: "Long-text field explaining a user's reasons for loaning."
    type: string
    sql: ${TABLE}.LOAN_BECAUSE ;;
  }

  dimension: loan_purchase_num {
    description: "Not yet sure what this does!"
    type: number
    sql: ${TABLE}.LOAN_PURCHASE_NUM ;;
  }

  dimension: main_pic_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MAIN_PIC_ID ;;
  }

  dimension_group: member_since {
    label: "Registered at"
    description: "Timestamp of registration"
    type: time
    datatype: epoch
    timeframes: [
      date,
      year,
      month,
      month_name,
      day_of_week,
      day_of_week_index,
      time,
      time_of_day]
    sql: ${TABLE}.MEMBER_SINCE ;;
  }

  dimension: num_invited_tiers {
    label: "Invited User Tiers"
    description: "How many users has this user invited?"
    type: tier
    tiers: [0,10,20,30,40,50,100]
    sql: ${TABLE}.NUM_INVITED ;;
  }

  dimension: occupation {
    label: "Occupation"
    description: "Occupation of user"
    type: string
    sql: ${TABLE}.OCCUPATION ;;
  }

  dimension: other_info {
    description: "Miscellaneous other info, free-text"
    type: string
    sql: ${TABLE}.OTHER_INFO ;;
  }

  dimension: personal_url {
    description: "Personal website URL. Often LinkedIn or portfolio sites."
    type: string
    sql: ${TABLE}.PERSONAL_URL ;;
    link: {
      label: "Visit Site"
      url: "{{ value }}"
    }
  }

  dimension: state {
    label: "State— Not clean"
    description: "Very unclean state field"
    type: string
    sql: ${TABLE}.STATE ;;
  }

###### Measures (A→Z) #########

  measure: count {
    label: "Count Lenders"
    type: count
    drill_fields: [permanent_name, display_name]
  }

  measure: num_invited {
    label: "Users Invited"
    type: sum
    sql: ${TABLE}.NUM_INVITED ;;
  }

###### Sets (A→Z) #########






}
