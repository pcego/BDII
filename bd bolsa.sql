create database bolsa

use bolsa

create table usuarios(

codigo int identity(1,1) not null,
nome varchar(100) not null,
cpf varchar(15) not null,
primary key(codigo),

);

create index Ixcpf on usuarios(cpf);

create table acoes(

codigo int identity(1,1) not null,
tipo varchar(50) not null,
nome varchar(50) not null,
primary key(codigo),

);

create index Ixtipo on acoes(tipo);
create index Ixnome on acoes(nome);

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





