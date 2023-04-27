# Resolução do trabalho prático módulo 1 

## O problema
Empresa de seguros de automóveis:

Uma empresa deseja controlar via sistema suas atividades e contratou a sua empresa para desenhar a arquitetura de banco. Portanto, considere os aspectos abaixo:

Cada cliente possui CPF, nome, sexo, endereço e telefones de contato (celular e fixo), mas podem vir a ter outros telefones no futuro.

Os carros possuem uma placa, marca, modelo, ano, chassi e cor. Cada carro tem determinado número de sinistros de acidentes associados a ele, sabendo que pode ter ocorrido múltiplos acidentes ou nenhum

Já os sinistros devem ser identificados por um código único, data de ocorrência, hora de ocorrência, local de ocorrência (Endereço completo) e condutor, que pode ou não ser o titular da apólice e precisa ser devidamente registrado no sistema. Além disso, o sinistro possui um tipo de ocorrência (Colisão, Roubo ou Furto, Incêndio, Enchente, Retrovisor, dentre outros).

Um cliente ou pessoa pode ter várias apólices (mínimo uma) vigentes ou nenhuma, e cada apólice de seguro tem um identificador único e só pertence a um cliente e a somente um carro, mas pode ter vários condutores vinculados, e tem data de início e fim da vigência, valor total assegurado e valor franquia associados a ela.

É importante saber que o carro pode ter várias apólices vinculadas a ele, mas apenas uma vigente.

E sempre que houver um sinistro é preciso saber qual o carro envolvido, além do número da apólice, uma vez que este precisa ser assegurado por uma apólice. Mesmo que o atendimento seja para terceiros vai ser registrado no sinistro do carro vinculado à apólice da empresa em questão.

Com base neste enunciado, crie o DER, com as entidades, relacionamentos e restrições.

## Resolução

### 1 - Identificando entidades e atributos
Cliente - CPF, nome, sexo, endereço (composto: bairro,cidade e rua), telefone (multivalorado: telefone fixo e contato)
Carros -  placa, modelo, ano, chassi, cor
Sinistros - código único, data de ocorrência, hora de ocorrência, local de ocorrência (Endereço completo)  condutor e tipo de ocorência
Local de ocorrência é composto - Barrio, cidade e rua
Apólice - id, cliente, carro, data de início e fim da vigência, valor total assegurado e valor franquia.

## 2 - Identificando relacionamentos
Cliente (1,1) - tem -> (0,N) Apólices
Carros (1,1) - tem ->(0,N) Apólices
Sinistro (0,1) - possui -> (1,1) Apólices
Sinistro (0,1) - possui -> (1,1) Carros 

## 3 - Modelo conceitual 

Figura 1 - Modelo conceitual da seguradora.
![Modelo Conceitual](https://i.imgur.com/rsRvDsO.jpg)

## 4 - Modelo Lógico
Figura 2 - Modelo lógico da seguradora.
![Modelo lógico](https://i.imgur.com/vEAOfBl.jpg)


## 5 - Modelo físico
Figura 3 - Modelo físico da seguradora.
![Modelo físico](https://i.imgur.com/A6PwiiQ.jpg)
