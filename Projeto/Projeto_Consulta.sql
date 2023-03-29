										--- SCRIPT DAS CONSULTAS
                                        
--- A)
--- Liste os candidatos pelo nome e CPF que obtiveram votos na cidade de "Campina Grande" e que gastaram mais de R$ 5.000,00 na campanha;

select DISTINCT c.nome as "Nome", c.cpf as "CPF"
from candidato c, votacao v, urna u, titulo_de_eleitor te, gasto ga, mandato m
where c.numero_de_inscricao = te.numero_de_inscricao and u.municipio = te.regiao AND c.cod_candidatura = m.cod_candidatura
    and m.cod_mandato = ga.cod_mandato
    and ga.valor_total > 5000


--- B)
--- Liste os candidatos pelo nome e CPF e código do partido, total declarado, total recebido em doação e total gasto em campanha que possuíram mais de 500 votos na eleição de 2018 na cidade de Campina Grande;

--- C)
--- Selecione o total de doação partidária recebido pelos candidatos do partido ‘CDU’.

select f.nome_partido as "Partido", SUM(d.valor_doado) as "Total doado"
from Ficha_de_filiacao as f, candidatura as ctra, Doacao_de_campanha as d, Candidato as c 
where f.nome_partido = 'CDU' and f.num_partido  = ctra.num_partido 
	and ctra.cod_candidatura = d.cod_candidatura and ctra.cpf = c.cpf
GROUP BY f.nome_partido;


--- D)
--- Apresente uma relação dos 3 partidos que receberam maior número de verbas partidárias
   
SELECT f.nome_partido as "Partido", f.num_partido as "Número do partido" , SUM(d.valor_doado) as "Verbas"
FROM Doacao_de_campanha as d, Ficha_de_filiacao as f, Candidatura as ctra
WHERE d.cod_candidatura = ctra.cod_candidatura
	and ctra.num_partido = f.num_partido 
GROUP BY f.nome_partido, f.num_partido ORDER BY SUM(d.valor_doado) DESC
LIMIT 3; 

--- E)
--- Apresente uma lista de todas as cidades e seus respectivos quantitativos de votos nos candidatos do partido ‘CDU’. Ordene pela quantidade de votos válidos.

select f.nome_partido as "Nome do partido", sum(u.votos) as "Votos", u.municipio as "Cidade"
from urna as u, ficha_de_filiacao as f, candidatura as ctra, votacao as v, votacao_possui_urna as vpu, candidato as c
where f.nome_partido = 'CDU' and ctra.num_partido = f.num_partido
	and v.cod_candidatura = ctra.cod_candidatura and v.cod_votacao = vpu.cod_votacao
	and vpu.cod_urna = u.cod_urna AND ctra.cpf = c.cpf
group by f.nome_partido, u.municipio order by sum(u.votos) desc;

   
   

	

