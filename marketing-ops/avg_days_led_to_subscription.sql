SELECT
	c.channel as canal,
    COUNT(DISTINCT l.email) as total_conversoes,
    ROUND(AVG(julianday(s.started_at) - julianday(l.created_at)), 1) as media_dias_ate_assinatura
FROM leads leads
join campaigns c 
	ON l.campaign_id = c.campaign_id
JOIN subscriptions s 
	on l.lead_id = s.lead_id
where l.created_at is not NULL
	AND s.started_at is not NULL
GROUP BY c.channel
ORDER BY media_dias_ate_assinatura asc;
