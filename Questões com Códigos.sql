# WEBQUEST 02

**Curso:** Licenciatura em Ciência da Computação

**Disciplina:** Banco de Dados 

**Professor:** Augusto César Ferreira de Miranda Oliveira

**Título:** Do Modelo Relacional à Consulta: Álgebra Relacional e SQL na Prática

**Integrantes:**
- Murilo Miguel de Lima
- Vinicius Marques Batista
- José Isaac Gouveia Alves

## Questão 01

```sql
CREATE TABLE ALUNO (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    curso_id INT
);

CREATE TABLE MATRICULA_DISCIPLINA (
    aluno_matricula INT,
    disciplina_id INT,
    nota DECIMAL(4,2),
    PRIMARY KEY (aluno_matricula, disciplina_id),
    FOREIGN KEY (aluno_matricula)
        REFERENCES ALUNO(matricula),
    FOREIGN KEY (disciplina_id)
        REFERENCES DISCIPLINA(id)
);
```


## Questão 02

\[
\pi_{nome}(\sigma_{curso\_id=3}(ALUNO))
\]

## Questão 03

```sql
SELECT nome
FROM ALUNO
WHERE curso_id = 3;
```

## Questão 04

\[
\pi_{nome,\ nota}
\left(
ALUNO \bowtie_{matricula=aluno\_matricula}
MATRICULA\_DISCIPLINA
\right)
\]

## Questão 05

```sql
SELECT A.nome AS nome_aluno,
       D.nome_disciplina,
       MD.nota
FROM ALUNO A
INNER JOIN MATRICULA_DISCIPLINA MD
    ON A.matricula = MD.aluno_matricula
INNER JOIN DISCIPLINA D
    ON MD.disciplina_id = D.id
INNER JOIN CURSO C
    ON A.curso_id = C.id
WHERE MD.nota >= 7
ORDER BY A.nome ASC;
```

## Referências

ELMASRI, Ramez; NAVATHE, Shamkant B. *Sistemas de Banco de Dados*. 8. ed. São Paulo: Pearson, 2020.

SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. *Sistemas de Banco de Dados*. 7. ed. Rio de Janeiro: McGraw-Hill, 2020.

RAMAKRISHNAN, Raghu; GEHRKE, Johannes. *Sistemas de Gerenciamento de Banco de Dados*. 3. ed. Rio de Janeiro: Artmed, 2008.
