-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
WITH visitas_realizadas AS (

	SELECT
		customer_id,
		COUNT(*) AS n_visitas
	FROM sales.funnel
	GROUP BY customer_id

)

SELECT
	cus.*,
	n_visitas

FROM sales.customers as cus
LEFT JOIN visitas_realizadas as vr
	ON cus.customer_id = vr.customer_id