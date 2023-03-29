--- TABELA REFERENTE AO TÍTULO DE ELEITOR
CREATE TABLE IF NOT EXISTS TITULO_DE_ELEITOR (
  numero_de_inscricao		INTEGER			NOT NULL,
  regiao					VARCHAR(50),
  zona						INTEGER,
  PRIMARY KEY (numero_de_inscricao));

--- TABELA REFERENTE A FICHA_DE_FILIACAO
CREATE TABLE IF NOT EXISTS FICHA_DE_FILIACAO(
  cod_filiacao				INTEGER			NOT NULL,
  num_partido				INTEGER		unique NOT NULL,
  nome_partido				VARCHAR(50),
  PRIMARY KEY (cod_filiacao));

--- TABELA REFERENTE A DECLARACAO_DE_BENS
CREATE TABLE IF NOT EXISTS DECLARACAO_DE_BENS (
  cod_declaracao				INTEGER			NOT NULL,
  PRIMARY KEY (cod_declaracao));
  
--- TABELA REFERENTE AOS BENS
CREATE TABLE IF NOT EXISTS BEM (
  id_bem					INTEGER			NOT NULL,
  descricao					VARCHAR(60),
  valor						DOUBLE PRECISION,
  tipo						VARCHAR(15),
  cod_declaracao			INTEGER 		NOT NULL,
  PRIMARY KEY	(id_bem),
  FOREIGN KEY (cod_declaracao) REFERENCES DECLARACAO_DE_BENS(cod_declaracao));
  
 --- TABELA REFERENTE AO CANDIDATO
CREATE TABLE IF NOT EXISTS CANDIDATO (
  cpf						VARCHAR(11)		UNIQUE	NOT NULL,
  nome						VARCHAR(100),
  identidade				INTEGER	,
  comprovante_de_residencia	BYTEA	,
  certificado_de_legalidade	BYTEA	,
  numero_de_inscricao	INTEGER	NOT NULL,
  cod_candidatura	INTEGER	 NOT NULL,
  PRIMARY KEY (cpf),
  FOREIGN KEY (numero_de_inscricao) REFERENCES titulo_de_eleitor (numero_de_inscricao),
  UNIQUE (certificado_de_legalidade));
  
   --- TABELA REFERENTE A CANDIDATURA
CREATE TABLE IF NOT EXISTS CANDIDATURA (
  cod_candidatura			INTEGER					NOT NULL,
  ano						INTEGER,
  num_partido				INTEGER 				NOT NULL,
  cpf 						VARCHAR(11)		UNIQUE	NOT NULL,
  PRIMARY KEY (cod_candidatura), 
  FOREIGN KEY (num_partido) REFERENCES ficha_de_filiacao(num_partido),
  FOREIGN KEY (cpf) REFERENCES Candidato(cpf));
  
  --- TABELA REFERENTE AO MANDATO
CREATE TABLE IF NOT EXISTS MANDATO (
  cod_mandato				INTEGER				NOT NULL,
  cod_candidatura			INTEGER	 			NOT NULL UNIQUE,
  PRIMARY KEY (cod_mandato),
  FOREIGN KEY (cod_candidatura) REFERENCES Candidatura(cod_candidatura));
  
  --- TABELA REFERENTE A DOACAO_DE_CAMPANHA
CREATE TABLE IF NOT EXISTS DOACAO_DE_CAMPANHA (
  id_doacao					INTEGER				NOT NULL,
  descricao					VARCHAR(60)	,				
  valor_doado				DOUBLE PRECISION,
  data_doacao				VARCHAR(8),
  hora						VARCHAR(6),
  cod_candidatura			INTEGER	 			NOT NULL UNIQUE,
  PRIMARY KEY (id_doacao),
  FOREIGN KEY (cod_candidatura) REFERENCES Candidatura(cod_candidatura));

--- TABELA REFERENTE AO DOADOR
CREATE TABLE IF NOT EXISTS DOADOR (
  cod_doador					INTEGER				NOT NULL,
  PRIMARY KEY (cod_doador));

--- TABELA REFERENTE A PESSOA_FISICA
CREATE TABLE IF NOT EXISTS PESSOA_FISICA (
  cod_doador					INTEGER				NOT NULL,
  cpf							VARCHAR(11)		UNIQUE	NOT NULL,
  nome						VARCHAR(100),
  endereco					VARCHAR(100),
  telefone					VARCHAR(13)	,
  PRIMARY KEY (cod_doador, cpf),
  FOREIGN KEY (cod_doador)REFERENCES DOADOR (cod_doador));

--- TABELA REFERENTE A VERBA_PUBLICA
CREATE TABLE IF NOT EXISTS VERBA_PUBLICA (
  cod_doador					INTEGER				NOT NULL,
  descricao					VARCHAR(60),
  tipo						VARCHAR(25),
  rubrica					VARCHAR(25),
  PRIMARY KEY (cod_doador),
  FOREIGN KEY (cod_doador) REFERENCES DOADOR (cod_doador));

--- TABELA REFERENTE AO GASTO
CREATE TABLE IF NOT EXISTS GASTO (
  cod_gasto					INTEGER				NOT NULL,
  descricao					VARCHAR(60),
  fornecedor				VARCHAR(30),
  data_gasto				VARCHAR(8),
  valor_total				DOUBLE PRECISION,
  valor_liquido				DOUBLE PRECISION,
  categoria					VARCHAR(20),
  cod_mandato				INTEGER NOT NULL,
  PRIMARY KEY (cod_gasto),
  FOREIGN KEY (cod_mandato) REFERENCES Mandato(cod_mandato));

--- TABELA REFERENTE A URNA
CREATE TABLE IF NOT EXISTS URNA (
  cod_urna					INTEGER			NOT NULL,
  votos						INTEGER,
  estado					VARCHAR(20), 	
  regiao					VARCHAR(20),
  municipio					VARCHAR(50),
  zona						INTEGER,
  PRIMARY KEY (cod_urna),
  UNIQUE (municipio));

--- TABELA REFERENTE A VOTACAO
CREATE TABLE IF NOT EXISTS VOTACAO (
  cod_votacao				INTEGER			NOT NULL,
  resultado					VARCHAR(15)		NOT NULL,
  situacao					VARCHAR(15)		NOT NULL,
  cod_candidatura 			INTEGER 		NOT NULL UNIQUE,
  PRIMARY KEY (cod_votacao),
  FOREIGN KEY (cod_candidatura) REFERENCES Candidatura(cod_candidatura));

--- TABELA REFERENTE A VOTACAO_POSSUI_URNA
CREATE TABLE IF NOT EXISTS VOTACAO_POSSUI_URNA (
  cod_votacao				INTEGER			NOT NULL,
  cod_urna					INTEGER			NOT NULL,
  ano						INTEGER,
  turno						INTEGER,
  PRIMARY KEY (cod_votacao, cod_urna),
  FOREIGN KEY (cod_votacao) REFERENCES VOTACAO (cod_votacao),
  FOREIGN KEY (cod_urna) REFERENCES URNA (cod_urna));