/* a) Qual(is) CodCarro(s) possui(em) mais sinistros cadastrados? */
/* SELECT s.codCarros, count(*) as qtde_sinistros FROM sinistros s
JOIN carros c
ON s.codCarros = c.CodCarros
GROUP BY s.codCarros
ORDER BY 2 DESC */

/* b) Quantos usuários cadastrados possuem letra “a” no meio e não no
final? */
/* SELECT count(*) as qtde_nomes FROM clientes c
WHERE c.Nome LIKE '%a%' AND 
c.Nome NOT LIKE '%a' */

/* c) Quantos clientes não possuem apólice? */
/* SELECT count(*) as qtde_nulls FROM clientes c
LEFT JOIN apólices a 
ON a.codClientes = c.codClientes
WHERE a.codApólices IS NULL */

/* d) Quais carros não possuem apólice?*/ 
SELECT count(*) as qtde_nulls FROM carros c
WHERE c.codCarros NOT IN (SELECT DISTINCT a.codCarros FROM apólices a) 



