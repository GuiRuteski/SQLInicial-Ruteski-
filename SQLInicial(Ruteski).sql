create database oficinafitaRuteski;

use oficinafitaRuteski;

CREATE TABLE cidade( 
	idcidade int not null identity(1,1),
	nomecidade varchar(80) not null,
	CONSTRAINT pk_cidade PRIMARY KEY (idcidade)
);

CREATE TABLE cliente( 
	idcliente int not null identity(1,1),
	nomecliente varchar(80) not null,
	dataNasc date not null,
	idcidade int not null
	CONSTRAINT pk_cliente PRIMARY KEY (idcliente),
	CONSTRAINT fk_cliente_cidade FOREIGN KEY(idcidade) REFERENCES cidade(idcidade)
);

CREATE TABLE produto( 
	idproduto int not null identity(1,1),
	descricao varchar(80) not null,
	qtde numeric(15,2) not null,
	preco numeric(15,2) not null,
	CONSTRAINT pk_produto PRIMARY KEY (idproduto)
);

CREATE TABLE venda(
    numvenda int not null identity(1,1),
    datavenda date,
    idcliente int not null,
    CONSTRAINT pk_venda PRIMARY KEY (numvenda),
    CONSTRAINT fk_cliente_venda FOREIGN KEY (idcliente)
        REFERENCES cliente (idcliente),
);

CREATE TABLE itemvenda(
    numvenda integer NOT NULL,
    idproduto integer NOT NULL,
    quantidade numeric(15,2) NOT NULL,
    precounitario numeric(15,2) NOT NULL,
    CONSTRAINT pk_itemvenda PRIMARY KEY (numvenda, idproduto),
    CONSTRAINT fk_produto_itemvenda FOREIGN KEY (idproduto)
        REFERENCES produto (idproduto),
    CONSTRAINT fk_venda_itemvenda FOREIGN KEY (numvenda)
        REFERENCES venda (numvenda),
);

INSERT INTO cidade(nomecidade) VALUES ('Santos'), ('Jales'), ('Lins'), ('Ja�');

INSERT INTO cliente(nomecliente, datanasc, idcidade) 
		VALUES ('Luciano de Barros', '1977-05-13', 2),
			 ('Jo�o da Silva', '1985-11-25', 1),                           				 
			('Jos� da Oliveira', '2005-12-07', 4),
			 ('Paulo Santos', '1944-11-25', 1);

INSERT INTO produto(descricao, qtde, preco) 
		VALUES ('Tenis Nike', 200, 856.98),
			 ('Sapato Social', 325, 152.69),
			 ('Rider', 258, 69.78),
			 ('Havaiana', 256, 35.12);

INSERT INTO venda(datavenda, idcliente) 
		VALUES ('1977-05-13', 1),
			 ('1985-11-25', 2),                           				 		 
			('2005-12-07', 4),
			 ('1944-11-25', 4);

INSERT INTO itemvenda(idproduto, numvenda, quantidade, precounitario) 
		VALUES (1, 2, 2, 856.98),
			 (2, 2, 2, 152.69),
			(2, 3, 1, 69.78),
			 (2, 4, 1, 35.12);

			 select * from cliente;

			 select cliente.nomecliente,cidade.nomecidade
			 from cliente, cidade
			 where cliente.idcidade = cidade.idcidade

			  select * from venda;

			 select venda.datavenda,cliente.nomecliente
			 from venda, cliente
			 where venda.idcliente = venda.idcliente


			 select * from cliente;

			 select cli.nomecliente, cid.nomecidade
			 from cliente cli
			 inner join cidade cid on cid.idcidade = cli.idcidade
			 where cli.nomecliente like 'Luciano%'

			 select * from cliente;

			 select cli.nomecliente, cid.nomecidade
			 from cliente cli
			 left join cidade cid on cid.idcidade = cli.idcidade
			 where cli.nomecliente like 'Luciano%'

			 /*ou colocar inveso no from para come�ar o codigo pela cidade e vai ficar null em nome*/

			 select cli.nomecliente, cid.nomecidade
			 from cidade cid
			 right join cliente cli on cid.idcidade = cli.idcidade
			 
			 select cli.nomecliente, pro.descricao
			 from cliente cli
			 inner join venda ven on cli.idcliente = ven.idcliente
			 inner join itemvenda it on it.numvenda = ven.numvenda
			 inner join produto pro on it.idproduto = pro.idproduto
			



