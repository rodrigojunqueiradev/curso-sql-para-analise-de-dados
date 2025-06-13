-- TIPOS ###########################################################################
-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- DATEDIFF


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Soma de datas utilizando INTERVAL
-- Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)

-- dias (não precisa especificar para os dias, pois é padrão):
SELECT current_date + 10

-- semanas:
SELECT current_date + INTERVAL '10 weeks'
SELECT (current_date + INTERVAL '10 weeks')::date

-- meses:
SELECT current_date + INTERVAL '10 months'
SELECT (current_date + INTERVAL '10 months')::date

-- horas:
SELECT current_date + INTERVAL '10 hours'


-- (Exemplo 2) Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa

select 
	DATE_TRUNC('month', visit_page_date)::date AS visit_page_month,
	count(*)
from sales.funnel
group by visit_page_month
order by visit_page_month desc



-- (Exemplo 3) Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual é o dia da semana que mais recebe visitas ao site

-- Exemplo 1 - dia da semana:
select
	current_date,
	CASE
		WHEN EXTRACT('dow' FROM current_date) = 0 THEN 'domingo'
		WHEN EXTRACT('dow' FROM current_date) = 1 THEN 'segunda-feira'
		WHEN EXTRACT('dow' FROM current_date) = 2 THEN 'terça-feira'
		WHEN EXTRACT('dow' FROM current_date) = 3 THEN 'quarta-feira'
		WHEN EXTRACT('dow' FROM current_date) = 4 THEN 'quinta-feira'
		WHEN EXTRACT('dow' FROM current_date) = 5 THEN 'sexta-feira'
		WHEN EXTRACT('dow' FROM current_date) = 6 THEN 'sábado'
		ELSE 'nada'
	END

-- Exemplo 2 - mês
SELECT EXTRACT('month' FROM current_date)

-- Exercício:
select
	current_date,
	EXTRACT('dow' FROM visit_page_date),
	CASE
		WHEN EXTRACT('dow' FROM visit_page_date) = 0 THEN 'domingo'
		WHEN EXTRACT('dow' FROM visit_page_date) = 1 THEN 'segunda-feira'
		WHEN EXTRACT('dow' FROM visit_page_date) = 2 THEN 'terça-feira'
		WHEN EXTRACT('dow' FROM visit_page_date) = 3 THEN 'quarta-feira'
		WHEN EXTRACT('dow' FROM visit_page_date) = 4 THEN 'quinta-feira'
		WHEN EXTRACT('dow' FROM visit_page_date) = 5 THEN 'sexta-feira'
		WHEN EXTRACT('dow' FROM visit_page_date) = 6 THEN 'sábado'
		ELSE 'nada'
	END AS dia_da_semana,
	COUNT(*)
FROM sales.funnel
GROUP BY EXTRACT('dow' FROM visit_page_date)
ORDER BY EXTRACT('dow' FROM visit_page_date)


-- (Exemplo 4) Diferença entre datas com operador de subtração (-) 
-- Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.

-- dias:
SELECT (current_date - '2018-06-01')

-- semanas:
SELECT (current_date - '2018-06-01')/7

-- meses: 
SELECT (current_date - '2018-06-01')/30

-- anos:
SELECT (current_date - '2018-06-01')/365


-- RESUMO --------------------------------------------------------------------------
-- (1) O comando INTERVAL é utilizado para somar datas na unidade desejada. Caso a 
-- unidade não seja informada, o SQL irá entender que a soma foi feita em dias.
-- (2) O comando DATE_TRUNC é utilizado para truncar uma data no início do período
-- (3) O comando EXTRACT é utilizado para extrair unidades de uma data/timestamp
-- (4) O cálculo da diferença entre datas com o operador de subtração (-) retorna  
-- valores em dias. Para calcular a diferença entre datas em outra unidade é necessário
-- fazer uma transformação de unidades (ou criar uma função para isso)
-- (5) Utilize o Guia de comandos para consultar as unidades de data e hora utilizadas 
-- no SQL

