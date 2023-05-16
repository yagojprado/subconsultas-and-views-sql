### subconsultas e views com sql

Neste projeto de SQL, utilizei o MariaDB (uma variante do MySQL) para realizar o povoamento de tabelas, criar consultas e visualizações (views). O contexto do projeto foi baseado em uma empresa fictícia que possui dados relacionados a departamentos, empregados, projetos, trabalhos e dependentes dos empregados.

### As principais etapas do projeto incluíram:

## Modelagem do Banco de Dados: 
  Foi realizado o design do esquema do banco de dados para acomodar as entidades envolvidas - departamentos, empregados, projetos, trabalhos e dependentes dos empregados. As tabelas foram criadas com as colunas apropriadas para armazenar as informações necessárias.

## Povoamento das Tabelas: 
  Utilizei comandos SQL para inserir dados fictícios nas tabelas, populando cada uma delas com registros representativos. Isso envolveu a inserção de departamentos com seus respectivos números e nomes, empregados com informações como número de empregado, nome, data de admissão e associação a um departamento específico, projetos com números e nomes, entre outros dados relevantes.

## Consultas SQL:
  Criei consultas SQL para extrair informações úteis do banco de dados. Essas consultas envolveram a recuperação de dados de uma ou várias tabelas, uso de funções agregadas (como COUNT, SUM, AVG) para obter métricas específicas, aplicação de filtros com a cláusula WHERE para restringir os resultados e uso de cláusulas de junção (como INNER JOIN) para combinar dados de várias tabelas relacionadas.

 ## Visualizações (Views): 
  Criei visualizações (views) no banco de dados para fornecer resultados predefinidos com base em consultas complexas ou frequentemente usadas. Essas visualizações permitiram acesso conveniente aos dados calculados ou filtrados, simplificando consultas futuras.
