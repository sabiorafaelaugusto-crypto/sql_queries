SELECT 
	c.name as campaigns,
    c.budget as orcamento_total,
    COUNT(DISTINCT l.lead_id) as total_leads,
    COUNT(DISTINCT s.lead_id) as total_assinaturas,
    
    --CPL = Orçamento ÷ Leads 
    ROUND(
      CAST(c.budget AS REAL) / NULLIF(COUNT(DISTINCT l.lead_id), 0),
      2
    ) AS cpl,
    
    --CAC = Orçamento ÷ Assinaturas
    ROUND(
      CAST(c.budget AS REAL) / NULLIF(COUNT(DISTINCT s.lead_id), 0),
      2
    ) AS cac
    
FROM campaigns c 
LEFT JOIN leads l 
	 on c.campaign_id = l.campaign_id -- (ajuste a chave de ligação se necessário)
LEFT JOIN subscriptions s 
	ON l.lead_id = s.lead_id
    
GROUP BY c.name, c.budget
ORDER BY cac ASC; -- ordenado do melhor (menor) CAC para o maior 
