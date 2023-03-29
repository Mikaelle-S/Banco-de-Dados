/*CPF Dos Empregados*/
SELECT e.cpf, e.enome, dp.dnome
    FROM departamentos as dp INNER JOIN empregados as e ON dp.dnumero = e.dnumero 
                     LEFT JOIN trabalha as t ON t.cpf_emp = e.cpf
                     LEFT JOIN projetos as p ON t.pnumero = p.pnumero
    WHERE p.pnumero IS NULL
    ORDER BY e.cpf