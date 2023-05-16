-- criação das entidades 

CREATE TABLE departamento (
  dnum INT AUTO_INCREMENT PRIMARY KEY,
  dnome CHAR(50) NOT NULL,
  gerentenss INT,
  iniciogerente DATE,
  dlocalizacao CHAR(50) NOT NULL
);

CREATE TABLE empregado (
  nss INT AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  endereco CHAR(100),
  datanasc DATE NOT NULL,
  supernss INT NOT NULL,
  dnum INT NOT NULL,
  salario FLOAT NOT NULL,
  FOREIGN KEY (dnum) REFERENCES departamento(dnum)
);

CREATE TABLE projeto (
  projnum INT AUTO_INCREMENT PRIMARY KEY,
  projnome CHAR(50) NOT NULL,
  plocal CHAR(100) NOT NULL,
  dnum INT NOT NULL,
  FOREIGN KEY (dnum) REFERENCES departamento(dnum)
);

CREATE TABLE trabalha (
  enss INT NOT NULL,
  projnum INT NOT NULL,
  horas FLOAT(5,1),
  PRIMARY KEY (enss, projnum),
  FOREIGN KEY (enss) REFERENCES empregado(nss),
  FOREIGN KEY (projnum) REFERENCES projeto(projnum)
);

CREATE TABLE dependente (
  enss INT,
  nomedep CHAR(50) NOT NULL,
  sexodep ENUM('M', 'F') NOT NULL,
  datanascdep DATE,
  parentesco CHAR(50),
  PRIMARY KEY (enss, nomedep),
  FOREIGN KEY (enss) REFERENCES empregado(nss)
);

-- povoamento das entidades criadas

INSERT INTO departamento (dnum, dnome, gerentenss, iniciogerente, dlocalizacao) VALUES 
(10, 'Vendas', 301, '2019-01-01', 'Rio Verde'),
(20, 'Marketing', 302, '2019-02-01', 'Goiânia'),
(30, 'Financeiro', 303, '2019-03-01', 'Goiânia'),
(40, 'Produção', 304, '2019-04-01', 'Trindade'),
(50, 'Recursos Humanos', 305, '2019-05-01', 'Goiânia');

-- Inserindo empregados
INSERT INTO empregado (nss, nome, sexo, endereco, datanasc, supernss, dnum, salario) VALUES 
(301, 'João Silva', 'M', 'Rua A, 123', '1980-01-01', 301, 10, 5000.00),
(302, 'Maria Santos', 'F', 'Rua B, 456', '1985-05-10', 301, 20, 6000.00),
(303, 'José Alves', 'M', 'Rua C, 789', '1990-12-30', 301, 30, 4500.00),
(304, 'Ana Oliveira', 'F', 'Rua D, 321', '1995-06-15', 302, 40, 5500.00),
(305, 'Paulo Souza', 'M', 'Rua E, 654', '1988-08-20', 302, 50, 7000.00),
(306, 'Carla Silva', 'F', 'Rua F, 987', '1992-03-05', 301, 10, 10000.00),
(307, 'Pedro Alves', 'M', 'Rua G, 654', '1991-07-25', 301, 20, 8000.00),
(308, 'Fernanda Oliveira', 'F', 'Rua H, 321', '1993-11-17', 302, 30, 7500.00),
(309, 'Márcio Souza', 'M', 'Rua I, 123', '1987-02-22', 305, 40, 9000.00),
(310, 'Lúcia Santos', 'F', 'Rua J, 456', '1990-09-07', 305, 50, 8500.00);

INSERT INTO empregado (nss, nome, sexo, endereco, datanasc, supernss, dnum, salario) VALUES
(311, 'Maria Silva', 'f', 'Rua das Flores, 123', '1990-05-12', 101, 10, 3000.00),
(312, 'João Santos', 'm', 'Av. Brasil, 567', '1992-01-01', 102, 10, 2500.00),
(313, 'Ana Rodrigues', 'f', 'Rua do Sol, 456', '1995-08-22', 103, 20, 2800.00),
(314, 'José Oliveira', 'm', 'Av. das Árvores, 890', '1988-11-15', 104, 20, 3200.00),
(315, 'Carla Mendes', 'f', 'Rua das Pedras, 789', '1993-02-28', 105, 30, 3500.00),
(316, 'Felipe Pereira', 'm', 'Av. do Cerrado, 123', '1991-09-10', 106, 30, 4000.00),
(317, 'Amanda Almeida', 'f', 'Rua da Serra, 456', '1994-04-01', 107, 40, 2900.00),
(318, 'Lucas Souza', 'm', 'Av. das Flores, 789', '1989-07-12', 108, 40, 3400.00),
(319, 'Juliana Costa', 'f', 'Rua do Bosque, 246', '1996-12-05', 109, 50, 2800.00),
(320, 'Carlos Ferreira', 'm', 'Av. da Montanha, 123', '1990-03-20', 110, 50, 3800.00);

INSERT INTO empregado (nss, nome, sexo, endereco, datanasc, supernss, dnum, salario) VALUES 
(321, 'Mariana Silva', 'F', 'Rua X, 456', '1991-02-15', 110, 30, 4400.00),
(322, 'Rafael Santos', 'M', 'Rua Y, 789', '1987-09-10', 110, 30, 4000.00),
(323, 'Juliana Costa', 'F', 'Rua Z, 123', '1995-06-25', 110, 50, 3800.00),
(324, 'Gustavo Oliveira', 'M', 'Rua W, 987', '1993-11-05', 110, 50, 4300.00),
(325, 'Carolina Souza', 'F', 'Rua V, 654', '1990-04-20', 110, 50, 4100.00);

-- Inserindo dependentes
INSERT INTO dependente (enss, nomedep, sexodep, datanascdep, parentesco) VALUES 
(306, 'Ana Silva', 'F', '2010-01-01', 'Filha'),
(306, 'Luiz Silva', 'M', '2015-05-10', 'Filho'),
(307, 'Maria Alves', 'F', '2012-12-30', 'Filha'),
(308, 'Gabriel Oliveira', 'M', '2018-06-15', 'Filho'),
(308, 'Mariana Oliveira', 'F', '2019-04-01', 'Filha'),
(309, 'Pedro Souza', 'M', '2014-08-20', 'Filho');

INSERT INTO dependente (enss, nomedep, sexodep, datanascdep, parentesco) VALUES 
(310, 'Lucas Alves', 'M', '2018-01-15', 'Filho'),
(321, 'Gabriel Silva', 'M', '2019-05-01', 'Filho'),
(322, 'Lara Santos', 'F', '2015-09-25', 'Filha'),
(323, 'Felipe Costa', 'M', '2017-12-10', 'Filho'),
(324, 'Ana Oliveira', 'F', '2013-06-20', 'Filha'),
(325, 'Rafaela Souza', 'F', '2014-04-20', 'Filha');

INSERT INTO projeto (projnum, projnome, plocal, dnum) VALUES 
  (1, 'Projeto A', 'Rio Verde', 10),
  (2, 'Projeto B', 'Goiânia', 20),
  (3, 'Projeto C', 'Goiânia', 30),
  (4, 'Projeto D', 'Trindade', 40),
  (5, 'Projeto E', 'Goiânia', 50);

-- inserção dos trabalhos
INSERT INTO trabalha (enss, projnum, horas) VALUES
  (301, 1, 40),
  (302, 1, 20),
  (303, 2, 30),
  (304, 2, 10),
  (305, 3, 40),
  (306, 3, 20),
  (307, 4, 30),
  (308, 4, 10),
  (309, 5, 40),
  (310, 5, 20);

INSERT INTO trabalha (enss, projnum, horas) VALUES
(311, 1, 25),
(311, 2, 20),
(312, 2, 30),
(312, 4, 25),
(313, 1, 35),
(313, 3, 30),
(314, 3, 40),
(314, 4, 35),
(315, 1, 30),
(315, 4, 25),
(316, 2, 35),
(316, 3, 30),
(317, 2, 25),
(317, 3, 20),
(318, 1, 40),
(319, 4, 30),
(320, 3, 25),
(320, 4, 20);

INSERT INTO trabalha (enss, projnum, horas) VALUES
(321, 5, 30),
(322, 1, 25),
(323, 3, 35),
(324, 1, 40),
(325, 5, 25);