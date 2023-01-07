-------------------------------- INSERT INTO HOSPITAL --------------------------------
insert into hospital (cnes, nome, email)
	values
    
("12345678911", "Hospital Pé na Cova", "hospital@penacova.br"),

("10572048000", "Hospital Prof. Danilo Farias", "hospital.proffarias@br");

-------------------------------- INSERT INTO LABORATORIO --------------------------------

insert into laboratorio (id_laboratorio, nome, horaFuncionamento, local)
	values

("52114", "Lab Cardiológico", "null", "setor 1"),
("52115", "Lab Análises", "null", "setor 2"),
("52116", "Lab Oftalmológico", "null", "setor 3"),
("52117", "Lab Dermatológico", "null", "setor 4"),
("52118", "Lab Geriátrico", "null", "setor 1"),
("52119", "Lab Infecções", "null", "setor 2");


-------------------------------- INSERT INTO AMBULATORIO -----------------------------

insert into ambulatorio (idambulatorio, especializacao, hospital_cnes, horariofuncionamento)
	values
    
("15448", "Infectologia", "10572048000", "null"),
("21526", "Cardiologia", "12345678911",  "null"),
("21546", "Oftalmologia", "10572048000", "null"),
("22556", "Geriatria", "12345678911", "null"),
("24545", "Dermatologia", "12345678911", "null"),
("25457", "Clínico Geral", "10572048000", "null");


-------------------------------- INSERT INTO PESSOALDEAPOIO -----------------------------

insert into pessoaldeapoio (cpf, nome, dataadm, datanas, email, sexo, funcao, ambulatorio_idambulatotio)
	values
    
("040.340.788-04", "Otávio Castro Lins", "2009-01-22", "1978-08-18", "otaviolins@hotmail.com", "M", "Enfermeiro", "25457"),
("076.890.322-94", "Lívia Castro Ramos", "2018-12-20", "1991-03-31", "liviacramos@gmail.com", "F", "Pessoa Transportadora de Coleta", "21526"),
("088.454.009-44", "Ronaldo Silva Moreira", "2020-05-14", "1990-10-31", "ronaldosilvam@gmail.com", "M", "Maqueiro", "15448"),
("088.677.556-02", "Adriana Silveira", "2011-05-27", "1980-06-17", "adriannasilveira@hotmail.com", "F", "Enfermeiro", "25457"),
("097.685.344-01", "Rodrigo Silva Farias", "2006-07-02", "1979.02-25", "rodrigosfarias@yahoo.com", "M", "Recepcionista", "24545"),
("100.124.989-02", "Maria Alice de Souza", "2018-04-27", "1990-09-07", "alicemariasouza@hotmail.com", "F", "Auxiliar de Limpeza", "24545"),
("190.433.101-54", "Olívia Maria Santos", "2003-10-08", "1975-03-10", "oliviamarias@yahoo.com", "F", "Enfermeiro", "21546"),
("192.431.156-98", "João Ricardo Raposo", "2001-01-20", "1975-05-09", "joaoraposo@yahoo.com", "M", "Maqueiro", "15448"),
("233.123.554-67", "João Marcelo de Melo", "2010-12-20", "1987-03-10", "joaommelo@gmail.com", "M", "Auxiliar de Limpeza", "21526"),
("253.120.589-07", "José Eduardo Nascimento", "2007-08-03", "1980-08-17", "joseeduardonasc@gmail.com", "M", "Auxiliar de Limpeza", "21526"),
("290.566.434-12", "Lilian Marques Caiado", "2005-12-20", "1979-01-30", "liliancaiado@gmail.com", "F", "Enfermeiro", "25457"),
("300.641.345-21", "Gabriel César Marques", "2010-02-20", "1989-07-01", "cesargabriel@gmail.com", "M", "Vigia", "21526"),
("322.120.576-04", "Mariana Correia Martins", "2015-05-15", "1992-11-15", "martinsmariana@gmail.com", "F", "Recepcionista", "21546"),
("611.839.254-50", "Carlos Augusto Figueiredo", "2001-01-16", "1975-06-03", "augustocarlosf@yahoo.com", "M", "Pessoa Transportadora de Coleta", "15448"),
("655.209.122-43", "Tatiane Vitória de Lima", "2018-06-23", "1991-03-30", "tatianelima@gmail.com", "F", "Auxiliar de Limpeza", "21546");


-------------------------------- INSERT INTO PACIENTE --------------------------------

insert into paciente (cpf, nome, nomesocial, datanas, tiposang, sexo, ambulatorio_idambulatorio)
	values

("014.128.358-00", "Everton Silva Santos", "null", "1990-08-12", "B+", "Homem Cis", "15448"),

("025.111.287-04", "Eduarda Pessoa Santana", "null", "1960-04-19", "O-", "Mulher Cis", "22556"),

("050.811.424-63", "Silas Emanuel da Silva Rocha", "null", "1987-07-02", "O+", "Homem Cis", "25457"),

("055.432.798-50", "Acácio Henrique Santos", "null", "2002-03-15", "AB+", "Homem Cis", "21546"),

("058.995.125-00", "Daniel Salgado Neves", "null", "1988-10-09", "AB+", "Homem Trans", "15448"),

("070.154.874-57", "Jaqueline Malafaia Brandão", "null", "2003-02-23", "B+", "Mulher Cis", "15448"),

("075.388.096-67", "Ronaldo Felipe Sabino", "null", "1954-08-30", "A+", "Homem Cis", "22556"),

("077.188.387-05", "Isys Grazieli Nascimento", "null", "2004-09-08", "B+", "Mulher Trans", "25457"),

("098.765.432-11", "Lidiane Cabral Ferreira", "null", "1999-09-23", "B", "Mulher Trans", "25457"),

("100.300.650-76", "Maria Clara Kamilly Martins", "null", "2003-11-17", "A-", "Mulher Trans", "24545"),

("102.406.954-01", "João Pedro Procópio Santos", "null", "1994-09-23", "B-", "Homem Cis", "24545"),

("112.088.387-02", "Aldenir José Telles", "null", "2004-06-11", "O-", "Homem Cis", "25457"),

("112.088.396-02", "Gisele Almeida França", "null", "2004-12-09", "A+", "Mulher Cis", "24545"),

("112.345.678-90", "Regina de Oliveira Júnior", "null", "2001-02-19", "O-", "Mulher Cis", "21526"),

("120.380.134-18", "Weverton Correia Souza", "null", "2001-05-17", "B-", "Homem Trans", "24545"), 

("127.943.234-07", "Marcela França Silva", "null", "2000-04-01", "AB-", "Mulher Cis", "15448"),

("128.221.432-09", "Maria Regina Delmiro de Lima", "null", "2000-11-04", "AB+", "Mulher Cis", "21526"),

("129.915.258-01", "Arthur Martins Figueiroa", "null", "1999-12-12", "AB-", "Homem Trans", "22556"),

("147.645.754-35", "João Gabriel Carneiro Rocha", "null", "2001-03-05", "B+", "Homem Cis", "25457"),

("524.100.254-08", "Betina Soares Bittencourt", "null", "1995-09-09", "B-", "Mulher Cis", "15448");


-------------------------------- INSERT INTO MEDICO ---------------------------------

insert into medico (cpf, nome, crm, especialista, especialidade, hospital_cnes)
	values

("012.788.261-05", "Florência Paris de Melo", "12.655/PE", "Cardiologista", "12345678911"),
("041.455.112-85", "Marcela de Lira Medeiros", "98.545/PE", "Dermatologista", "12345678911"),
("096.098.342-90", "Thiago Santhiago Salerno", "32.895/PE", "Infectologista", "12345678911"),
("096.112.341-09", "Vitória Ramos de Sousa", "34.509/PE", "Cardiologista", "10572048000"),
("120.322.128-14", "Henry Bernal Moura", "90.233/PE", "Cardiologista", "12345678911"),
("234.112.094-54", "Thomaz Caiado de Santanna", "43.897/PE", "Clínico Geral", "10572048000"),
("234.212.786-09", "Thierry Almeida Figueiroa", "12.453/PE", "Cardiologista", "12345678911"),
("234.789.253-41", "Robert Antônio da Silva", "78.235/PE", "Oftalmologista", "10572048000"),
("243.165.651-51", "Enzo Rottuno Giulio", "23.716/PE", "Geriatra", "12345678911"),
("275.453.983-37", "Júlio César Aquino", "27.387/PE", "Clínico Geral", "10572048000"),
("369.101.542-01", "Josyanne Assis", "12.478/PE", "Cardiologista", "10572048000"),
("369.789.119-85", "Deise dos Santos", "78.412/PE", "Clínico Geral", "10572048000"),
("574.312.721-34", "Sofia Brasileiro Santos", "38.654/PE", "Dermatologista", "12345678911"); 

-------------------------------- INSERT INTO CONSULTA --------------------------------

alter table consulta modify column medico_cpf varchar(14);
alter table consulta modify column paciente_cpf varchar(14);

insert into consulta (idconsulta, medico_cpf, paciente_cpf, dataConsulta, parecer) 
	values 

("1", "012.788.261-05", "128.221.432-09", "2021-08-04", "necessidade de solicitação de exame ecocardiograma para avaliar as medidas e a mobilidade das paredes das cavidades do coração, das válvulas, a velocidade e a direção do fluxo do sangue."),

("2", "041.455.112-85", "112.345.678-90", "2022-04-10", "necessidade de solicitação de exame para a avaliação das enzimas do fígado (TGO)."),

("3", "243.165.651-51", "070.154.874-57", "2022-09-23", "necessidade de solicitação de Teste de Ergométrico para avaliar atividade elétrica do coração durante o esforço físico máximo e o comportamento da pressão arterial e a aptidão física do paciente."),

("4", "234.112.094-54", "014.128.358-00", "2021-07-05", "necessidade de solicitação de hemograma para avaliar se há anemia."),

("5", "234.789.253-41" , "120.380.134-18", "2022-07-10", "necessidade de solicitação de exame de mapeamento de retina para avaliar a estrutura interna do olho para registrar aspectos da retina."),

("6", "096.098.342-90", "100.300.650-76", "2022-07-08", "necessidade de solicitação de exame de imuno cintilografia para avaliar o sistema imunológico do paciente e a resposta de seu organismo a processos infecciosos e lesões."),

("7", "275.453.983-37", "102.406.954-01", "2022-07-18", "necessidade de solicitação de hemograma para avaliar se há anemia."),

("8", "012.788.261-05", "055.432.798-50", "2021-08-20", "necessidade de solicitação de exame ecocardiograma para avaliar as medidas e a mobilidade das paredes das cavidades do coração, das válvulas, a velocidade e a direção do fluxo do sangue."),

("09", "096.112.341-09", "112.088.396-02", "2022-09-19", "necessidade de solicitação de Teste de Ergométrico para avaliar atividade elétrica do coração durante o esforço físico máximo e o comportamento da pressão arterial e a aptidão física do paciente."),

("10", "574.312.721-34", "098.765.432-11", "2021-03-05", "necessidade de solicitação de exame Raspagem para avaliar se há alguma infecção fúngica e escabiose na derme."),

("11", "369.101.542-01", "112.088.387-02", "2022-05-01 10:10", "necessidade de solicitação de exame ecocardiograma para avaliar as medidas e a mobilidade das paredes das cavidades do coração, das válvulas, a velocidade e a direção do fluxo do sangue."),

("12", "369.789.119-85", "077.188.387-05", "2022-08-25 9:25", "necessidade de solicitação de hemograma para avaliar se há anemia.");

-------------------------------------------------- INSERT INTO ENDERECO --------------------------------------------------

alter table endereco modify column medico_cpf varchar(14);
alter table endereco modify column paciente_cpf varchar(14);
alter table endereco modify column PessoalDeApoio_cpf varchar(14);

insert into endereco (cep, logradouro, numero, bairro, cidade, estado, paciente_cpf, pessoaldeapoio_cpf, medico_cpf) 
	values 

("50604051", "Rua Piratini", "115", "Iputinga", "Recife", "PE", "128.221.432-09", "null", "null"),

("50690745", "Rua Carandiru", "12", "Torrões", "Recife", "PE", "112.345.678-90", "null", "null"),

("50639871", "Rua Clarice Lispector", "1321", "Várzea", "Jaboatão dos Guararapes", "PE", "070.154.874-57", "null", "null"),

("34984235", "Avenida Pintor Lauro Villares", "1229", "Cordeiro", "Recife", "PE", "014.128.358-00", "null", "null"),

("23456987", "Rua Guerra dos Mascates", "198", "Afogados", "Recife", "PE", "120.380.134-18", "null", "null"),

("98646372", "Rua Getúlio Vargas", "109", "Ibura", "Recife", "PE", "100.300.650-76", "null", "null"),

("34526434", "Rua Marechal Brigadeiro", "234", "Caxangá", "Jaboatão dos Guararapes", "PE", "102.406.954-01", "null", "null"),

("46799865", "Rua Castelo Branco", "654", "Água Fria", "Paulista", "PE", "055.432.798-50", "null", "null"),

("76538294", "Avenida Padre de Melo", "678", "Coelhos", "Jaboatão dos Guararapes", "PE", "112.088.396-02", "null", "null"),

("65420876", "Rua Arnaldo Antunes", "907", "Casa Amarela", "Olinda", "PE", "098.765.432-11", "null", "null"),

("56532784", "Rua Caramujo", "908", "Coqueiral", "Recife", "PE", "112.088.387-02", "null", "null"),

("56243789", "Rua Coqueiral", "376", "Dois Unidos", "Paulista", "PE", "077.188.387-05", "null", "null"),

("98706780", "Rua Castelo Encantado", "09", "Barro", "Recife", "PE", "025.111.287-04", "null", "null"),

("65482790", "Rua da Folha", "18", "Areias", "Jaboatão dos Guararapes", "PE", "075.388.096-67", "null", "null"),

("65624353", "Rua São José", "15", "Ilha do Leite", "Abreu e Lima", "PE", "129.915.258-01", "null", "null"),

("65487898", "Rua São Francisco", "87", "Imbiribeira", "Jaboatão dos Guararapes", "PE", "050.811.424-63", "null", "null"),

("23465728", "Rua Sete de Setembro", "34", "Ipsep", "Jaboatão dos Guararapes", "PE", "147.645.754-35", "null", "null"),

("75563729", "Rua Tiradentes", "75", "Iputinga", "Olinda", "PE", "058.995.125-00", "null", "null"),

("98736829", "Avenida Brasil", "78", "Iputinga", "Recife", "PE", "524.100.254-08", "null", "null"),

("63542699", "Rua Quatro", "30", "Areias", "Olinda", "PE", "127.943.234-07", "null", "null"),

("53442890", "Rua Vinte e Cinco de Março", "234", "Boa Vista", "Recife", "PE", "null", "120.322.128-14", "null"),

("98880768", "Avenida Beberibe", "93", "Iputinga", "Recife", "PE", "null",  "234.212.786-09", "null"),

("12395608", "Rua Boa Viagem", "11", "Caxangá", "Recife", "PE", "null", "041.455.112-85", "null"),

("50456371", "Avenida Piratas do Caribe", "24", "Várzea", "Recife", "PE", "null", "096.098.342-90", "null"),

("50897556", "Rua Tribalistas", "71", "Torrões", "Recife", "PE", "null", "243.165.651-51", "null"),

("60998378", "Rua Lady Gaga", "376", "Engenho do Meio", "Jaboatão dos Guararapes", "PE", "null", "574.312.721-34", "null"),

("11452467", "Rua Beyoncé", "194", "Cordeiro", "Recife", "PE", "null", "234.112.094-54", "null"),

("76365483", "Avenida Rihanna", "115" ,"Santo Amaro", "Jaboatão dos Guararapes", "PE", "null",  "275.453.983-37", "null"),

("87357392", "Avenida Rio Branco", "115", "Boa Vista", "Camaragibe", "PE", "null", "096.112.341-09", "null"),

("50604051", "Rua Piratini", "240", "Iputinga", "Recife", "PE", "null", "null", "233.123.554-67"),

("50690745", "Rua Carandiru", "56", "Torrões", "Recife", "PE", "null", "null", "253.120.589-07"),

("50639871", "Rua Clarice Lispector", "1001", "Várzea", "Jaboatão dos Guararapes", "PE", "null", "null", "100.124.989-02"),

("34984235", "Avenida Pintor Lauro Villares", "675", "Cordeiro", "Recife", "PE", "null", "null",  "655.209.122-43"),

("23456987", "Rua Guerra dos Mascates", "05", "Afogados", "Recife", "PE", "null", "null",  "097.685.344-01"),

("98646372", "Rua Getúlio Vargas", "1124", "Ibura", "Recife", "PE", "null", "null", "322.120.576-04"),

("34526434", "Rua Marechal Brigadeiro", "267", "Caxangá", "Jaboatão dos Guararapes", "PE", "null", "null", "040.340.788-04"),

("46799865", "Rua Castelo Branco", "974", "Água Fria", "Paulista", "PE", "null", "null", "190.433.101-54"),

("76538294", "Avenida Padre de Melo", "540", "Coelhos", "Jaboatão dos Guararapes", "PE", "null", "null", "088.677.556-02"),

("65420876", "Rua Arnaldo Antunes", "143", "Casa Amarela", "Olinda", "PE", "null", "null", "088.454.009-44"),

("56532784", "Rua Caramujo", "583", "Coqueiral", "Recife", "PE", "null", "null", "192.431.156-98"),

("56243789", "Rua Coqueiral", "290", "Dois Unidos", "Paulista", "PE", "null", "null", "611.839.254-50"),

("98706780", "Rua Castelo Encantado", "32", "Barro", "Recife", "PE", "null", "null", "076.890.322-94"),

("65482790", "Rua da Folha", "79", "Areias", "Jaboatão dos Guararapes","PE", "null", "null",  "300.641.345-21"),

("65624353", "Rua São José", "36", "Ilha do Leite", "Abreu e Lima", "PE", "null", "null", "290.566.434-12");


-------------------------------------------- DIAGNOSTICO --------------------------------------------

alter table diagnostico modify column paciente_cpf varchar(14);

insert into diagnostico (laudoMedico, cid, dataDiagnostico, paciente_cpf)
	values 

("Baixa quantidade de hemácias no sangue do paciente", "D46.0", "2021-07-22", "128.221.432-09");

insert into diagnostico (laudoMedico, cid, dataDiagnostico, paciente_cpf)
	values 

("Dermatite alérgica", "L23.6", "2020-02-27", "128.221.432-09"),

("Hepatite B", "B18.0", "2022-04-30", "112.345.678-90"),

("Arritmia Cardíaca", "I49", "2022-09-28", "070.154.874-57"),

("Insuficiência cardíaca", "I50", "2021-08-17", "014.128.358-00"),

("Malformações oculares", "Q15", "2022-09-19", "120.380.134-18"),

("Infecção no pâncreas", "K85", "2022-07-25", "100.300.650-76"),

("Baixa quantidade de hemácias no sangue do paciente", "D46.0", "2021-07-20", "102.406.954-01"),

("Candidíase cutânea", "B37.2", "2021-03-25", "098.765.432-11"),

("Arritmias cardíacas", "I49", "2022-05-14", "112.088.396-02");

insert into diagnostico (laudoMedico, cid, dataDiagnostico, paciente_cpf)
	values 

("Baixa quantidade de hemácias no sangue do paciente", "D46.0", "2022-08-30", "077.188.387-05");



-------------------------------------------- EXAME -----------------------------------------------

alter table exame modify column paciente_cpf varchar(14);

insert into exame (idexame, tipoExame, descricao, dataSolicitacao, dataResultado, paciente_cpf, laboratorio_idlaboratorio) 
	value 
   
("25554", "Ecocardiograma", "Verificação da mobilidade das paredes das cavidades do coração", "2022-08-10", "2021-08-15", "128.221.432-09","52114"),

("25560", "Raspagem", "Avaliação de partículas de pele para identificar inflamações e alergias cutâneas", "2020-02-20", "2020-02-23", "128.221.432-09", "52117"),
    
("25551", "GO", "Avaliação das enzimas do fígado", "2022-04-20", "2022-04-22", "112.345.678-90", "52118"),
    
("25951", "Teste de Ergométrico", "Registro a atividade elétrica do coração durante o esforço físico máximo", "2022-09-24", "2022-10-20", "070.154.874-57", "52116"),
    
("25583", "Hemograma", "Avaliação dos glóbulos hemoglobinas e hemácias.", "2021-07-19", "2022-07-27", "014.128.358-00", "52115"),

("28555", "Mapeamento de retina", "Identifica doenças oculares e as que causam danos oculares", "2022-09-15", "2022-10-15", "120.380.134-18", "52116"),

("25556", "Imunocintilografia", "Avaliar o sistema imunológico", "2022-07-10", "2022-07-12", "100.300.650-76", "52119"),

("25553", "Hemograma", "Avaliação dos glóbulos hemoglobinas e hemácias.", "2021-07-20", "2022-07-29", "102.406.954-01", "52115"),

("45561", "Ecocardiograma", "Mobilidade das paredes das cavidades do coração", "2021-08-24", "2021-08-27", "055.432.798-50", "52114"),

("25552", "Teste de Ergométrico", "Registro a atividade elétrica do coração durante o esforço físico máximo.", "2022-09-23", "2022-09-24", "112.088.396-02", "52114"),

("25100", "Raspagem", "Avaliação de partículas de pele para identificar inflamações e alergias cutâneas", "2021-03-10", "2021-03-13", "098.765.432-11", "52117"),

("25500", "Ecocardiograma", "Mobilidade das paredes das cavidades do coração", "2022-05-04", "2022-05-10", "112.088.387-02", "52114"),

("25953", "Hemograma", "Avaliação dos glóbulos hemoglobinas e hemácias.", "2022-08-30", "2022-09-02", "077.188.387-05", "52115"),

("15551", "Hemograma", "Avaliação dos glóbulos hemoglobinas e hemácias.", "2022-08-30", "2022-09-03", "025.111.287-04", "52115"),

("12552", "Hemograma", "Avaliação dos glóbulos hemoglobinas e hemácias.", "2022-08-30", "2022-09-02", "075.388.096-67", "52115"),

("25961", "Ecocardiograma", "Mobilidade das paredes das cavidades do coração", "2022-05-04", "2022-05-10", "129.915.258-01", "52114"),

("25582", "Teste de Ergométrico", "Registro a atividade elétrica do coração durante o esforço físico máximo.", "2022-09-23", "2022-09-24", "050.811.424-63", "52114"),

("29552", "Teste de Ergométrico", "Registro a atividade elétrica do coração durante o esforço físico máximo.", "2022-09-23", "2022-10-23", "058.995.125-00", "52114"),

("25955", "Mapeamento de retina", "Identifica doenças oculares e as que causam danos oculares", "2022-09-15", "2022-09-17", "524.100.254-08", "52116"),

("25555", "Mapeamento de retina", "Identifica doenças oculares e as que causam danos oculares", "2022-09-15", "2022-09-20", "127.943.234-07", "52116");

----------------------------------------- INSERT INTO SOLICITACAOEXAMES ------------------------------------------

insert into solicitacaoexames (hospital_cnes, laboratorio_idlaboratorio) 
values	

("12345678911", "52114"),
("10572048000", "52114"),
("12345678911", "52115"),
("12345678911", "52116"),
("12345678911", "52117"),
("12345678911", "52118"),
("12345678911", "52115"),
("10572048000", "52115"),
("10572048000", "52116"),
("10572048000", "52117"),
("10572048000", "52118"),
("10572048000", "52119");

-------------------------------------------- INSERT INTO TELEFONE --------------------------------------------

alter table telefone modify column paciente_cpf varchar(14);
alter table telefone modify column medico_cpf varchar(14);
alter table telefone modify column Hospital_cnes varchar(14);

alter table telefone drop column numerotel;
alter table telefone modify column numero varchar(11);

insert into telefone (numero, medico_cpf, paciente_cpf, hospital_cnes, ambulatorio_idambulatorio, laboratorio_idlaboratorio)
	values

("81985944514", "128.221.432-09", "null", "null", "null", "null");

insert into telefone (numero, medico_cpf, paciente_cpf, hospital_cnes, ambulatorio_idambulatorio, laboratorio_idlaboratorio)
	values

("81949157897", "070.154.874-57", "null", "null", "null"),

("8134426069", "null", "120.322.128-14", "null", "null"),

("8132214008", "null", "null", "null", "10572048000409"),

("8135345632", "null", "234.212.786-09", "null", "null"),

("81958544112", "014.128.358-00", "null", "null", "null"),

("8136621445", "null", "041.455.112-85", "null", "null"),

("81987665478", "100.300.650-76", "null", "null", "null"),

("81989874432", "null", "null", "655.209.122-43", "null"),

("81996788433", "null", "null", "322.120.576-04", "null"),

("8124245506", "null", "096.098.342-90", "null", "null"),

("8156547645", "null", "243.165.651-51", "null", "null", "null"),

("81998875801", "112.088.396-02", "null", "null", "null", "null"),

("81987451255", "102.406.954-01", "null", "null", "null", "null"),

("81994560990", "null", "null", "097.685.344-01", "null", "null"),

("81984892212", "null", "null", "190.433.101-54", "null", "null"),

("8109906799", "null", "574.312.721-34", "null", "null", "null"),

("8136562445", "null", "234.112.094-54", "null", "null", "null"),

("8167578564", "null", "275.453.983-37", "null", "null", "null"),

("8132147898", "null", "096.112.341-09", "null", "null", "null"),

("81995567321", "112.345.678-90", "null", "null", "null", 'null'),

("81934563221", "120.380.134-18", "null", "null", "null", "null"),

("81978865475", "055.432.798-50", "null", "null", "null", "null"),

("81933548796", "098.765.432-11", "null", "null", "null", "null"),

("81985622333", "112.088.387-02", "null", "null", "null", "null"),

("81927853467", "077.188.387-05", "null", "null", "null", "null"),

("81934621762", "025.111.287-04", "null", "null", "null", "null"),

("81984512074", "075.388.096-67", "null", "null", "null", "null"),

("81982175463", "129.915.258-01", "null", "null", "null", "null"),

("81982365211", "050.811.424-63", "null", "null", "null", "null"),

("81938762890", "147.645.754-35", "null", "null", "null", "null"),

("81927653891", "058.995.125-00", "null", "null", "null", "null"),

("81984423125", "524.100.254-08", "null", "null", "null", "null"),

("81919785432", "127.943.234-07", "null", "null", "null", "null"),

("8132211596", "null", "012.788.261-05", "null", "null", "null"),

("81987595413", "null", "null", "233.123.554-67", "null", "null"),

("81987536754", "null", "null", "253.120.589-07", "null", "null"),

("81984565213", "null", "null", "100.124.989-02", "null", "null"),

("81986611265", "null", "null", "040.340.788-04", "null", "null"),

("81996772333", "null", "null", "088.677.556-02", "null", "null"),

("81982447890", "null", "null", "088.454.009-44", "null", "null"),

("81985112334", "null", "null", "192.431.156-98", "null", "null"),

("81988900168", "null", "null", "611.839.254-50", "null", "null"),

("81982214565", "null", "null", "076.890.322-94", "null", "null"),

("81985678990", "null", "null", "300.641.345-21", "null", "null"),

("81982115665", "null", "null", "290.566.434-12", "null", "null"),

("81989758675", "234.789.253-41", "null", "null", "null"),

("81984759156", "369.789.119-85", "null", "null", "null"),

("81996651554", "369.101.542-01", "null", "null", "null"),

("8131556422", "null", "null", "null", "null", "52115"),

("8137884212", "null", "null", "null", "null", "52114"),

("8134695441", "null", "null", "null", "null", "52116"),

("8132128774", "null", "null", "null", "null", "52117"),

("8134496544", "null", "null", "null", "null", "52118"),

("8132218551", "null", "null", "null", "null", "52119"),

("81998754546", "null", "null", "null", "21526", "null"),

("81995545655", "null", "null", "null", "24545", "null"),

("81992154545", "null", "null", "null", "22556", "null"),

("81985215432", "null", "null", "null", "21546", "null"),     

("81984545871", "null", "null", "null", "25457", "null"),

("81982548268", "null", "null", "null", "15448", "null");