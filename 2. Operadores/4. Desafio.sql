-- EXERCÍCIOS ######################################################################

-- (Exercício 1) Calcule quantos salários mínimos ganha cada cliente da tabela 
-- sales.customers. Selecione as colunas de: email, income e a coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1200
SELECT email, income, (income / 1200) AS "salários mínimos"
FROM sales.customers


-- (Exercício 2) Na query anterior acrescente uma coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e FALSE se ganha 4 salários ou menos.
-- Chame a nova coluna de "acima de 4 salários"
SELECT email, 
	income, 
	(income / 1200) AS "salários mínimos", 
	((income / 1200) > 5) AS "acima de 5 salários"
FROM sales.customers


-- (Exercício 3) Na query anterior filtre apenas os clientes que ganham entre
-- 4 e 5 salários mínimos. Utilize o comando BETWEEN
SELECT email, income, 
	(income / 1200) AS "salários mínimos", 
	((income / 1200) > 5) AS "acima de 5 salários"
FROM sales.customers
WHERE (income / 1200) BETWEEN 4 AND 5


-- (Exercício 4) Selecine o email, cidade e estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso. 
SELECT email, city, state
FROM sales.customers
WHERE state IN ('MG', 'MT')

-- (Exercício 5) Selecine o email, cidade e estado dos clientes que não 
-- moram no estado de São Paulo.
SELECT email, city, state
FROM sales.customers
WHERE state NOT IN ('SP')


-- (Exercício 6) Selecine os nomes das cidade que começam com a letra Z.
-- Dados da tabela temp_table.regions
SELECT city
FROM sales.customers
WHERE city ILIKE ('Z%')
