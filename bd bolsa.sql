create database bolsa

use bolsa

create table usuarios(

codigo int identity(1,1) not null,
nome varchar(100) not null,
cpf varchar(15) not null,
primary key(codigo),

);

create index Ixcpf on usuarios(cpf);

insert into usuarios(nome,cpf) values ('cesar','951.112.126-04')
insert into usuarios(nome,cpf) values ('paulo cesar','951.112.125-04')
insert into usuarios(nome,cpf) values ('jose cesar','951.112.124-04')

create table acoes(

codigo int identity(1,1) not null,
tipo varchar(50) not null,
nome varchar(50) not null,
primary key(codigo),

);

create index Ixtipo on acoes(tipo);
create index Ixnome on acoes(nome);

insert into acoes(tipo,nome) values('preferencial','petr01')
insert into acoes(tipo,nome) values('ordinaria','vale05')
insert into acoes(tipo,nome) values('preferencial','milk01')

create table acoesxusuarios(

codigo int identity(1,1) not null,
usuario int not null,
acao int not null,
data datetime not null,
quant int,
primary key(codigo),
foreign key (usuario) references usuarios(codigo),
foreign key (acao) references acoes(codigo),

);

create index Ixdata on acoesxusuarios(data);

insert into acoesxusuarios(usuario,acao,data,quant) values(1,1,'2012/03/18',1000)
insert into acoesxusuarios(usuario,acao,data,quant) values(2,2,'2012/03/18',2000)
insert into acoesxusuarios(usuario,acao,data,quant) values(3,3,'2012/03/18',3000)

create table transacoes(

codigo int identity(1,1) not null,
acao int not null,
usuario int not null,
origem int,
situacao bit,
data datetime not null,
quant int not null,
tipo bit not null,
valor_unitario decimal(8,2) not null,
primary key(codigo),
foreign key(acao) references acoes(codigo),
foreign key(usuario) references usuarios(codigo),

);

create index Ixdata on transacoes(data);

insert into transacoes(acao,usuario,situacao,data,quant,tipo,valor_unitario) values(1,1,0,'2012/03/10',100,0,1.70)
insert into transacoes(acao,usuario,situacao,data,quant,tipo,valor_unitario) values(2,2,0,'2012/03/11',150,0,1.78)
insert into transacoes(acao,usuario,situacao,data,quant,tipo,valor_unitario) values(3,3,0,'2012/03/09',105,0,1.79)

insert into transacoes(acao,usuario,origem,situacao,data,quant,tipo,valor_unitario) values(2,1,1,0,'2012/03/18',10,1,1.99)
insert into transacoes(acao,usuario,origem,situacao,data,quant,tipo,valor_unitario) values(1,2,2,0,'2012/03/18',100,1,2.85)
insert into transacoes(acao,usuario,origem,situacao,data,quant,tipo,valor_unitario) values(2,3,3,0,'2012/03/18',120,1,2.88)

insert into transacoes(acao,usuario,origem,situacao,data,quant,tipo,valor_unitario) values(1,1,1,1,'2012/03/10',10,1,1.60)
insert into transacoes(acao,usuario,origem,situacao,data,quant,tipo,valor_unitario) values(2,2,2,1,'2012/03/11',10,1,1.90)
insert into transacoes(acao,usuario,origem,situacao,data,quant,tipo,valor_unitario) values(3,3,3,1,'2012/03/13',10,1,1.80)

create view precomedio as
select t.data as data,a.nome as acao,AVG(t.valor_unitario) as media
from transacoes as t join acoes as a on t.acao = a.codigo
where t.tipo = 1
group by a.nome, t.data


select *from precomedio where data = '2012/03/18'















