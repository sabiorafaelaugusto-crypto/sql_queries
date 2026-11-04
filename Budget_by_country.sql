SELECT
		channel,
        strftime('%Y-%m', start_date) as month,
        count(*) as total
from campaigns
group by channel, month
order by month desc, total desc;

SELECT 
	channel,
    SUM(budget) as total_budget
FROM campaigns
group by channel
order by total_budget desc;