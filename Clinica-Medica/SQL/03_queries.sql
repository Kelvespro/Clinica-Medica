USE clinica_medica;

-- 1. Histórico completo de consultas de um paciente específico
SELECT p.nome AS paciente, c.data_hora, c.motivo, c.diagnostico, 
       m.nome AS medico, e.nome_especialidade AS especialidade
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico
JOIN especialidade e ON m.id_especialidade = e.id_especialidade
WHERE p.id_paciente = 1
ORDER BY c.data_hora DESC;

-- 2. Exames realizados em uma consulta específica
SELECT c.data_hora, c.motivo, e.nome_exame, e.data_realizacao, e.resultado
FROM exame e
JOIN consulta c ON e.id_consulta = c.id_consulta
WHERE c.id_consulta = 1;

-- 3. Prescrições de um paciente (via consultas)
SELECT p.nome AS paciente, c.data_hora, pr.medicamento, pr.dosagem, pr.instrucoes
FROM prescricao pr
JOIN consulta c ON pr.id_consulta = c.id_consulta
JOIN paciente p ON c.id_paciente = p.id_paciente
WHERE p.id_paciente = 1
ORDER BY c.data_hora DESC;

-- 4. Agenda de consultas de um médico 
SELECT m.nome AS medico, c.data_hora, p.nome AS paciente, c.motivo, c.status
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico
WHERE m.id_medico = 1 AND c.data_hora >= NOW()
ORDER BY c.data_hora;

-- 5. Relatório de médicos por especialidade
SELECT e.nome_especialidade, m.nome AS medico, m.crm, m.telefone
FROM medico m
JOIN especialidade e ON m.id_especialidade = e.id_especialidade
ORDER BY e.nome_especialidade, m.nome;

-- 6. Quantidade de consultas por paciente
SELECT p.nome, COUNT(c.id_consulta) AS total_consultas,
       SUM(CASE WHEN c.status = 'realizada' THEN 1 ELSE 0 END) AS consultas_realizadas,
       SUM(CASE WHEN c.status = 'cancelada' THEN 1 ELSE 0 END) AS consultas_canceladas
FROM paciente p
LEFT JOIN consulta c ON p.id_paciente = c.id_paciente
GROUP BY p.id_paciente
ORDER BY total_consultas DESC;
