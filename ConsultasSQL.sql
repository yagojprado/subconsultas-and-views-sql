//alimentação de tabelas feitas com CHATGPT, para economizar tempo
-- Inserindo novos empregados
INSERT INTO empregado (nss, nome, sexo, endereco, datanasc, supernss, dnum, salario) VALUES 
(321, 'Mariana Silva', 'F', 'Rua X, 456', '1991-02-15', 110, 30, 4400.00),
(322, 'Rafael Santos', 'M', 'Rua Y, 789', '1987-09-10', 110, 30, 4000.00),
(323, 'Juliana Costa', 'F', 'Rua Z, 123', '1995-06-25', 110, 50, 3800.00),
(324, 'Gustavo Oliveira', 'M', 'Rua W, 987', '1993-11-05', 110, 50, 4300.00),
(325, 'Carolina Souza', 'F', 'Rua V, 654', '1990-04-20', 110, 50, 4100.00);

-- Inserindo novos dependentes
INSERT INTO dependente (enss, nomedep, sexodep, datanascdep, parentesco) VALUES 
(310, 'Lucas Alves', 'M', '2018-01-15', 'Filho'),
(321, 'Gabriel Silva', 'M', '2019-05-01', 'Filho'),
(322, 'Lara Santos', 'F', '2015-09-25', 'Filha'),
(323, 'Felipe Costa', 'M', '2017-12-10', 'Filho'),
(324, 'Ana Oliveira', 'F', '2013-06-20', 'Filha'),
(325, 'Rafaela Souza', 'F', '2014-04-20', 'Filha');

-- Inserindo novos trabalhos
INSERT INTO trabalha (enss, projnum, horas) VALUES
(321, 5, 30),
(322, 1, 25),
(323, 3, 35),
(324, 1, 40),
(325, 5, 25);

//correção de salario para não quebrar o numero da media
update empregado set salario = 2800 where supernss = 109;

//mudar localizao para variar alguns codigos

update departamento set dlocalizacao = "Rio Verde" where dnum = 10; 
update projeto set plocal = "Rio verde" where dnum = 10;

update departamento set dlocalizacao = "Trindade" where dnum = 40; 
update projeto set plocal = "Trindade" where dnum = 40;


//fazer as alterações acima antes de iniciar

1 - 

//resulta os departamentos com mais de 100 horas trabalhas, junto do total de horas
SELECT p.projnome as projetos_trabalhados, t.total_horas FROM projeto p INNER JOIN (SELECT projnum, SUM(horas) as total_horas FROM trabalha GROUP BY projnum ) t ON p.projnum = t.projnum WHERE t.total_horas > 100 order by t.total_horas desc;

2-

//checagem para verificar a ligação dos empregados e do projeto com o dnum
SELECT p.projnome, e.nome, e.salario from projeto p inner join empregado e on e.dnum = p.dnum order by p.dnum; 

//retorna media do salario do projeto A
SELECT avg(e.salario) as media FROM empregado e where e.dnum  = 10 and e.dnum in(select p.dnum from projeto p);

3 -

//media dos salarios por departamento
select avg(salario), dnum from empregado GROUP by dnum;

//funcionarios que ganham mais do que a media do departamento deles
SELECT e.dnum as departamento, e.nome, e.salario  FROM empregado e WHERE e.salario > (SELECT AVG(m.salario) FROM empregado m where m.dnum = e.dnum GROUP by m.dnum) order by dnum ASC;
	
4 - 

//contagem de todos os departamentos
select d.dnome, count(e.dnum) from departamento d inner join empregado e on e.dnum = d.dnum group by d.dnum order by count(e.dnum) desc;

//maior departamento com mais funcionarios 
select d.dnome as departamento, e.total from departamento d inner join (select dnum, count(dnum) as total from empregado group by dnum) as e on e.dnum = d.dnum order by e.total desc limit 1;

5 -

//mostra a data de nascimento do empregado e do dependente, porém sem subconsulta
select e.nome as funcionario, DATE_FORMAT(e.datanasc, '%m-%d') as nascimento, d.nomedep as dependente, DATE_FORMAT(d.datanascdep, '%m-%d') as nascimento from empregado e join dependente d on MONTH(e.datanasc) = month(d.datanascdep) and DAY(e.datanasc) = DAY(d.datanascdep); 

//retorna apenas os nomes, porém com subconsulta, simplificado
select e.nome, e.datanasc from empregado e where DATE_FORMAT(e.datanasc, '%d-%m') in (select DATE_FORMAT(d.datanascdep, '%d-%m') from dependente d);

6 - 

//possui dependente? entao mostre os dados
create view familia as select * from empregado e where nss in(select enss from dependente);

//visualização da view criada
select * from familia;

7 - 

//criação de uma view de cada media salarial de cada departamento
CREATE VIEW media as select avg(salario) as media_salarial, d.dnome as departamentos from empregado e inner join departamento d on d.dnum = e.dnum GROUP by e.dnum;

//visualização da view criada
select * from media;

8 -

//cria a view para ver a maior para a menor
create view maiordep as select d.dnome as departamento, e.total from departamento d inner join (select dnum, count(dnum) as total from empregado group by dnum) as e on e.dnum = d.dnum order by e.total desc;

//visualização da view criada
select * from maiordep;

	
9 - 

//trabalha em projetos em goiania?
create view projgoiania as select * from empregado e where e.dnum in(select p.dnum from Projeto p where plocal="goiania") order by dnum;

//visualização da view criada
select * from projgoiania;



