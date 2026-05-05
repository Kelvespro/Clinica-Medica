USE clinica_medica;

-- Inserir especialidades
INSERT INTO especialidade (nome_especialidade, descricao) VALUES
('Cardiologia', 'Saúde do coração'),
('Dermatologia', 'Pele e anexos'),
('Pediatria', 'Saúde infantil'),
('Ortopedia', 'Sistema locomotor'),
('Ginecologia', 'Saúde da mulher');

-- Inserir médicos
INSERT INTO medico (nome, crm, telefone, email, id_especialidade) VALUES
('Dr. João Silva', 'CRM12345', '(11) 99999-8888', 'joao.silva@clinica.com', 1),
('Dra. Maria Souza', 'CRM67890', '(11) 98888-7777', 'maria.souza@clinica.com', 2),
('Dr. Carlos Lima', 'CRM11223', '(11) 97777-6666', 'carlos.lima@clinica.com', 3),
('Dra. Ana Beatriz', 'CRM44556', '(11) 96666-5555', 'ana.beatriz@clinica.com', 4),
('Dr. Roberto Santos', 'CRM77889', '(11) 95555-4444', 'roberto.santos@clinica.com', 5);

-- Inserir pacientes
INSERT INTO paciente (nome, data_nascimento, sexo, telefone, email, endereco, cpf) VALUES
('Ana Oliveira', '1990-05-20', 'F', '(11) 94444-3333', 'ana.oliveira@email.com', 'Rua A, 123 - São Paulo, SP', '123.456.789-00'),
('Bruno Santos', '1985-11-12', 'M', '(11) 93333-2222', 'bruno.santos@email.com', 'Rua B, 456 - São Paulo, SP', '987.654.321-00'),
('Carla Mendes', '1995-03-08', 'F', '(11) 92222-1111', 'carla.mendes@email.com', 'Rua C, 789 - São Paulo, SP', '456.789.123-00'),
('Daniel Ferreira', '1980-07-25', 'M', '(11) 91111-0000', 'daniel.ferreira@email.com', 'Rua D, 101 - São Paulo, SP', '789.123.456-00'),
('Elisa Costa', '1998-12-15', 'F', '(11) 90000-9999', 'elisa.costa@email.com', 'Rua E, 202 - São Paulo, SP', '321.654.987-00');

-- Inserir consultas
INSERT INTO consulta (data_hora, status, motivo, diagnostico, id_paciente, id_medico) VALUES
('2025-02-10 14:30:00', 'realizada', 'Dor no peito e falta de ar', 'Angina estável', 1, 1),
('2025-02-15 09:00:00', 'realizada', 'Erupção cutânea no braço', 'Dermatite de contato', 2, 2),
('2025-02-20 11:30:00', 'realizada', 'Febre e tosse há 3 dias', 'Infecção viral', 3, 3),
('2025-03-01 15:00:00', 'agendada', 'Dor no joelho direito', NULL, 4, 4),
('2025-03-05 10:00:00', 'agendada', 'Consulta de rotina', NULL, 5, 5),
('2025-02-25 16:30:00', 'realizada', 'Enxaqueca frequente', 'Migrânea sem aura', 1, 5),
('2025-02-28 08:30:00', 'cancelada', 'Tontura', NULL, 2, 1);

-- Inserir exames
INSERT INTO exame (nome_exame, data_realizacao, resultado, arquivo_url, id_consulta) VALUES
('Eletrocardiograma', '2025-02-11', 'Normal - Ritmo sinusal', 'exames/ecg_001.pdf', 1),
('Hemograma completo', '2025-02-12', 'Leucócitos elevados', 'exames/hemo_001.pdf', 1),
('Teste alérgico', '2025-02-16', 'Reação positiva ao níquel', 'exames/alergia_001.pdf', 2),
('Raio-X tórax', '2025-02-21', 'Sem alterações significativas', 'exames/rx_001.pdf', 3),
('Ressonância magnética', '2025-02-26', 'Normal', 'exames/rm_001.pdf', 6);

-- Inserir prescrições
INSERT INTO prescricao (medicamento, dosagem, instrucoes, data_prescricao, id_consulta) VALUES
('AAS infantil', '100mg', 'Tomar 1 comprimido ao dia após refeição', '2025-02-10', 1),
('Losartana', '50mg', 'Tomar 1 comprimido pela manhã', '2025-02-10', 1),
('Hidrocortisona creme', '1%', 'Aplicar na região afetada 2x ao dia', '2025-02-15', 2),
('Paracetamol', '500mg', 'Tomar 1 comprimido a cada 6h se dor ou febre', '2025-02-20', 3),
('Dipirona', '500mg', 'Tomar 1 comprimido a cada 6h', '2025-02-20', 3),
('Sumatriptano', '50mg', 'Tomar ao início da crise', '2025-02-25', 6);
