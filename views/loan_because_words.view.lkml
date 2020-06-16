view: loan_because_words {
  derived_table: {
    sql: SELECT PERMANENT_NAME, word, GENERATE_UUID() pk FROM (
SELECT lenders.PERMANENT_NAME permanent_name ,REGEXP_EXTRACT_ALL(LOWER(lenders.LOAN_BECAUSE), r'[a-z][a-z][a-z]+\'?[a-z]?') words,
FROM `lookerdata.kiva_20.lenders` AS lenders
), unnest(words) word
WHERE ((word IS NOT NULL AND LENGTH(word ) <> 0 ))

      GROUP BY 1,2,3 ;;
    datagroup_trigger: kiva_default_datagroup
  }

  dimension: pk {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.pk ;;
  }

  dimension: permanent_name {
    hidden: yes
    type: number
    sql: ${TABLE}.PERMANENT_NAME ;;
  }

  dimension: word {
    description: "Individual word, extracted from description."
    type: string
    sql: ${TABLE}.word ;;
    drill_fields: [detail*]
  }

  dimension: is_stopword {
    description: "Is the word a stopword, like 'me','the', etc.?"
    type: yesno
    sql: ${TABLE}.word IN ('i','me','my','myself','we','our','ours','ourselves','you','your','yours','yourself','yourselves','he','him','his','himself','she','her','hers','herself','it','its','itself','they','them','their','theirs','themselves','what','which','who','whom','this','that','these','those','am','is','are','was','were','be','been','being','have','has','had','having','do','does','did','doing','a','an','the','and','but','if','or','because','as','until','while','of','at','by','for','with','about','against','between','into','through','during','before','after','above','below','to','from','up','down','in','out','on','off','over','under','again','further','then','once','here','there','when','where','why','how','all','any','both','each','few','more','most','other','some','such','no','nor','not','only','own','same','so','than','too','very','s','t','can','will','just','don','should','now') ;;
  }

  measure: count_occurrences {
    description: "Count of all occurrences of words"
    type: count
    drill_fields: [detail*]
  }

  measure: count_unique_words {
    description: "Count of unique words used"
    type: count_distinct
    sql: ${word} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [permanent_name, lender.loan_because, loan.count]
  }
}
