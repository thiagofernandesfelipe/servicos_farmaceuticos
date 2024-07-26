CREATE TABLE servico_farmaceutico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    farmaceutico VARCHAR(100),
    paciente VARCHAR(100),
    obs TEXT,
    valor_total DECIMAL(10, 2)
);

create table servico_procedimentos (
    id_servico INT,
    id_procedimento INT,
    descricao VARCHAR(100),
    valor DECIMAL(10,2),
    primary key (id_servico, id_procedimento),
    foreign key (id_servico) references servico_farmaceutico (id_servico)
)
