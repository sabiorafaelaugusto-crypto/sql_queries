SELECT
	COUNT (*) as total_enviados,
    SUM(opened) as total_abertos,
    SUM(clicked) as total_clicados,
    ROUND(CAST(SUM(opened) as real) * 100 / count (*), 2) as taxa_abertura_pct,
    ROUND(CAST(SUM(clicked) as real) * 100 / count (*), 2) as taxa_clique_pct
from email_events;
