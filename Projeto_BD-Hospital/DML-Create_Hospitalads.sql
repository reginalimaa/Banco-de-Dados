
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hospitalads
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hospitalads` DEFAULT CHARACTER SET utf8 ;

CREATE SCHEMA IF NOT EXISTS `hospitalads` DEFAULT CHARACTER SET utf8mb3 ;
USE `Hospitalads` ;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Hospital` (
  `cnes` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`cnes`),
  UNIQUE INDEX `cnes_UNIQUE` (`cnes` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Medico` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `crm` VARCHAR(13) NOT NULL,
  `especialiade` VARCHAR(45) NOT NULL,
  `dataatendiemento` DATETIME NOT NULL,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `crm_UNIQUE` (`crm` ASC) VISIBLE,
  INDEX `fk_Medico_Hospital1_idx` (`Hospital_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Hospital1`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `mydb`.`Hospital` (`cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Ambulatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Ambulatorio` (
  `idAmbulatorio` INT NOT NULL,
  `especializacao` VARCHAR(45) NULL,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  `horarioFuncionamenento` DATETIME NULL,
  PRIMARY KEY (`idAmbulatorio`),
  UNIQUE INDEX `idAmbulatorio_UNIQUE` (`idAmbulatorio` ASC) VISIBLE,
  INDEX `fk_Ambulatorio_Hospital_idx` (`Hospital_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Ambulatorio_Hospital`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `mydb`.`Hospital` (`cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Paciente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `nomeSocial` VARCHAR(120) NULL,
  `dataNas` DATE NOT NULL,
  `tipoSang` VARCHAR(3) NULL,
  `sexo` VARCHAR(20) NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_Paciente_Ambulatorio1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `mydb`.`Ambulatorio` (`idAmbulatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Diagnostico` (
  `idDiagnostico` INT NOT NULL AUTO_INCREMENT,
  `laudoMedico` VARCHAR(300) NOT NULL,
  `cid` VARCHAR(15) NULL,
  `dataDiagnostico` DATETIME NOT NULL,
  `Paciente_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idDiagnostico`),
  INDEX `fk_Diagnostico_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Diagnostico_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `Hospitalads`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Laboratorio` (
  `idLaboratorio` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `horaFuncionamento` DATETIME NOT NULL,
  `local` VARCHAR(45) NULL,
  PRIMARY KEY (`idLaboratorio`),
  UNIQUE INDEX `idLaboratorio_UNIQUE` (`idLaboratorio` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Exame` (
  `idExame` INT NOT NULL,
  `tipoExame` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(300) NULL,
  `dataSolicitacao` DATETIME NOT NULL,
  `dataResultado` DATETIME NOT NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `Laboratorio_idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`idExame`),
  UNIQUE INDEX `idExame_UNIQUE` (`idExame` ASC) VISIBLE,
  INDEX `fk_Exame_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Exame_Laboratorio1_idx` (`Laboratorio_idLaboratorio` ASC) VISIBLE,
  CONSTRAINT `fk_Exame_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `Hospitalads`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame_Laboratorio1`
    FOREIGN KEY (`Laboratorio_idLaboratorio`)
    REFERENCES `Hospitalads`.`Laboratorio` (`idLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`PessoalDeApoio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`PessoalDeApoio` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataAdm` VARCHAR(45) NOT NULL,
  `dataNas` DATE NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `funcao` VARCHAR(80) NOT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_PessoalDeApoio_Ambulatorio1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  CONSTRAINT `fk_PessoalDeApoio_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `Hospitalads`.`Ambulatorio` (`idAmbulatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Telefone` (
  `numero` INT NOT NULL,
  `Telefonecol` VARCHAR(14) NOT NULL,
  `Medico_cpf` VARCHAR(14) NOT NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  `Laboratorio_idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_Telefone_Medico1_idx` (`Medico_cpf` ASC) VISIBLE,
  INDEX `fk_Telefone_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Telefone_Hospital1_idx` (`Hospital_cnes` ASC) VISIBLE,
  INDEX `fk_Telefone_Ambulatorio1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  INDEX `fk_Telefone_Laboratorio1_idx` (`Laboratorio_idLaboratorio` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Medico1`
    FOREIGN KEY (`Medico_cpf`)
    REFERENCES `Hospitalads`.`Medico` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `Hospitalads`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Hospital1`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `Hospitalads`.`Hospital` (`cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `Hospitalads`.`Ambulatorio` (`idAmbulatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Laboratorio1`
    FOREIGN KEY (`Laboratorio_idLaboratorio`)
    REFERENCES `Hospitalads`.`Laboratorio` (`idLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NOT NULL,
  `logradouro` VARCHAR(80) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `bairro` VARCHAR(80) NOT NULL,
  `cidade` VARCHAR(80) NOT NULL,
  `estado` VARCHAR(2) NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `PessoalDeApoio_cpf` VARCHAR(14) NOT NULL,
  `Medico_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Endereco_PessoalDeApoio1_idx` (`PessoalDeApoio_cpf` ASC) VISIBLE,
  INDEX `fk_Endereco_Medico1_idx` (`Medico_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `Hospitalads`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_PessoalDeApoio1`
    FOREIGN KEY (`PessoalDeApoio_cpf`)
    REFERENCES `Hospitalads`.`PessoalDeApoio` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Medico1`
    FOREIGN KEY (`Medico_cpf`)
    REFERENCES `Hospitalads`.`Medico` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`Consulta` (
  `idConsulta` VARCHAR(45) NOT NULL,
  `Medico_cpf` VARCHAR(14) NOT NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `dataConsulta` DATETIME NOT NULL,
  `parecer` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Medico_cpf`, `Paciente_cpf`, `idConsulta`),
  INDEX `fk_Medico_has_Paciente_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Medico_has_Paciente_Medico1_idx` (`Medico_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_has_Paciente_Medico1`
    FOREIGN KEY (`Medico_cpf`)
    REFERENCES `Hospitalads`.`Medico` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medico_has_Paciente_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `Hospitalads`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospitalads`.`SolicitacaoExames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospitalads`.`SolicitacaoExames` (
  `id.exame` INT NOT NULL AUTO_INCREMENT,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  `Laboratorio_idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`id.exame`, `Hospital_cnes`, `Laboratorio_idLaboratorio`),
  INDEX `fk_Hospital_has_Laboratorio_Laboratorio1_idx` (`Laboratorio_idLaboratorio` ASC) VISIBLE,
  INDEX `fk_Hospital_has_Laboratorio_Hospital1_idx` (`Hospital_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Hospital_has_Laboratorio_Hospital1`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `Hospitalads`.`Hospital` (`cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospital_has_Laboratorio_Laboratorio1`
    FOREIGN KEY (`Laboratorio_idLaboratorio`)
    REFERENCES `Hospitalads`.`Laboratorio` (`idLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `hospitalads` ;

-- -----------------------------------------------------
-- Table `hospitalads`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`hospital` (
  `cnes` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`cnes`),
  UNIQUE INDEX `cnes_UNIQUE` (`cnes` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`ambulatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`ambulatorio` (
  `idAmbulatorio` INT NOT NULL,
  `especializacao` VARCHAR(45) NULL DEFAULT NULL,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  `horarioFuncionamenento` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`idAmbulatorio`),
  UNIQUE INDEX `idAmbulatorio_UNIQUE` (`idAmbulatorio` ASC) VISIBLE,
  INDEX `fk_Ambulatorio_Hospital_idx` (`Hospital_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Ambulatorio_Hospital`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `hospitalads`.`hospital` (`cnes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`medico` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `crm` VARCHAR(13) NOT NULL,
  `especialiade` VARCHAR(45) NOT NULL,
  `dataAtendimento` DATETIME NOT NULL,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `crm_UNIQUE` (`crm` ASC) VISIBLE,
  INDEX `fk_Medico_Hospital1_idx` (`Hospital_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Hospital1`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `hospitalads`.`hospital` (`cnes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`paciente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `nomeSocial` VARCHAR(120) NULL DEFAULT NULL,
  `dataNas` DATE NOT NULL,
  `tipoSang` VARCHAR(3) NULL DEFAULT NULL,
  `sexo` VARCHAR(20) NULL DEFAULT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_Paciente_Ambulatorio1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `hospitalads`.`ambulatorio` (`idAmbulatorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`consulta` (
  `idConsulta` VARCHAR(45) NOT NULL,
  `Medico_cpf` VARCHAR(11) NOT NULL,
  `Paciente_cpf` VARCHAR(11) NOT NULL,
  `dataConsulta` DATETIME NOT NULL,
  `parecer` VARCHAR(200) NOT NULL,
  `presencaPaciente` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`Medico_cpf`, `Paciente_cpf`, `idConsulta`),
  INDEX `fk_Medico_has_Paciente_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Medico_has_Paciente_Medico1_idx` (`Medico_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_has_Paciente_Medico1`
    FOREIGN KEY (`Medico_cpf`)
    REFERENCES `hospitalads`.`medico` (`cpf`),
  CONSTRAINT `fk_Medico_has_Paciente_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `hospitalads`.`paciente` (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`diagnostico` (
  `idDiagnostico` INT NOT NULL AUTO_INCREMENT,
  `laudoMedico` VARCHAR(300) NOT NULL,
  `cid` VARCHAR(15) NULL DEFAULT NULL,
  `dataDiagnostico` DATETIME NOT NULL,
  `Paciente_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idDiagnostico`),
  INDEX `fk_Diagnostico_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Diagnostico_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `hospitalads`.`paciente` (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`pessoaldeapoio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`pessoaldeapoio` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataAdm` VARCHAR(45) NOT NULL,
  `dataNas` DATE NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `funcao` VARCHAR(80) NOT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_PessoalDeApoio_Ambulatorio1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  CONSTRAINT `fk_PessoalDeApoio_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `hospitalads`.`ambulatorio` (`idAmbulatorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NOT NULL,
  `logradouro` VARCHAR(80) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `bairro` VARCHAR(80) NOT NULL,
  `cidade` VARCHAR(80) NOT NULL,
  `estado` VARCHAR(2) NULL DEFAULT NULL,
  `Paciente_cpf` VARCHAR(11) NOT NULL,
  `PessoalDeApoio_cpf` VARCHAR(11) NOT NULL,
  `Medico_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Endereco_PessoalDeApoio1_idx` (`PessoalDeApoio_cpf` ASC) VISIBLE,
  INDEX `fk_Endereco_Medico1_idx` (`Medico_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Medico1`
    FOREIGN KEY (`Medico_cpf`)
    REFERENCES `hospitalads`.`medico` (`cpf`),
  CONSTRAINT `fk_Endereco_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `hospitalads`.`paciente` (`cpf`),
  CONSTRAINT `fk_Endereco_PessoalDeApoio1`
    FOREIGN KEY (`PessoalDeApoio_cpf`)
    REFERENCES `hospitalads`.`pessoaldeapoio` (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`laboratorio` (
  `idLaboratorio` INT NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `horaFuncionamento` TIME NULL DEFAULT NULL,
  `local` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idLaboratorio`),
  UNIQUE INDEX `idLaboratorio_UNIQUE` (`idLaboratorio` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`exame` (
  `idExame` INT NOT NULL,
  `tipoExame` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(300) NULL DEFAULT NULL,
  `dataSolicitacao` DATETIME NOT NULL,
  `dataResultado` DATETIME NOT NULL,
  `Paciente_cpf` VARCHAR(11) NOT NULL,
  `Laboratorio_idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`idExame`),
  UNIQUE INDEX `idExame_UNIQUE` (`idExame` ASC) VISIBLE,
  INDEX `fk_Exame_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Exame_Laboratorio1_idx` (`Laboratorio_idLaboratorio` ASC) VISIBLE,
  CONSTRAINT `fk_Exame_Laboratorio1`
    FOREIGN KEY (`Laboratorio_idLaboratorio`)
    REFERENCES `hospitalads`.`laboratorio` (`idLaboratorio`),
  CONSTRAINT `fk_Exame_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `hospitalads`.`paciente` (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`solicitacaoexames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`solicitacaoexames` (
  `id.exame` INT NOT NULL AUTO_INCREMENT,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  `Laboratorio_idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`id.exame`, `Hospital_cnes`, `Laboratorio_idLaboratorio`),
  INDEX `fk_Hospital_has_Laboratorio_Laboratorio1_idx` (`Laboratorio_idLaboratorio` ASC) VISIBLE,
  INDEX `fk_Hospital_has_Laboratorio_Hospital1_idx` (`Hospital_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Hospital_has_Laboratorio_Hospital1`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `hospitalads`.`hospital` (`cnes`),
  CONSTRAINT `fk_Hospital_has_Laboratorio_Laboratorio1`
    FOREIGN KEY (`Laboratorio_idLaboratorio`)
    REFERENCES `hospitalads`.`laboratorio` (`idLaboratorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `hospitalads`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalads`.`telefone` (
  `numero` INT NOT NULL,
  `Medico_cpf` VARCHAR(11) NOT NULL,
  `Paciente_cpf` VARCHAR(11) NOT NULL,
  `Hospital_cnes` VARCHAR(11) NOT NULL,
  `Ambulatorio_idAmbulatorio` INT NOT NULL,
  `Laboratorio_idLaboratorio` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_Telefone_Medico1_idx` (`Medico_cpf` ASC) VISIBLE,
  INDEX `fk_Telefone_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Telefone_Hospital1_idx` (`Hospital_cnes` ASC) VISIBLE,
  INDEX `fk_Telefone_Ambulatorio1_idx` (`Ambulatorio_idAmbulatorio` ASC) VISIBLE,
  INDEX `fk_Telefone_Laboratorio1_idx` (`Laboratorio_idLaboratorio` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_idAmbulatorio`)
    REFERENCES `hospitalads`.`ambulatorio` (`idAmbulatorio`),
  CONSTRAINT `fk_Telefone_Hospital1`
    FOREIGN KEY (`Hospital_cnes`)
    REFERENCES `hospitalads`.`hospital` (`cnes`),
  CONSTRAINT `fk_Telefone_Laboratorio1`
    FOREIGN KEY (`Laboratorio_idLaboratorio`)
    REFERENCES `hospitalads`.`laboratorio` (`idLaboratorio`),
  CONSTRAINT `fk_Telefone_Medico1`
    FOREIGN KEY (`Medico_cpf`)
    REFERENCES `hospitalads`.`medico` (`cpf`),
  CONSTRAINT `fk_Telefone_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `hospitalads`.`paciente` (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Alterações
-- -----------------------------------------------------
drop view consultas;
drop table diagnostico;
alter table Medico modify column cpf varchar(14);
alter table medico add column Salario double after nome;
alter table consulta add column presencaPaciente boolean after dataconsulta;
alter table ambulatorio modify column horarioFuncionamenento time;
alter table laboratorio modify column horaFuncionamento time;
alter table endereco modify column Paciente_cpf varchar(14);
alter table endereco drop column paciente_cpf;
alter table medico rename column dataatendiemento to dataAtendimento;
alter table telefone drop column Telefonecol;

update telefone 
set numero = 81988471644
where medico_cpf = 128.221.432-09

update laboratorio 
set horariofuncionamento = 14:00:00
where id_laboratorio = 52114

update medico 
set dataatendimento = 2022-10-21
where cpf = 120.322.128-14

update hospital 
set email = hospital@proffarias.br
where cnes = 10572048000

update pessoalapoio 
set fucao = ‘Enfermeiro Chefe’
where cpf = ‘040.340.788-04’ 

update exame 
set tipoexame = ‘null’
where id_exame = ‘25554’

drop table diagnostico;
alter table medico drop column dataatendimento;
alter table paciente drop column dataNas;
