final criarBanco = [
  '''
    CREATE TABLE entregas(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NULL UNIQUE,
      descricao TEXT NULL UNIQUE
    )
  ''',
  '''
    CREATE TABLE usuario(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NULL UNIQUE,
      usuario TEXT NULL UNIQUE,
      senha TEXT NULL,
      email TEXT NULL UNIQUE, 
      telefone TEXT NULL UNIQUE
  '''
];
