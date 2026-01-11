{% test minimum_row_counts(model,min_row_counts)%}
select count(*) as cnt

from {{model}}

having count(*) < {{min_row_counts}}

{%endtest%}