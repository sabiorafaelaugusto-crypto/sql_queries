select 
	l.lead_id,
    l.email,
    t.started_at as data_inicio_trial
FROM trials t 
JOIN leads l 
	ON t.lead_id = l.lead_id
WHERE NOT EXISTS (
  SELECT 1
  FROM subscriptions s 
  WHERE s.lead_id = t.lead_id
)
ORDER BY t.started_at DESC;

SELECT 
    l.lead_id,
    l.email,
    t.started_at AS data_inicio_trial
FROM trials t
JOIN leads l 
    ON t.lead_id = l.lead_id
LEFT JOIN Subscriptions s 
    ON t.lead_id = s.lead_id
WHERE s.lead_id IS NULL
ORDER BY t.started_at DESC;
