create database if not exists tudo_sobre_livros;
use tudo_sobre_livros;

create table if not exists usuario(
		codigo int primary key auto_increment,
	nome varchar (30) not null,
    nascimento date not null,
    sexo enum('F','M') not null,
    email varchar(30) not null unique key,
    livro_codigo int not null,
    constraint fk_livro_codigo foreign key (livro_codigo) references usuario(codigo)
    );

create table if not exists livro (
		codigo int primary key auto_increment,
    titulo varchar(30) not null,
    subtitulo varchar(15),
    descricao longtext not null,
    categoria varchar(10),
    genero varchar (10),
    publicacao date,
    local_de_publicacao varchar(20),
    autor varchar(30) not null,
    editora varchar(15) not null
    );

create table if not exists autor(
		codigo smallint primary key auto_increment,
	nome varchar(30) not null,
     nascimento date not null,
    sexo enum('F','M') not null,
    obras_publicadas tinyint not null,
    nacionalidade varchar(15) not null,
    historia longtext not null
    );

create table if not exists editora(
		codigo int primary key auto_increment,
        nome varchar(15) not null,
        fundacao date not null,
        obras_publicadas tinyint not null,
        autores_publicados tinyint not null
);


        
create table if not exists livro_escritos(
		livro_codigo int not null,
        autor_codigo smallint not null,
        primary key (livro_codigo,autor_codigo),
        constraint fk_livro_has_autor_autor1_idx foreign key (autor_codigo) references autor(codigo),
        constraint fk_livro_has_autor_livro1_idx foreign key (livro_codigo) references livro(codigo)
);

create table if not exists obras(
		livro_codigo int not null,
        editora_codigo int not null,
        ano_de_publicacao year not null,
        primary key (livro_codigo,editora_codigo),
        constraint fk_livro_has_editora_editora1_idx foreign key (editora_codigo) references editora(codigo),
        constraint fk_livro_has_editora_livro1_idx foreign key (livro_codigo) references livro(codigo)
        );

create table if not exists contratos(
	autor_codigo smallint not null,
    editora_codigo int not null,
    primary key (autor_codigo,editora_codigo),
    constraint fk_autor_has_editora_editora1_idx foreign key (editora_codigo) references editora(codigo),
    constraint fk_autor_has_editora_autor1_idx foreign key (autor_codigo) references autor(codigo)
);