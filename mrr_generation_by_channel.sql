SELECT
	c.channel as canal,
    SUM(DISTINCT c.budget) as investimento_total,
    COUNT(DISTINCT s.lead_id) AS total_assinantes,
    ROUND(SUM(s.mrr), 2) as mrr_gerado,
    
    --ROAS / Eficiência de mrr (MRR Gerado ÷ Investimento)
    ROUND(
      CAST(SUM(s.mrr) AS REAL) / NULLIF(SUM(DISTINCT c.budget), 0),
      2
    ) AS mrr_por_real_investido
    
FROM campaigns c 
LEFT JOIN leads l
	on c.campaign_id = l.campaign_id -- (ajuste a chave de ligação se necessário)
LEFT JOIN subscriptions s 
	on l.lead_id = s.lead_id
    and (s.canceled_at is NULL OR s.canceled_at = '') -- Considera apenas o MRR ativo 

GROUP BY c.channel
order by mrr_gerado desc;