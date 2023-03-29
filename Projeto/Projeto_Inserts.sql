--- INSERINDO OS DADOS NA TABELA DE TITULO_DE_ELEITOR
INSERT INTO TITULO_DE_ELEITOR
(numero_de_inscricao, regiao, zona)
VALUES
(268741, 'Pocinhos', 01),
(175924, NULL, 02),
(374904, 'Campina Grande', 03),
(782905, 'João Pessoa', 07),
(781200, 'Guarabira', 05),
(094837, NULL, 023),
(760391, NULL, 012),
(174320, 'Soledade', 085),
(892736, 'Areia', 028);

--- INSERINDO OS DADOS NA TABELA DE FICHA_DE_FILIACAO
INSERT INTO FICHA_DE_FILIACAO
(cod_filiacao, num_partido, nome_partido)
VALUES
(294138, 087, 'PDT'),
(032054, 014, 'PT'),
(780940, 01, 'PL'),
(030972, 03, 'PMDB'),
(204795, 06, 'PSOL'),
(587496, 05, 'CDU');


--- INSERINDO OS DADOS NA TABELA DE DECLARACAO_DE_BENS
INSERT INTO DECLARACAO_DE_BENS
(cod_declaracao)
VALUES
(3682),
(8194),
(2790),
(0379),
(3719),
(7920),
(9348),
(9372),
(5872),
(7930);

--- INSERINDO OS DADOS NA TABELA DE BEM
INSERT INTO BEM
(id_bem, descricao, valor, tipo, cod_declaracao)
VALUES
(7297, NULL, 8, 'Caneta', 379),
(0374, 'Carro familiar', 95000, 'Carro', 3682),
(0495, NULL, 12000, 'Moto', 2790),
(3862, NULL, 56000, 'Casa', 3719),
(7925, 'Casa familiar', 120000, 'Casa', 5872),
(5216, NULL, 460, 'Bicicleta', 7920),
(4360, 'Telefona familiar', 560, 'Telefone fixo', 7930),
(5964, NULL, 450, NULL, 8194);

--- INSERINDO OS DADOS NA TABELA DE CANDIDATO
INSERT INTO CANDIDATO
(cpf, nome, identidade, comprovante_de_residencia, certificado_de_legalidade, numero_de_inscricao, cod_candidatura)
VALUES
('01259832157', 'Renan', 297585, NULL, NULL, 760391, 298068),
('58921765402', 'Italo', NULL, NULL, NULL, 175924, 298003),
('02798239467', 'Fábio', 282470, NULL, NULL, 892736, 158285),
('59212350921', 'Juliana', 892175, NULL, NULL, 781200, 97160),
('01259872157', 'Mikaele', 291085, NULL, NULL, 374904, 298068),
('14559872100', 'Ramon', 1470085, NULL, NULL, 374904, 258415),
('04020872577', 'Junior', 5819360, NULL, NULL, 374904, 854796),
('14785236931', 'Caio', 505111, NULL, NULL, 781200, 968574),
('00165435744', 'Natalia', 130006, NULL, NULL, 374904, 580691),
('95124876189', 'Maria', 240600, NULL, NULL, 374904, 298067);

--- INSERINDO OS DADOS NA TABELA DE CANDIDATURA
INSERT INTO CANDIDATURA
(cod_candidatura, ano, num_partido, cpf)
VALUES
(298003, 2010, 01,'58921765402'),
(97160, 2018, 03,'59212350921'),
(158285, 2016, 014,'02798239467'),
(298068, 2022, 06,'01259872157'),
(258415, 2010, 01,'14559872100'),
(854796, 2014, 05,'04020872577'),
(968574, 2002, 05,'14785236931'),
(580691, 2004, 05,'00165435744'),
(298067, 2006, 05,'95124876189');

--- INSERINDO OS DADOS NA TABELA DE DOACAO_DE_CAMPANHA
INSERT INTO DOACAO_DE_CAMPANHA
(id_doacao, descricao, valor_doado, data_doacao, hora,cod_candidatura)
VALUES
(3981, NULL, 36.000, NULL, NULL,298003),
(0684, 'Doação para propaganda', 300, NULL, '12:12',97160),
(2418, NULL, 85.00, '12022010', NULL,158285),
(0579, 'Locomoção', 60.000, '20102006', '16:57',298068),
(5972, NULL, 21.00, NULL, NULL,258415),
(0289, NULL, NULL, NULL, NULL,968574),
(8957, 'Transporte', 40.000, '20112022', '22:32',854796),
(7892, 'Doação de um avião', 100.000, '25062006', '08:45',580691),
(5209, 'Divulgação nas ruas', 20.000, NULL, NULL,298067);

--- INSERINDO OS DADOS NA TABELA DE DOADOR
INSERT INTO DOADOR
(cod_doador)
VALUES
(749163),
(792480),
(267409),
(097262),
(549270);

--- INSERINDO OS DADOS NA TABELA DE PESSOA_FISICA
INSERT INTO PESSOA_FISICA
(cod_doador, cpf, nome, endereco, telefone)
VALUES
(749163, '19856702196', 'Gustavo', NULL, '25394821'),
(792480, '48298726513', NULL, NULL, NULL),
(267409, '57436598752', 'Larissa', 'Bairro da Prata, Campina Grande', '58412563'),
(097262, '25418567404', 'Emanuel', 'Bairro do Cruzeiro, Pocinhos', '25039745'),
(549270, '72942801698', 'Fanuel', NULL, '58694125');

--- INSERINDO OS DADOS NA TABELA DE VERBA_PUBLICA
INSERT INTO VERBA_PUBLICA
(cod_doador, descricao, tipo, rubrica)
VALUES
(749163, 'Propaganda eleitoral', 'Fundo partidário', NULL),
(792480, 'Propaganda eleitoral', 'Fundo partidário', 7818),
(267409, 'Propaganda eleitoral', 'Fundo partidário', 7825),
(097262, 'Propaganda eleitoral', 'Fundo partidário', 0287);

--- INSERINDO OS DADOS NA TABELA DE MANDATO
INSERT INTO  MANDATO
(cod_mandato, cod_candidatura)
VALUES
(1, 298003),
(2, 97160),
(3, 158285),
(4, 298068),
(5, 258415),
(6, 854796),
(7, 968574),
(8, 580691),
(9, 298067);


--- INSERINDO OS DADOS NA TABELA DE GASTO
INSERT INTO GASTO
(cod_gasto, descricao, fornecedor, data_gasto, valor_total, valor_liquido, categoria,cod_mandato)
VALUES
(748294, 'Propaganda', 'Verba pública', NULL, NULL, NULL, NULL,1),
(087290, NULL, 'Verba pública', '10022006', 520000, 580000, NULL,2),
(684292, 'Propaganda', 'Verba pública', NULL, 9600000, NULL, 'Campanha',3),
(782902, 'Propaganda', 'Doação privada', '25122018', NULL, 120000, NULL,4),
(524308, 'Outdoors', 'Doação privada', NULL, 20000, 5600000, NULL,9),
(122590, NULL, 'Fundo eleitoral', NULL, 5600, 5600, NULL,5),
(201908, 'Outdoors', 'Fundo eleitoral', NULL, 6900, 6900, NULL,6),
(194030, 'Carreata', 'Fundo eleitoral', NULL, 98000, 98000, NULL,7),
(861377, 'Carreata', 'Doação privada', NULL, 77000, 77000, NULL,8);

--- INSERINDO OS DADOS NA TABELA DE URNA
INSERT INTO URNA 
(cod_urna, votos, estado, regiao, municipio, zona)
VALUES
(01, 123, 'Paraiba', NULL, 'Boa Vista', 06),
(02, 201, 'São Paulo', 'Sudeste', 'São Paulo', 047),
(03, 265,'Alagoas', NULL, NULL, 069),
(04, 167,'Paraiba', 'Nordeste', 'Maceió', 0123),
(05, 197, 'Paraiba',  NULL, 'Pocinhos', 010),
(06, 230, 'São Paulo', 'Sudeste', 'Campinas', 052),
(07, 214, 'Alagoas', 'Nordeste', 'Penedo', 0254),
(08, 306, 'Alagoas', 'Nordeste', 'São Miguel dos Milagres', 0231),
(09, 185, 'Alagoas', 'Nordeste', 'Porto das Pedras', 0201),
(10, 600, 'Paraiba', 'Nordeste', 'Campina Grande', 0221);

--- INSERINDO OS DADOS NA TABELA DE VOTACAO
INSERT INTO VOTACAO
(cod_votacao, resultado, situacao, cod_candidatura)
VALUES
(482798, 'Eleito', 'Apto',298003),
(829429, 'Suplente', 'Inapto',097160),
(048217, 'Não eleito', 'Apto',158285),
(653224, 'Eleito', 'Apto', 854796),
(730125, 'Não eleito', 'Inapto',968574),
(410630, 'Substituto', 'Apto',580691),
(400106, 'Eleito', 'Apto',298067);

--- INSERINDO OS DADOS NA TABELA DE VOTACAO_POSSUI_URNA
INSERT INTO VOTACAO_POSSUI_URNA
(cod_votacao, cod_urna, ano, turno)
VALUES
(48217, 01, 2006, 1),
(482798, 09, 2010, 1),
(829429, 07, 2022, 2),
(653224, 10, 2018, 2),
(730125, 02, 2006, 1),
(410630, 04, 2010, 1),
(400106, 08, 2022, 2);
