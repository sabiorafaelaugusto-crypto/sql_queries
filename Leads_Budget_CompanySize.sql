select country, COUNT(*) AS total_leads
FROM leads
group BY country
order by total_leads DESC;

SELECT * from campaigns
WHERE budget > 10000
order by budget desc;

SELECT count(*) as total_leads_incompletos
from leads
where country is NULL OR country = ''
	OR company_size is NULL OR company_size = '';