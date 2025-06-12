-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT
	prod.brand,
	COUNT(fun.visit_page_date) AS contagem

FROM sales.funnel AS fun

LEFT JOIN sales.products AS prod
	ON fun.product_id = prod.product_id

GROUP BY prod.brand
ORDER BY contagem DESC


-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT
	st.store_name,
	COUNT(fun.visit_page_date) AS contagem

FROM sales.funnel AS fun

LEFT JOIN sales.stores AS st
	ON fun.store_id = st.store_id

GROUP BY st.store_name
ORDER BY contagem DESC


-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
SELECT
	reg.size,
	COUNT(*) AS contagem
	
FROM sales.customers AS cus

LEFT JOIN temp_tables.regions AS reg
	ON lower(cus.city) = lower(reg.city)
	AND lower(cus.state) = lower(reg.state)

GROUP BY reg.size
ORDER BY contagem DESC
