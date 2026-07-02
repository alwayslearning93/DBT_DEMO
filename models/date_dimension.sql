WITH CTE AS(

select

TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

{{ day_type ('STARTED_AT')}} AS DAY_TYPE,

{{ get_season ('STARTED_AT')}} AS SEASON_OF_YEAR

from 
{{ source ('demo', 'bike') }}

where STARTED_AT != 'started_at'
)

select 
* 
from cte
