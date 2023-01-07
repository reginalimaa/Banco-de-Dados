-- Relatório 1 - Lista dos empregados admitidos entre 2022-01-01 e 2022-03-31, trazendo as colunas (Nome Empregado
-- CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Número de Telefone), ordenado por data de admissão 
-- decrescente;

select e.nome "Funcionário", e.cpf"CPF", e.dataadm"Data Admissão", e.salario"Salário", ee.cidade"Cidade", t.numero"Número"
	from empregado e
		inner join endereco ee on ee.empregado_cpf = e.cpf
		inner join telefone t on t.empregado_cpf = e.cpf
			where e.cpf = 'cpf'
				between '2022-01-01' and ' 2022-03-31'
					order by e.dataadm desc;

-- Relatório 2 - Lista dos empregados que ganham menos que a média salarial dos funcionários do Posto de Gasolina,
-- trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia), ordenado por nome
-- do empregado

select e.nome"Funcionário", e.cpf"CPF", e.dataadm"Data Admissão", e.salario"Salário", ee.cidade"Cidade Moradia"
	from empregado e
		inner join endereco ee on ee.empregado_cpf = e.cpf
		where e.salario <= (select avg(salario) from empregado)
		order by e.nome;

-- Relatório 3 - Lista dos empregados que são da cidade do Recife e possuem dependentes, trazendo as colunas
-- (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Quantidade de Dependentes), ordenado 
-- por nome do empregado;

select e.nome"Funcionário", e.cpf"CPF", e.dataadm"Data Admissão", e.salario"Salário", ee.cidade"Cidade Moradia", 
count(d.cpf)"Quantidade de Dependente"
	from dependente d
        inner join empregado e on e.cpf = d.empregado_cpf 
        inner join endereco ee on ee.empregado_cpf = e.cpf
			where ee.cidade = 'recife'
				group by e.nome;
										
-- Relatório 4 - Lista dos empregados com a quantidade total de vendas já realiza por cada Empregado, trazendo as 
-- colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas, Total Valor Vendido), ordenado por 
-- quantidade total de vendas realizadas;

select e.cpf "CPF", e.nome "Funcionário", e.sexo "Sexo", e.salario"Salário", count(v.empregado_cpf) "Quantidade Vendas",
	sum(v.valorTotal) "Total das Vendas"
	from vendas v
		inner join empregado e on e.cpf = v.empregado_cpf
			group by v.empregado_cpf;
            
-- Relatório 5 - Lista dos empregados que trabalham em cada departamento, trazendo as colunas (Nome Empregado, 
-- CPF Empregado, Salário, Nome da Ocupação, Número do Telefone do Empregado, Nome do Departamento, 
-- Local do Departamento, Número de Telefone do Departamento, Nome do Gerente), ordenado por nome do Departamento;
        
select e.nome"Nome Empregado", e.cpf"CPF", e.salario"Salário", o.cbo"Ocupação", te.numero"Telefone Empregado", d.nome"Departamento", d.localdep"Local Departamento", 
td.numero"Telefone Departamento", ep.nome"Gerente"
	from trabalhar t
       inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
       inner join ocupacao o on o.cbo = t.ocupacao_cbo
       inner join empregado e on e.cpf = t.empregado_cpf
       inner join telefone te on te.empregado_cpf = e.cpf
       inner join telefone td on td.departamento_iddepartamento = d.iddepartamento
       inner join gerente eg on eg.empregado_cpf = d.gerente_empregado_cpf
       inner join empregado ep on ep.CPF = eg.Empregado_CPF
			order by d.nome;
            
-- Relatório 6 - Lista dos departamentos contabilizando o número total de empregados por departamento, trazendo as colunas 
-- (Nome Departamento, Local Departamento, Total de Empregados do Departamento, Nome do Gerente,
-- Número do Telefone do Departamento), ordenado por nome do Departamento;

select d.nome"Nome Departamento", d.localdep"Local Departamento", count(e.cpf)"Total de Empregado do Departamento", e.nome"Nome do Gerente", td.numero"Telefone Departamento"
	from departamento d
        inner join trabalhar t on t.Departamento_idDepartamento = d.idDepartamento
        inner join empregado ep on ep.cpf = t.Empregado_CPF
        inner join telefone td on d.iddepartamento = td.Departamento_idDepartamento
        inner join gerente g on  g.Empregado_CPF = d.Gerente_Empregado_CPF
        inner join empregado e on e.cpf = g.Empregado_CPF
			group by d.nome
				order by d.nome; 
            
-- Relatório 7 - Lista das formas de pagamentos mais utilizadas nas Vendas, informando quantas vendas cada forma de pagamento já foi relacionada, trazendo as colunas (Tipo Forma Pagamento, Quantidade Vendas, Total Valor Vendido),
-- ordenado por quantidade total de vendas realizadas;

select f.tipopag"Forma de Pagamento", count(v.idvendas)"Quantidade Vendas", sum(v.valortotal)"Total Vendas"
	from vendas v
		inner join formapag f on f.Vendas_idVendas = v.idVendas
			group by f.tipopag
				order by f.tipoPag desc;
			
-- Relatório 8 - Lista das Vendas, informando o detalhamento de cada venda quanto os seus itens, trazendo as colunas (Data Venda, 
-- Nome Produto, Quantidade ItensVenda, Valor Produto, Valor Total Venda, Nome Empregado, Nome do Departamento), ordenado por Data Venda;            
            
select v.datavenda"Data Venda", e.nome"Nome Produto", count(i.qtdproduto)"Quantidade de ItensVendas", e.valor"Valor Produto", 
sum(v.valortotal)"Valor Total Vendas", emp.nome"Nome Empregado", d.nome"Nome Departamento"
	from empregado emp
        inner join trabalhar t on t.Empregado_CPF = emp.cpf
        inner join departamento d on t.Departamento_idDepartamento = d.iddepartamento
		inner join vendas v on emp.CPF = v.Empregado_CPF
		inner join itensvenda i on v.idvendas = i.vendas_idvendas       
        inner join estoque e on e.idProduto = i.Estoque_idProduto
			group by v.idvendas; 
        
-- Relatório 9 - Balaço das Vendas, informando a soma dos valores vendidos por dia, trazendo as colunas (Data Venda, Quantidade de Vendas,
-- Valor Total Venda), ordenado por Data Venda;

select substring(v.datavenda, 1, 10)"Data Venda", count(v.idvendas)"Quantidade Vendas", sum(v.valortotal)"Valor Total Venda"
	from vendas v		
			group by substring(v.datavenda, 1, 10)
				order by v.datavenda;

                
-- Relatório 10 - Lista dos Produtos, informando qual Fornecedor de cada produto, trazendo as colunas (Nome Produto, Valor Produto,
-- Categoria do Produto, Nome Fornecedor, Email Fornecedor, Telefone Fornecedor), ordenado por Nome Produto;
     
select e.nome"Nome Produto", e.valor"Valor Produto", e.categoria"Categoria Produto", f.nome"Nome Fornecedor", f.email"Email Fornecedor",
t.numero"Número Fornecedor"
	from fornecedor f 
		inner join compras c on `f.fornecedor_cnpj/cpf` = `f.cnpj/cpf`
        inner join telefone t on `t.fornecedor_cnpj/cpf` = f.idtelefone
        inner join estoque e on c.Estoque_idProduto = e.idProduto
			order by e.nome;
	
-- Relatório 11 - Lista dos Produtos mais vendidos, informando a quantidade (total) de vezes que cada produto participou em vendas, 
-- trazendo as colunas (Nome Produto, Quantidade (Total) Vendas), ordenado por quantidade de vezes que o produto participou em vendas;

select e.nome"Nome Produto", sum(i.Vendas_idVendas)"Soma Vendas" 
	from vendas v
		inner join itensvenda i on i.vendas_idvendas = v.idVendas
        inner join estoque e on i.Estoque_idProduto = e.idProduto
			group by i.Vendas_idVendas
			order by count(i.Vendas_idVendas) desc;
            
-- Relatório 12 - Lista das vendas por departamentos contabilizando o número total de vendas por departamento, trazendo as colunas 
-- (Nome Departamento, Local Departamento, Nome do Gerente,  Total de Vendas,  Valor Total das Vendas), ordenado por nome do Departamento;

SELECT d.nome'Departamento', d.localdep'Local Departamento', emp.nome'Nome do Gerente', v.idVendas'Total de Vendas', v.valorTotal'Valor Total de Vendas'
	FROM vendas v
		inner join empregado e ON e.cpf = v.Empregado_CPF
		inner join trabalhar t ON t.Empregado_CPF = e.CPF
		inner join departamento d ON d.idDepartamento = t.Departamento_idDepartamento
		inner join gerente g ON g.Empregado_CPF = d.Gerente_Empregado_CPF
		inner join empregado emp ON emp.CPF = g.Empregado_CPF
			group by  dp.nome
				order by dp.nome;
