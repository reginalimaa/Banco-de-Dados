
select e.nome "Funcionário", e.cpf"CPF", e.dataadm"Data Admissão", e.salario"Salário", ee.cidade"Cidade", t.numero"Número"
	from empregado e
		inner join endereco ee on ee.empregado_cpf = e.cpf
		inner join telefone t on t.empregado_cpf = e.cpf
			where e.cpf = 'cpf'
				between '2022-01-01' and ' 2022-03-31'
					order by e.dataadm desc;

-- Relatório 1 - Lista dos pacientes que realizaram consulta entre  2021/03/05 e 2022/09/19, trazendo as colunas (CPF do Paciente, Nome paciente, 
-- Número de Telefone, Cidade Moradia e data da consulta) ordenado pela data de consulta.

select p.cpf"CPF", p.nome"Nome Paciente", tp.numero"Número Paciente", e.cidade"Cidade Moradia", c.dataconsulta"Data Consulta"
	from paciente p
		left join endereco e on e.paciente_cpf = p.cpf
        left join telefone tp on tp.paciente_cpf = p.cpf
		left join consulta c on c.paciente_cpf = p.cpf
				group by c.dataconsulta
                    between '2021-08-20' and '2022-09-19'
						order by c.dataconsulta;
							

-- Relatório 2: Lista dos médicos que mais realizaram consultas, trazendo as colunas (CPF Médico, Nome Médico, crm Médico, Data de Consulta, 
-- quantidade total de pacientes atendidos,), ordenado pela quantidade de pacientes atendidos, do maior para o menor

select m.cpf"CPF", m.nome"Nome Médico", m.crm"CRM", c.dataconsulta"Data Consulta", count(c.paciente_cpf)"Pacientes Atendidos"
	from medico m
		inner join consulta c on c.medico_cpf = m.cpf
        inner join paciente p on p.cpf = c.paciente_cpf
			GROUP BY m.nome
				order by count(c.paciente_cpf) desc;

-- Relatório 3:Lista dos pacientes que solicitaram exames, trazendo as colunas (Nome Paciente, Tipo sanguineo, 
-- Número de Telefone, Data de solicitação e descrição do exame) ordenado pela data de solicitação.

select p.nome"Nome Paciente", p.tiposang"Tipo Saguineo", t.numero"Telefone Paciente", e.datasolicitacao"Data Solicitação", e.descricao"Descroção Exame"
	from paciente p
		left join telefone t on t.paciente_cpf = p.cpf
        inner join exame e on e.paciente_cpf = p.cpf
				group by p.nome
					order by e.datasolicitacao;
    
-- Relatório 4: Lista dos pacientes que moram na cidade do Recife, trazendo as colunas (CPF Paciente, Nome Paciente,
-- Número Telefone, Bairro de Moradia) ordenado pelo bairro.

select p.cpf"CPF Paciente", p.nome"Nome Paciente", t.numero"Telefone Paciente", e.bairro"Bairro Moradia", e.cidade"Cidade Moradia"
	from paciente p
		left join endereco e on e.paciente_cpf = p.cpf
        left join telefone t on t.paciente_cpf = p.cpf
			where e.cidade = 'recife'
				order by e.bairro;

-- Relatório 5: Lista de exames que foram solicitados no laboratório de cardiologia, trazendo as colunas (Nome Laboratório, Local, 
-- Data de Solicitação, CPF Paciente, Nome Paciente) ordenado pela data de solicitação.

select l.nome"Laboratório", l.local"Local", e.dataSolicitacao"Data Solicitação", p.cpf"CPF Paciente", p.nome
	from exame e
		inner join laboratorio l on l.idlaboratorio = e.Laboratorio_idLaboratorio
        inner join paciente p on p.cpf = e.paciente_cpf
			where l.nome = 'cardiologia'
				order by e.dataSolicitacao;
            
-- Relatório 6: Lista das especialidades laboratoriais que existem no hospital, trazendo as colunas (Nome do hospital,
-- Nome Laboratório, Horário de Funcionamento, Número de Telefone do laboratorio), ordenado pelo Nome do Hospital.

select h.nome"Nome Hospital", l.nome"Nome Lboratorio", l.horaFuncionamento"Horário Funcionamento", t.numero"Número"
	from laboratorio l
		left join telefone t on t.Laboratorio_idLaboratorio = l.idLaboratorio
        inner join solicitacaoexames s on s.Laboratorio_idLaboratorio = l.idLaboratorio
        inner join hospital h on h.cnes = s.Hospital_cnes
			group by l.nome
				order by h.nome;

-- Relatório 7: Lista de pacientes que teve no laudo médico uma baixa quantidade de hemácias no sangue, trazendo as colunas
-- (CPF Paciente, Nome Paciente, Sexo Paciente, Data de Nascimento, Data do Diagnostico, cid), ordenado pelo sexo.

select p.cpf"CPF", p.nome"Nome Paciente", p.sexo"Sexo Paciente", p.datanas"Data Nascimento", d.dataDiagnostico"Data Diagnostico", d.cid"Código Doença", d.laudoMedico"Laudo Médico"
	from paciente p
		inner join diagnostico d on d.paciente_cpf = p.cpf
        left join telefone t on t.paciente_cpf = p.cpf
			where d.laudoMedico like "%baixa quantidade de hemácias%"
				order by p.sexo;

-- Relatório 8: Lista de funcionários de apoio que trabalham no ambulatório de cardiologia, trazendo as colunas (CPF Funcionário, 
-- Nome Funcionário, função, Data Admissão, Cidade Moradia, nome do hospital) ordenado pela Cidade

select pa.cpf"CPF Funcionário", pa.funcao"Função", pa.dataadm"Data Admissão", e.cidade"Cidade Moradia", h.nome"Nome Hospital" 
	from pessoaldeapoio pa
		left join endereco e on e.PessoalDeApoio_cpf = pa.cpf
        inner join ambulatorio a on a.idAmbulatorio = pa.Ambulatorio_idAmbulatorio
        inner join hospital h on h.cnes = a.Hospital_cnes 
			order by e.cidade;

-- Relatório 9: Lista de médicos cadastrados no hospital, trazendo as colunas (CPF Médico, Nome Médico, Especialidade, 
-- Número de Telefone, Cidade Moradia, nome do hospital ) ordenado pela especialidade.

select m.cpf"CPF Médico", m.nome"Nome Médico", m.especialidade"Especialidade Médica", t.numero"Telefone Médico", e.cidade, h.nome"Hospital" 
	from medico m
		left join telefone t on t.medico_cpf = m.cpf
        left join endereco e on e.medico_cpf = m.cpf
        inner join hospital h on m.Hospital_cnes = h.cnes
			order by m.especialidade;

-- Relatório 10: Lista dos médicos que atendem em Jaboatão dos Guararapes, trazendo as colunas ( Nome Médico, crm,
-- Especialidade Médica, Número Telefone, bairro, quantidade de pacientes atendidos ), ordenar pelo nome do médico.

select m.nome"Nome Médico", m.crm"CRM", m.especialidade"Especialidade Médica", t.numero"Numero", e.bairro"Bairro Moradia", count(c.paciente_cpf)
	from medico m 
		left join telefone t on t.medico_cpf = m.cpf
		left join endereco e on e.medico_cpf = m.cpf
        inner join consulta c on c.medico_cpf = m.cpf
        inner join paciente p on p.cpf = c.paciente_cpf
			where e.cidade like "jaboatao dos guararapes"
				order by m.nome;
        
-- Relatório 11: Lista de Mulheres trans que o Hospital Pé na Cova atende, trazendo as colunas (CPF Paciente, Nome Paciente, 
-- Nome Social, Data Nascimento, Cidade Moradia, Número Telefone, nome do hospital, nome do médico que realizou o atendimento),
-- ordenado pela Data Nascimento.

SELECT pac.cpf"CPF", pac.nome"Nome Paciente", pac.nomeSocial AS nome_paciente, pac.dataNas"Data Nascimento", e.cidade"Cidade Moradia", tel.numero"Telefone", hosp.nome AS nome_hospital, med.nome AS nome_medico
	FROM paciente pac 
		left JOIN endereco e ON pac.cpf = e.Paciente_cpf
		left JOIN telefone tel ON pac.cpf = tel.Paciente_cpf
		INNER JOIN ambulatorio amb ON amb.idAmbulatorio = pac.Ambulatorio_idAmbulatorio
		INNER JOIN hospital hosp ON hosp.cnes = amb.Hospital_cnes
		INNER JOIN medico med ON hosp.cnes = med.Hospital_cnes
			ORDER BY  pac.dataNas;

-- Relatório 12: Lista dos pacientes que realizaram o exame de ecocardiograma, trazendo as colunas (CPF Paciente, Nome Paciente,
-- Tipo de Exame, Data Solicitação, Data Resultado, nome do laboratório, local do laboratório e número do laboratório) ordenado pelo nome do paciente.

SELECT pac.cpf, pac.nome AS nome_paciente, exa.tipoExame, exa.dataSolicitacao, exa.dataResultado, lab.nome AS nome_laboratorio, lab.local, tel.numero
	FROM exame exa
	INNER JOIN paciente pac ON pac.cpf = exa.Paciente_cpf
	INNER JOIN laboratorio lab ON lab.idLaboratorio = exa.Laboratorio_idLaboratorio
	LEFT JOIN telefone tel ON lab.idLaboratorio = tel.Laboratorio_idLaboratorio
		WHERE exa.tipoExame like "Ecocardiograma"
			ORDER BY  pac.nome;

-- Relatório 13: Lista dos exames solicitados pelo Hospital Prof. Danilo Farias, trazendo as colunas (Nome Hospital, Nome Laboratório,
-- Tipo do Exame, nome do Paciente) ordenado pelo tipo de exame.

SELECT hosp.nome AS nome_hospital, lab.nome AS nome_laboratorio, exa.tipoExame, pac.nome AS nome_paciente
	FROM exame exa
		INNER JOIN Paciente pac ON pac.cpf = exa.Paciente_cpf
		INNER JOIN Laboratorio lab ON lab.idLaboratorio = exa.Laboratorio_idLaboratorio
		INNER JOIN SolicitacaoExames se ON lab.idLaboratorio = se.Laboratorio_idLaboratorio
		INNER JOIN Hospital hosp ON hosp.cnes = se.Hospital_cnes
			WHERE hosp.nome LIKE "%Danilo Farias%";

-- Relatório 14: Lista do parecer médico das consultas realizadas no dia 2021/08/04, trazendo as colunas (Nome Paciente, 
-- Data Nascimento, Nome Médico, Data Consulta) ordenado pela Data Nascimento.

SELECT pac.nome AS nome_paciente, pac.dataNas, med.nome AS nome_medico, cons.dataConsulta
	FROM Paciente pac
		INNER JOIN Consulta cons ON pac.cpf = cons.Paciente_cpf
		INNER JOIN Medico med ON med.cpf = cons.Medico_cpf
			WHERE cons.dataConsulta like "2022-05-01"
				ORDER BY pac.dataNas;

-- Relatório 15: Encontre o nome do paciente que realizou o exame cuja chave de identificação é "25554", trazendo as colunas 
-- (CPF do paciente, Nome do Paciente, Data solicitação, Data Resultado, nome laboratório e id do exame).

SELECT pac.cpf, pac.nome AS nome_paciente, exa.dataSolicitacao, exa.dataResultado, lab.nome AS nome_laboratorio, exa.idExame
	FROM  exame exa
		INNER JOIN paciente pac ON pac.cpf = exa.Paciente_cpf
		INNER JOIN laboratorio lab ON lab.idLaboratorio = exa.Laboratorio_idLaboratorio
			WHERE exa.idExame like "25554";

-- Relatório 16: lista dos  horários de funcionamento dos ambulatórios, trazendo as colunas (id Ambulatório,
-- Especialização do ambulatório, Número de Telefone, Nome Hospital) oredenado pelo id.

select a.idAmbulatorio, a.especializacao, t.numero, h.nome
	from  ambulatorio a
    left join telefone t on t.Ambulatorio_idAmbulatorio = a.idambulatorio
    inner join hospital h on h.cnes = a.Hospital_cnes
		order by a.idAmbulatorio;

-- Relatório 17: Lista dos pacientes diagnosticados com Arritmia Cardíaca, trazendo as colunas (Nome Paciente, Data Nascimento, 
-- Numero Telefone, Código de identificação da Doença, laudo médico, Data Diagnóstico, id do exame) ordenado pela data de diagnóstico 

SELECT p.nome, p.dataNas, t.numero, d.cid, d.laudomedico, d.dataDiagnostico, e.idExame
	FROM Paciente p
		LEFT JOIN telefone t ON p.cpf = t.Paciente_cpf
		INNER JOIN Diagnostico d ON d.paciente_cpf = p.cpf
		INNER JOIN exame e on e.paciente_cpf = p.cpf
			ORDER BY d.cid;
        
-- Relatório 18: Lista dos números de telefone dos médicos cadastrados no Hospital Prof. Danilo Farias, trazendo as colunas 
-- (Nome Hospital Nome Médico, Especialidade Médica, Data Atendimento, Número de Telefone, Cidade Moradia) ordenado pela especialidade

select h.nome"Nome Hospital", m.nome, m.especialidade, t.numero, e.cidade
		from medico m 
			left join endereco e on e.medico_cpf = m.cpf
			left join telefone t on t.medico_cpf = m.cpf
            inner join hospital h on h.cnes = m.Hospital_cnes
				where h.nome like "Hospital Prof. Danilo Farias"
					order by m.especialidade;

-- Relatório 19: Lista das solicitações de exames, trazendo as colunas (id Exame, descrição exame, Nome Laboratório, Local do Laboratório,
-- Nome Paciente, Nome Médico) ordenado pela data de solicitação mais antiga.

select e.idexame, e.descricao, l.nome, l.local, p.nome, m.nome
	from exame e 
		inner join laboratorio l on l.idLaboratorio = e.Laboratorio_idLaboratorio
        inner join paciente p on p.cpf = e.paciente_cpf
        inner join consulta c on c.paciente_cpf = p.cpf
        inner join medico m on c.medico_cpf = m.cpf
			order by e.dataSolicitacao desc;
		
-- Relatório 20: Lista dos médicos que atendem no ambulatório geriátrico, trazendo as colunas ( Nome Médico, crm, Número Telefone).

select m.nome"Nome Médico", m.crm"CRM", t.numero"Telefone", l.nome"Especialização", p.nome"Nome Paciente", c.dataconsulta"Data Consulta"
	from medico m
		left join telefone t on t.medico_cpf = m.cpf
        inner join consulta c on c.medico_cpf = m.cpf
        inner join paciente p on p.cpf = c.paciente_cpf
        inner join exame e on e.paciente_cpf = p.cpf
        inner join laboratorio l on e.Laboratorio_idLaboratorio = l.idLaboratorio
			where l.nome like "%geriátrico" 
				order by c.dataconsulta;
		
-- -----------------------------------------------------
-- CREATE VIEW
-- -----------------------------------------------------        
        
CREATE VIEW  AmbulatorioGeriatrico as
select m.nome"Nome Médico", m.crm"CRM", t.numero"Telefone", l.nome"Especialização", p.nome"Nome Paciente", c.dataconsulta"Data Consulta"
	from medico m
		left join telefone t on t.medico_cpf = m.cpf
        inner join consulta c on c.medico_cpf = m.cpf
        inner join paciente p on p.cpf = c.paciente_cpf
        inner join exame e on e.paciente_cpf = p.cpf
        inner join laboratorio l on e.Laboratorio_idLaboratorio = l.idLaboratorio
			where l.nome like "%geriátrico" 
				order by c.dataconsulta;

CREATE VIEW SolicitacaoExames as
	select e.idexame, e.descricao, l.nome, l.local, p.nome, m.nome
		from exame e 
			inner join laboratorio l on l.idLaboratorio = e.Laboratorio_idLaboratorio
			inner join paciente p on p.cpf = e.paciente_cpf
			inner join consulta c on c.paciente_cpf = p.cpf
			inner join medico m on c.medico_cpf = m.cpf
				order by e.dataSolicitacao desc;

CREATE VIEW TelefoneMedico as
	select h.nome"Nome Hospital", m.nome, m.especialidade, t.numero, e.cidade
		from medico m 
			left join endereco e on e.medico_cpf = m.cpf
			left join telefone t on t.medico_cpf = m.cpf
            inner join hospital h on h.cnes = m.Hospital_cnes
				where h.nome like "Hospital Prof. Danilo Farias"
					order by m.especialidade;

CREATE VIEW AritimiaCardiaca as
	SELECT p.nome, p.dataNas, t.numero, d.cid, d.laudomedico, d.dataDiagnostico, e.idExame
		FROM Paciente p
			LEFT JOIN telefone t ON p.cpf = t.Paciente_cpf
			INNER JOIN Diagnostico d ON d.paciente_cpf = p.cpf
			INNER JOIN exame e on e.paciente_cpf = p.cpf
				ORDER BY d.cid;

CREATE VIEW FuncionamentoAmb as
	select a.idAmbulatorio, a.especializacao, t.numero, h.nome
		from  ambulatorio a
		left join telefone t on t.Ambulatorio_idAmbulatorio = a.idambulatorio
		inner join hospital h on h.cnes = a.Hospital_cnes
			order by a.idAmbulatorio;

CREATE VIEW SolicitacaoExame as
	SELECT hosp.nome AS nome_hospital, lab.nome AS nome_laboratorio, exa.tipoExame, pac.nome AS nome_paciente
		FROM exame exa
			INNER JOIN Paciente pac ON pac.cpf = exa.Paciente_cpf
			INNER JOIN Laboratorio lab ON lab.idLaboratorio = exa.Laboratorio_idLaboratorio
			INNER JOIN SolicitacaoExames se ON lab.idLaboratorio = se.Laboratorio_idLaboratorio
			INNER JOIN Hospital hosp ON hosp.cnes = se.Hospital_cnes
				WHERE hosp.nome LIKE "%Danilo Farias%";

CREATE VIEW PesquisarConsulta as
SELECT pac.nome AS nome_paciente, pac.dataNas, med.nome AS nome_medico, cons.dataConsulta
	FROM Paciente pac
		INNER JOIN Consulta cons ON pac.cpf = cons.Paciente_cpf
		INNER JOIN Medico med ON med.cpf = cons.Medico_cpf
			WHERE cons.dataConsulta like "2022-05-01"
				ORDER BY pac.dataNas;


CREATE VIEW ExameEcocardiograma as
	SELECT pac.cpf, pac.nome AS nome_paciente, exa.tipoExame, exa.dataSolicitacao, exa.dataResultado, lab.nome AS nome_laboratorio, lab.local, tel.numero
		FROM exame exa
			INNER JOIN paciente pac ON pac.cpf = exa.Paciente_cpf
			INNER JOIN laboratorio lab ON lab.idLaboratorio = exa.Laboratorio_idLaboratorio
			LEFT JOIN telefone tel ON lab.idLaboratorio = tel.Laboratorio_idLaboratorio
				WHERE exa.tipoExame like "Ecocardiograma"
					ORDER BY  pac.nome;

CREATE VIEW ConsultaPeriodo  AS 
	select p.cpf"CPF", p.nome"Nome Paciente", tp.numero"Número Paciente", e.cidade"Cidade Moradia", c.dataconsulta"Data Consulta"
		from paciente p
			left join endereco e on e.paciente_cpf = p.cpf
			left join telefone tp on tp.paciente_cpf = p.cpf
			left join consulta c on c.paciente_cpf = p.cpf
					group by c.dataconsulta
						between '2021-08-20' and '2022-09-19'
							order by c.dataconsulta;

create view RankingMedico as
	select m.cpf"CPF", m.nome"Nome Médico", m.crm"CRM", c.dataconsulta"Data Consulta", count(c.paciente_cpf)"Pacientes Atendidos"
		from medico m
			inner join consulta c on c.medico_cpf = m.cpf
			inner join paciente p on p.cpf = c.paciente_cpf
				GROUP BY m.nome
					order by count(c.paciente_cpf) desc;