-- 1. Identificar alunos com matrícula vencida nos últimos 30 dias.

select alunos.id, alunos.nome, alunos.email 
from alunos
join matriculas on matriculas.id_aluno = alunos.id
where matriculas.data_fim between current_date - interval '30 days' and current_date 
and matriculas.status = 'ativa'
and alunos.ativo 
order by alunos.nome asc


-- 2. Listar os alunos que optaram por renovação automática.

select alunos.id, alunos.nome, alunos.email, cursos.nome
from alunos
join matriculas on matriculas.id_aluno = alunos.id
left join cursos on cursos.id = matriculas.id_curso 
where matriculas.renovacao_automatica
and matriculas.status <> 'encerrada'
and alunos.ativo 
order by alunos.nome asc


-- 3. Verificar cursos que têm inadimplência acima de 20%.

select cursos.id, cursos.nome
from cursos
join matriculas on matriculas.id_curso = cursos.id 
join pagamentos on pagamentos.id_matricula = matriculas.id 
group by cursos.id, cursos.nome 
having sum(case when pagamentos.status = 'recusado' then 1 else 0 end) > (count(pagamentos.id) * 0.2)