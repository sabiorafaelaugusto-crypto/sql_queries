SELECT
	c.name as campanha,
    COUNT(DISTINCT l.lead_id) as total_leads,
    count(DISTINCT t.lead_id) as total_trials,
    COUNT(DISTINCT s.lead_id) as total_assinaturas,
    
    -- Taxa de conversão: lead -> Trial (%)
    ROUND(
      CAST(COUNT(DISTINCT t.lead_id) as REAL) * 100.0 / NULLIF(COUNT(DISTINCT l.lead_id), 0),
      2
    ) as taxa_lead_para_trial_pct,
    
    --Taxa de Conversão: Trial -> Assinatura (%)
    ROUND(
      CAST(COUNT(DISTINCT s.lead_id) as REAL) * 100.00 / NULLIF(COUNT(DISTINCT t.lead_id),0),
      2
    ) as taxa_trial_para_assinatura_pct,
    
    --Taxa de Conversão Global: lead -> Assinatura (%)
    ROUND(
      CAST(COUNT(DISTINCT s.lead_id) AS REAL) * 100.0 / NULLIF(COUNT(DISTINCT l.lead_id), 0),
      2
    ) AS taxa_conversao_global_pt
    
FROM campaigns c 
left join leads l 
	on c.campaign_id = l.campaign_id -- ou pelo/canal de ligação da base 
left join trials t 
	on l.lead_id = t.lead_id 
left join subscriptions s 
	on l.lead_id = s.lead_id
    
GROUP BY c.name
ORDER BY total_leads desc;
