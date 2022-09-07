final criarBanco = [
  '''
    CREATE TABLE entregas(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NULL UNIQUE,
      descricao TEXT NULL UNIQUE
    )
  '''
];
