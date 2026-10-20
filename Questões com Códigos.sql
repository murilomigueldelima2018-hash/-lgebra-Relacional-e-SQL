# WEBQUEST 02

**Curso:** Licenciatura em Ciência da Computação  
**Disciplina:** Banco de Dados – 60h  
**Professor:** Augusto César Ferreira de Miranda Oliveira

**Título: Do Modelo Relacional à Consulta: Álgebra Relacional e SQL na Prática**

**Integrantes:**
- Murilo Miguel de Lima
- [Vinicius Marques Batista]
- [José Isaac Gouveia Alves]

## Questão 01

```sql
CREATE TABLE ALUNO (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    identificador_curso INT
);

CREATE TABLE MATRICULA_DISCIPLINA (
    matricula_aluno INT,
    identificador_disciplina INT,
    nota DECIMAL(4,2),
    PRIMARY KEY (matricula_aluno, identificador_disciplina),
    FOREIGN KEY (matricula_aluno)
        REFERENCES ALUNO(matricula),
    FOREIGN KEY (identificador_disciplina)
        REFERENCES DISCIPLINA(id)
);
```

## Questão 02

\[
\pi_{nome}(\sigma_{identificador\_curso=3}(ALUNO))
\]

## Questão 03

```sql
SELECT nome
FROM ALUNO
WHERE identificador_curso = 3;
```

## Questão 04

\[
\pi_{nome,\ nota}
(ALUNO \bowtie_{matricula=matricula\_aluno}
MATRICULA\_DISCIPLINA)
\]

## Questão 05

```sql
SELECT A.nome AS nome_aluno,
       D.nome_disciplina,
       MD.nota
FROM ALUNO A
INNER JOIN MATRICULA_DISCIPLINA MD
    ON A.matricula = MD.matricula_aluno
INNER JOIN DISCIPLINA D
    ON MD.identificador_disciplina = D.id
INNER JOIN CURSO C
    ON A.identificador_curso = C.id
WHERE MD.nota >= 7
ORDER BY A.nome ASC;
```

## Referências

ELMASRI, Ramez; NAVATHE, Shamkant B. *Sistemas de Banco de Dados*. 8. ed. São Paulo: Pearson, 2020.

SILBERSCHATZ, Abraham; KORTH, Henry F.; SUDARSHAN, S. *Sistemas de Banco de Dados*. 7. ed. Rio de Janeiro: McGraw-Hill, 2020.
