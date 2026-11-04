select 
	plan,
    SUM(mrr) as mrr_ativo,
    COUNT(*) as total_assinaturas_ativas
from subscriptions
WHERE canceled_at is null or canceled_at = ''
group by plan
order BY mrr_ativo DESC;
