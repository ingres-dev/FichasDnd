INSERT INTO Magias (id, nome, circulo, dano, descricao) VALUES 
(1, 'Mísseis Mágicos', 1, '3d4+3', 'Você cria três dardos brilhantes de força mágica. Cada dardo atinge uma criatura à sua escolha que você possa ver dentro do alcance. Cada dardo causa 1d4+1 de dano de força.'),
(2, 'Bola de Fogo', 3, '8d6', 'Um feixe brilhante salta do seu dedo indicador para um ponto que você escolher dentro do alcance e então explode com um estalo baixo em uma onda de chamas. Cada criatura numa esfera de 6 metros de raio deve fazer um teste de Destreza.'),
(3, 'Explosão Arcana', 0, '1d10', 'Um raio de energia estalante vai em direção a uma criatura dentro do alcance. Faça um ataque à distância contra o alvo. Se atingir, o alvo sofre 1d10 de dano de força.'),
(4, 'Curar Ferimentos', 1, '1d8+MOD', 'Uma criatura que você tocar recupera uma quantidade de pontos de vida igual a 1d8 + seu modificador de atributo de conjuração. Esta magia não tem efeito em mortos-vivos ou construtos.');

INSERT INTO Classes (id, nome, dados_vida) VALUES 
(1, 'Bárbaro', 12),
(2, 'Bardo', 8),
(3, 'Bruxo', 8),
(4, 'Clerigo', 8),
(5, 'Druida', 8),
(6, 'Feiticeiro', 6),
(7, 'Guardião', 10),
(8, 'Guerreiro', 10),
(9, 'Ladino', 8),
(10, 'Mago', 6),
(11, 'Monge', 8),
(12, 'Paladino', 10);

INSERT INTO Idiomas (id, nome) VALUES 
(1, 'Comum'),
(2, 'Anão'),
(3, 'Élfico'),
(4, 'Trap'),
(5, 'Língua de Sinais Comum'),
(6, 'Dracônico'),
(7, 'Gigante'),
(8, 'Gnômico'),
(9, 'Goblin'),
(10, 'Pequeno'),
(11, 'Orc'),
(12, 'Celestial'),
(13, 'Abissal'),
(14, 'Dialeto Obscuro'),
(15, 'Druídico'),
(16, 'Gíria dos Ladrões'),
(17, 'Primordial'),
(18, 'Silvestre'),
(19, 'Subcomum');