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
(19, 'Halfling'),
(20, 'Subcomum');

-- =============================================================================
-- 2. POPULAR RAÇAS (Agora com o campo 'movimento' aqui!)
-- =============================================================================
INSERT INTO Racas (id, nome, tamanho, movimento) VALUES
(1, 'Anão', 'Médio', 25), 
(2, 'Elfo', 'Médio', 30), 
(3, 'Halfling', 'Pequeno', 25),
(4, 'Humano', 'Médio', 30), 
(5, 'Draconato', 'Médio', 30), 
(6, 'Gnomo', 'Pequeno', 25),
(7, 'Meio-Elfo', 'Médio', 30), 
(8, 'Meio-Orc', 'Médio', 30), 
(9, 'Tiefling', 'Médio', 30);

-- Inserindo Sub-raças icônicas
INSERT INTO Sub_Racas (id, raca_id, nome) VALUES
(1, 1, 'Anão da Colina'), (2, 1, 'Anão da Montanha'),
(3, 2, 'Alto Elfo'), (4, 2, 'Elfo da Floresta'), (5, 2, 'Elfo Negro (Drow)'),
(6, 3, 'PésLeves'), (7, 3, 'Robusto'),
(8, 6, 'Gnomo da Floresta'), (9, 6, 'Gnomo das Rochas');

-- TABELA INTERMEDIÁRIA: Apenas vincula os idiomas às raças (Sem o movimento repetido!)
INSERT INTO Raca_Idiomas (raca_id, id_idioma) VALUES
(1, 1), (1, 2), -- Anão fala Comum e Anão
(2, 1), (2, 3), -- Elfo fala Comum e Élfico
(3, 1), (3, 10), -- Halfling fala Comum e Halfling
(4, 1),         -- Humano fala Comum
(5, 1), (5, 6),-- Draconato fala Comum e Dracônico
(6, 1), (6, 9), -- Gnomo fala Comum e Goblin
(7, 1), (7, 3), -- Meio-Elfo fala Comum e Élfico
(8, 1), (8, 11), -- Meio-Orc fala Comum e Orc
(9, 1), (9, 13); -- Tiefling fala Comum e Abissal

-- =============================================================================
-- 3. POPULAR PERÍCIAS (PHB)
-- =============================================================================
INSERT INTO Pericias (id, nome, atributo_base) VALUES
(1, 'Atletismo', 'FORCA'),
(2, 'Acrobacia', 'DESTREZA'), (3, 'Furtividade', 'DESTREZA'), (4, 'Prestitigitação', 'DESTREZA'),
(5, 'Arcanismo', 'INTELIGENCIA'), (6, 'História', 'INTELIGENCIA'), (7, 'Investigação', 'INTELIGENCIA'), (8, 'Natureza', 'INTELIGENCIA'), (9, 'Religião', 'INTELIGENCIA'),
(10, 'Adestrar Animais', 'SABEDORIA'), (11, 'Intuição', 'SABEDORIA'), (12, 'Medicina', 'SABEDORIA'), (13, 'Percepção', 'SABEDORIA'), (14, 'Sobrevivência', 'SABEDORIA'),
(15, 'Atuação', 'CARISMA'), (16, 'Enganação', 'CARISMA'), (17, 'Intimidação', 'CARISMA'), (18, 'Persuasão', 'CARISMA');

-- =============================================================================
-- 4. POPULAR CLASSES PADRÕES (PHB)
-- =============================================================================
INSERT INTO Classes (id, nome, dados_vida, qtd_pericias_escolha) VALUES
(1, 'Bárbaro', 12, 2), (2, 'Bardo', 8, 3), (3, 'Clérigo', 8, 2),
(4, 'Druida', 8, 2), (5, 'Guerreiro', 10, 2), (6, 'Monge', 8, 2),
(7, 'Paladino', 10, 2), (8, 'Patrulheiro', 10, 3), (9, 'Ladino', 8, 4),
(10, 'Feiticeiro', 6, 2), (11, 'Bruxo', 8, 2), (12, 'Mago', 6, 2);

-- Cadastro de algumas Sub-classes/Arquétipos iniciais (Nível 3)
INSERT INTO Sub_Classes (id, classe_id, nome) VALUES
(1, 1, 'Caminho do Berzerker'), (2, 5, 'Campeão'), (3, 5, 'Mestre de Batalha'),
(4, 9, 'Assassino'), (5, 9, 'Ladrão'), (6, 12, 'Escola de Evocação');

-- Opções de Perícias por Classe (Interface Gráfica)
INSERT INTO Classe_Pericias_Opcoes (classe_id, pericia_id) VALUES
(5, 1), (5, 6), (5, 13), (5, 17), -- Guerreiro
(9, 2), (9, 3), (9, 7), (9, 16);  -- Ladino

-- =============================================================================
-- 5. POPULAR CATALOGO DE MAGIAS (Seleção de Nível 0 a 3)
-- =============================================================================
-- Limpa dados anteriores para evitar conflitos de IDs
TRUNCATE TABLE Classe_Magias CASCADE;
TRUNCATE TABLE Magias CASCADE;

-- =============================================================================
-- CATALOGO DE MAGIAS (LETRAS A ATÉ G)
-- =============================================================================
INSERT INTO Magias (id, nome, circulo, dano, descricao) VALUES
(1, 'Abraço de Hadar', 1, '2d6', 'Braços espectrais de energia escura surgem. Criaturas na área devem passar num teste de Força ou sofrem 2d6 de dano necrótico.'),
(2, 'Abençoar', 1, '0', 'Você abençoa até três criaturas. Elas adicionam 1d4 a todas as suas jogadas de ataque e testes de resistência pela duração.'),
(3, 'Aflorar dos Elementos', 1, '0', 'Como reação ao sofrer dano elemental, você captura parte da energia. Ganha resistência a esse dano e seu próximo ataque causa 1d6 extra.'),
(4, 'Ajuste de Chamas', 1, '3d6', 'Uma cortina de fogo sai das pontas dos seus dedos. Cada criatura num cone de 4,5 metros deve fazer um teste de Destreza ou sofrerá 3d6 de dano de fogo.'),
(5, 'Alarme', 1, '0', 'Você define um alarme sutil para intrusões em uma área, escolhendo se o aviso será mental (na sua mente) ou audível.'),
(6, 'Aliado Planar', 6, '0', 'Você roga a uma entidade extraplanar por ajuda. A entidade envia um celestial, elemental ou corruptor fiel para cumprir uma tarefa em troca de pagamento.'),
(7, 'Alterar Forma', 9, '0', 'Você se transforma em uma criatura diferente de tipo humanoide ou monstro de nível de desafio igual ou menor que o seu por até 1 hora.'),
(8, 'Alterar Autoestima', 2, '0', 'Magia de encantamento que manipula as emoções de um alvo, garantindo vantagem em testes de persuasão ou intimidando-o temporariamente.'),
(9, 'Alvo Marcado', 1, '1d6', 'Você marca uma criatura como sua presa. Seus ataques com armas causam 1d6 de dano extra ao alvo e você tem vantagem para rastreá-lo.'),
(10, 'Amanhecer', 5, '4d10', 'Uma coluna de luz solar cilíndrica de 9 metros de raio brilha. Criaturas na área sofrem 4d10 de dano radiante ou metade se passarem em Constituição.'),
(11, 'Amizade', 0, '0', 'Pela duração, você tem vantagem em todos os testes de Carisma direcionados a uma criatura à sua escolha que não seja hostil a você.'),
(12, 'Amizade Animal', 1, '0', 'Esta magia deixa você convencer um animal de que você não quer machucá-lo. O animal deve passar em Sabedoria ou ficará enfeitiçado.'),
(13, 'Ampliar/Reduzir', 2, '1d4', 'Você altera o tamanho de uma criatura ou objeto. Alvos ampliados causam 1d4 de dano extra; alvos reduzidos sofrem desvantagem e causam 1d4 a menos.'),
(14, 'Animar Mortos', 3, '0', 'Esta magia cria um servo morto-vivo. Você escolhe um monte de ossos ou um corpo de um humanoide para se erguer como esqueleto ou zumbi.'),
(15, 'Animar Objetos', 5, 'Depende', 'Você infunde vida em objetos inanimados para que sigam seus comandos. Eles agem como criaturas com PV, CA e ataques baseados em seu tamanho.'),
(16, 'Anticorpo', 2, '0', 'Abjuração que purifica o sangue do alvo, garantindo imunidade temporária a venenos e neutralizando toxinas ativas.'),
(17, 'Antipatia/Simpatia', 8, '0', 'Você atrai ou repele um tipo específico de criatura inteligente para um objeto ou local alvo, forçando testes de Sabedoria.'),
(18, 'Aparência Ilusória', 5, '0', 'Você altera a aparência visual de até 3 criaturas voluntárias, fazendo-as parecer com qualquer outra raça ou formato humanoide.'),
(19, 'Apego Solar', 4, '0', 'Você faz com que uma lâmina de energia solar persiga o alvo. Seus ataques contra ele ganham bônus radiante e revelam invisibilidade.'),
(20, 'Aprisionamento', 9, '0', 'Você cria uma prisão mágica para reter uma criatura viva. O alvo deve passar em Sabedoria ou fica preso em uma das várias formas de contenção eterna.'),
(21, 'Arco Elétrico', 3, '4d12', 'Um relâmpago bifurcado atinge duas criaturas adjacentes. Cada uma deve passar em Destreza ou sofre 4d12 de dano elétrico.'),
(22, 'Armadura de Agathys', 1, '5', 'Uma força mágica congelante protege você. Ganha 5 PV temporários. Se uma criatura te bater corpo a corpo, ela sofre 5 de dano gélido.'),
(23, 'Armadura Mágica', 1, '0', 'Você toca uma criatura sem armadura. A CA base dela se torna 13 + o modificador de Destreza dela por até 8 horas.'),
(24, 'Arma Espiritual', 2, '1d8+MOD', 'Você cria uma arma espectral flutuante que ataca seus inimigos usando sua ação bônus, causando 1d8 + seu modificador de atributo de conjuração.'),
(25, 'Arma Mágica', 2, '0', 'Você infunde uma arma não-mágica com poder. A arma se torna mágica e recebe um bônus de +1 nas jogadas de ataque e dano.'),
(26, 'Arrombamento', 2, '0', 'Um objeto trancado por meios convencionais ou mágicos faz um estrondo alto audível a até 90 metros e se destranca automaticamente.'),
(27, 'Assassino Fantasmagórico', 4, '4d10', 'Você acessa os piores medos de um alvo e cria uma ilusão que apenas ele vê. O alvo sofre 4d10 de dano psíquico por turno se falhar em Sabedoria.'),
(28, 'Ataque Certeiro', 0, '0', 'Você estende sua mão e aponta para um alvo. Você ganha vantagem na sua primeira jogada de ataque contra ele no seu próximo turno.'),
(29, 'Atiçar os Mortos', 3, '1d6', 'Gera uma aura necrótica ao seu redor. Inimigos na área sofrem 1d6 de dano necrótico e você cura parte do dano causado.'),
(30, 'Atrair Projéteis', 2, '0', 'Abjuração que distorce o ar ao seu redor, forçando flechas e ataques à distância direcionados a aliados próximos a desviarem para você.'),
(31, 'Aura de Pureza', 4, '0', 'Uma energia purificadora irradia de você num raio de 9 metros. Aliados na área ganham imunidade a doenças e resistência a venenos.'),
(32, 'Aura de Vida', 4, '0', 'Energia vital irradia de você num raio de 9 metros. Aliados na área ganham resistência a dano necrótico e não podem ter seus PV máximos reduzidos.'),
(33, 'Aura de Vitalidade', 3, '2d6', 'Energia curativa irradia de você. Você pode usar uma ação bônus para fazer com que qualquer criatura na área recupere 2d6 pontos de vida.'),
(34, 'Aura Sagrada', 8, '0', 'Luz divina emana de você em um raio de 9 metros. Aliados têm vantagem em testes de resistência e inimigos sofrem desvantagem nos ataques.'),
(35, 'Auxílio Divino', 2, '0', 'Sua fé manifesta uma barreira protetora que absorve o primeiro ataque crítico direcionado a um aliado no alcance.'),
(36, 'Aviso', 1, '0', 'Esta magia permite que você se mova em alta velocidade. Pelas próximas rodadas, você pode usar a ação de Disparada como uma ação bônus.'),
(37, 'Banquete dos Heróis', 6, '0', 'Você traz um banquete magnífico. Até 12 criaturas ganham imunidade a veneno e medo, vantagem em testes de Sabedoria e PV adicionais por 24 horas.'),
(38, 'Barreira Física', 3, '0', 'Você condensa o ar para criar uma parede invisível que bloqueia a passagem de criaturas pequenas e flechas por 1 minuto.'),
(39, 'Boca Mágica', 1, '0', 'Você implanta uma mensagem em um objeto, que será dita em voz alta assim que uma condição de gatilho definida por você for cumprida.'),
(40, 'Bola de Fogo', 3, '8d6', 'Uma explosão de chamas irrompe em um ponto. Teste de Destreza, causa 8d6 de dano de fogo na área.'),
(41, 'Bom Fruto', 1, '0', 'Até 10 frutos infundidos com magia aparecem. Uma criatura que comer um fruto recupera 1 PV e o fruto nutre por um dia inteiro.'),
(42, 'Braços de Hadar', 1, '2d6', 'Tentáculos de energia escura explodem de você. Alvos na área devem passar em Força ou sofrem 2d6 de dano necrótico e perdem reações.'),
(43, 'Bruxaria (Hex)', 1, '1d6', 'Você amaldiçoa uma criatura. Seus ataques contra ela causam 1d6 de dano necrótico extra e ela tem desvantagem em testes de um atributo.'),
(44, 'Caminhar na Névoa', 1, '0', 'Você cria uma esfera de névoa de 6 metros de raio. A área fica totalmente obscurecida para propósitos de visão.'),
(45, 'Caminhar na Água', 3, '0', 'Garante a até 10 criaturas voluntárias a habilidade de andar sobre superfícies líquidas (água, lama, neve e até lava) por 1 hora.'),
(46, 'Canalizar Relâmpago', 3, '3d10', 'Uma nuvem de tempestade surge. Você pode usar sua ação em turnos futuros para fazer um relâmpago cair, causando 3d10 de dano elétrico.'),
(47, 'Cão Fiel', 4, '4d8', 'Você invoca um cão de guarda invisível que permanece no local e ataca oponentes que se aproximem, detectando invisibilidade.'),
(48, 'Catapulta', 1, '3d8', 'Você escolhe um objeto solto na área e o arremessa em linha reta. O objeto causa 3d8 de dano de concussão à criatura que atingir.'),
(49, 'Cativar', 1, '1d6', 'Da próxima vez que atingir com uma arma, vinhas surgem. O alvo deve passar em Força ou fica impedido e sofre 1d6 de dano por turno.'),
(50, 'Cegueira/Surdez', 2, '0', 'Você amaldiçoa um humanoide, deixando-o cego ou surdo. O alvo deve passar num teste de Constituição para evitar o efeito.'),
(51, 'Chama Sagrada', 0, '1d8', 'Radiação divina desce sobre uma criatura. O alvo deve ser bem-sucedido num teste de Destreza ou sofrerá 1d8 de dano radiante.'),
(52, 'Chicote de Espinhos', 0, '1d6', 'Você cria um longo chicote de vinhas que açoita a criatura. Causa 1d6 de dano perfurante e puxa o alvo 3 metros em sua direção.'),
(53, 'Chuva de Meteoros', 9, '40d6', 'Quatro esferas de fogo caem do céu. Cada criatura na área sofre 20d6 de dano de fogo e 20d6 de dano de concussão (Total 40d6).'),
(54, 'Clone', 8, '0', 'Você cria uma réplica inerte do seu corpo dentro de um receptáculo. Se você morrer, sua alma viaja para o clone, garantindo imortalidade.'),
(55, 'Comando', 1, '0', 'Você fala uma palavra de ordem de uma sílaba a uma criatura. O alvo deve passar em Sabedoria ou obedecerá (Ex: Pare, Caia, Fuja).'),
(56, 'Comunhão', 5, '0', 'Você contacta sua divindade ou servos divinos para fazer até três perguntas que possam ser respondidas com Sim ou Não.'),
(57, 'Compreender Idiomas', 1, '0', 'Pela duração, você entende o significado literal de qualquer idioma falado ou escrito que você ouça ou toque.'),
(58, 'Cone de Frio', 5, '8d8', 'Uma rajada de vento congelante sai de suas mãos. Cada criatura num cone de 18 metros sofre 8d8 de dano gélido.'),
(59, 'Confusão', 4, '0', 'Esta magia assalta a mente dos alvos na área, fazendo-os agir de forma errática e perder o controle de suas ações se falharem em Sabedoria.'),
(60, 'Consertar', 0, '0', 'Esta magia repara uma única quebra ou fissura em um objeto que você tocar (elos de corrente, chaves partidas, etc.).'),
(61, 'Constrição', 1, '0', 'Plantas brotam do chão numa área quadrada de 6 metros. Criaturas que falharem no teste de Força ficam impedidas pelas plantas.'),
(62, 'Contra-ataque Infernal', 1, '2d10', 'Como reação ao sofrer dano, você envolve o agressor em chamas infernais. Ele deve passar em Destreza ou sofre 2d10 de dano de fogo.'),
(63, 'Contra-mágica', 3, '0', 'Como uma reação, você tenta interromper o processo de conjuração de uma magia inimiga que esteja em andamento.'),
(64, 'Convocar Familiar', 1, '0', 'Você conjura um espírito que assume a forma de um animal que obedece aos seus comandos e pode entregar magias de toque.'),
(65, 'Criar Chamas', 0, '1d8', 'Uma chama bruxuleante aparece na sua mão. Ela emite luz e pode ser arremessada contra um oponente para causar 1d8 de dano de fogo.'),
(66, 'Criar Alimentos', 3, '0', 'Você cria 20 quilos de comida simples e 110 litros de água pura do nada, o suficiente para sustentar 15 humanos ou cavalos por um dia.'),
(67, 'Criar Mortos-Vivos', 6, '0', 'Uma versão mais poderosa de animar mortos. Transforma até três corpos de humanoides em carniçais sob seu controle absoluto.'),
(68, 'Cromorrai', 1, '3d8', 'Você lança uma esfera elemental. Você escolhe o tipo de dano (Ácido, Fogo, Frio, Elétrico, Veneno ou Trovão) e causa 3d8 ao atingir.'),
(69, 'Curar Ferimentos', 1, '1d8+MOD', 'Uma criatura que você tocar recupera uma quantidade de pontos de vida igual a 1d8 + seu modificador de atributo de conjuração.'),
(70, 'Curar Ferimentos em Massa', 5, '3d8+MOD', 'Uma onda de energia curativa atinge até seis criaturas à sua escolha, restaurando 3d8 + seu modificador de atributo de conjuração.'),
(71, 'Curar Doenças', 2, '0', 'Seu toque purifica um humanoide, removendo instantaneamente uma doença ou neutralizando um veneno que o esteja afetando.'),
(72, 'Dançar com as Sombras', 0, '0', 'Você cria até quatro luzes do tamanho de tochas no alcance, ou uma luz que brilha suavemente. Elas se movem conforme seu comando.'),
(73, 'Dedo da Morte', 7, '7d8+30', 'Você envia energia negativa que rasga o alvo. Causa 7d8+30 de dano necrótico. Se o alvo morrer por isso, ele se ergue como um zumbi eterno.'),
(74, 'Desintegrar', 6, '10d6+40', 'Um raio verde sai de seus dedos. Causa 10d6+40 de dano de força. Se isso reduzir os PV do alvo a 0, ele e seus itens viram pó cinzento.'),
(75, 'Destruição Trovejante', 1, '2d6', 'Sua arma canaliza trovão. Seu próximo ataque causa 2d6 de dano trovejante extra e pode empurrar o alvo 3 metros e derrubá-lo.'),
(76, 'Enfeitiçar Pessoa', 1, '0', 'Você tenta encantar um humanoide. Ele deve passar num teste de Sabedoria ou ficará enfeitiçado por você, considerando-o um amigo.'),
(77, 'Explosão Arcana', 0, '1d10', 'Um raio de energia estalante vai em direção a uma criatura. Faça um ataque mágico. Se atingir, o alvo sofre 1d10 de dano de força.'),
(78, 'Hálito de Dragão', 2, '3d6', 'Você toca uma criatura voluntária. Ela pode usar uma ação para exalar energia elemental em um cone de 4,5 metros, causando 3d6 de dano (Fogo, Frio, Ácido, Elétrico ou Veneno).'),
(79, 'Heroísmo', 1, '0', 'Você infunde coragem em uma criatura. O alvo fica imune ao medo e ganha pontos de vida temporários iguais ao seu modificador de atributo no início de cada um dos turnos dele.'),
(80, 'Hipnose', 3, '0', 'Você cria um padrão de luzes coloridas no ar que hipnotiza criaturas na área. Alvos que falharem no teste de Sabedoria ficam incapacitados e com deslocamento 0.'),
(81, 'Identificar', 1, '0', 'Você toca um objeto mágico durante 1 minuto. Você aprende as propriedades do objeto, como usá-lo, se ele requer sintonização e quantas cargas ele possui.'),
(82, 'Idiomas', 3, '0', 'Você concede a uma criatura a habilidade de entender e falar qualquer idioma que ela ouça ou tente proferir pela duração de 1 hora.'),
(83, 'Ilusão Maior', 3, '0', 'Você cria a imagem visual de um objeto, criatura ou fenômeno em um cubo de 6 metros. A ilusão inclui som, cheiro e efeitos térmicos realistas.'),
(84, 'Ilusão Menor', 0, '0', 'Você cria um som ou a imagem de um objeto dentro do alcance por 1 minuto. A ilusão termina imediatamente se você a conjurar novamente.'),
(85, 'Imagem Silenciosa', 1, '0', 'Você cria a ilusão visual de um objeto, criatura ou fenômeno em um cubo de 4,5 metros. A imagem se move de forma realista, mas não emite som nem cheiro.'),
(86, 'Imobilizar Monstro', 5, '0', 'Você tenta paralisar uma criatura que possa ver. O alvo deve passar em um teste de Sabedoria ou ficará paralisado. Ele pode repetir o teste no final de cada turno.'),
(87, 'Imobilizar Pessoa', 2, '0', 'Você tenta paralisar um humanoide. O alvo deve passar num teste de resistência de Sabedoria ou ficará paralisado pela duração da magia.'),
(88, 'Inocuidade', 2, '0', 'Abjuração que envolve uma criatura voluntária, tornando-a temporariamente indetectável por magias de adivinhação e sensores místicos de rastreamento.'),
(89, 'Inundação', 4, '4d8', 'Você conjura uma onda massiva de água que avança sobre uma área. Alvos atingidos sofrem 4d8 de dano de concussão e são derrubados com o impacto.'),
(90, 'Invisibilidade', 2, '0', 'Uma criatura que você toucher fica invisível por até 1 hora. A magia quebra imediatamente se o alvo realizar um ataque ou conjurar uma magia.'),
(91, 'Invisibilidade Maior', 4, '0', 'Você ou uma criatura tocada ficam completamente invisíveis por 1 minuto. Ao contrário da versão menor, atacar ou conjurar magias não quebra o efeito.'),
(92, 'Invocação Instantânea de Drawmij', 6, '0', 'Você altera as propriedades de um objeto com runas. Você pode usar sua ação para invocar esse objeto diretamente para sua mão de qualquer distância planária.'),
(93, 'Invocação de Projéteis', 3, '3d8', 'Você conjura centenas de flechas ou adagas espectrais que chovem em uma área. Criaturas no ponto escolhido sofrem 3d8 de dano perfurante ou cortante.'),
(94, 'Invocação do Elemento da Terra', 5, 'Depende', 'Você clama aos planos elementais e invoca um Elemental da Terra para lutar ao seu lado. Requer concentração e o elemental obedece seus comandos.'),
(95, 'Invocação do Elemento do Fogo', 5, 'Depende', 'Você invoca um espírito elemental do plano do fogo que assume a forma física de um Elemental do Fogo combativo por até 1 hora.'),
(96, 'Isolamento Místico', 4, '0', 'Você ergue uma barreira de vácuo sonoro e mágico ao redor de uma área quadrada, impedindo que sons e efeitos de runas passem pelas bordas.'),
(97, 'Janela Arcana', 1, '0', 'Você cria uma força invisível e sem mente que executa tarefas físicas simples e domésticas sob seu comando (como limpar, abrir portas e carregar itens).'),
(98, 'Jato de Ácido', 1, '2d6', 'Uma linha contínua de ácido corrosivo é projetada das suas mãos. Alvos na linha sofrem 2d6 de dano de ácido e continuam queimando no próximo turno.'),
(99, 'Julgamento Sagrado', 4, '4d8', 'Uma explosão de energy radiante pune os heréticos. Inimigos na área sofrem 4d8 de dano radiante, com dano dobrado contra mortos-vivos ou demônios.'),
(100, 'Lentidão', 3, '0', 'Você altera o fluxo do tempo para até seis criaturas. Alvos afetados têm sua CA e testes de reflexo reduzidos em -2, e só podem fazer um ataque por turno.'),
(101, 'Luz', 0, '0', 'Você toca um objeto comum. O objeto passa a emitir luz brilhante num raio de 6 metros e luz fraca por mais 6 metros adicionais por até 1 hora.'),
(102, 'Mago Fiel de Mordenkainen', 7, '4d10', 'Você invoca um fantasma invisível que guarda uma área. Ele ataca qualquer criatura que entrar no espaço sem sua permissão, causando 4d10 de dano de força.'),
(103, 'Malignidade', 3, '0', 'Você amaldiçoa um alvo, forçando-o a fazer um teste de Sabedoria. Se falhar, você escolhe um atributo para ele ter desvantagem em testes e ataques.'),
(104, 'Mandar', 1, '0', 'Você dita uma ordem direta de uma sílaba (como Caia, Pare ou Corra). O alvo deve passar em Sabedoria ou gastará o turno dele cumprindo a ordem.'),
(105, 'Mansão Magnífica de Mordenkainen', 7, '0', 'Você conjura uma habitação extraplanar luxuosa com comida e servos fantasmas para até 100 pessoas por 24 horas.'),
(106, 'Mansas Feras', 2, '0', 'Encantamento que acalma instantaneamente criaturas do tipo fera que sejam hostis, forçando um teste de Sabedoria para resistirem.'),
(107, 'Mãos de Fogo', 1, '3d6', 'Chamas saem dos seus dedos em um cone de 4,5 metros. Criaturas na área sofrem 3d6 de dano de fogo ou metade se passarem em Destreza.'),
(108, 'Mãos Mágicas', 0, '0', 'Uma mão espectral e flutuante aparece em um ponto no alcance. Você pode usá-la para mover objetos, abrir portas destrancadas e carregar itens a até 9 metros.'),
(109, 'Marca da Punição', 2, '1d6', 'Você imbuí sua arma com energia radiante. Seu próximo ataque marca o alvo, impedindo-o de ficar invisível e causando 1d6 de dano radiante por turno.'),
(110, 'Marca do Caçador', 1, '1d6', 'Você foca sua percepção em um inimigo. Seus ataques por arma causam 1d6 de dano extra a ele e você ganha vantagem em testes para rastreá-lo.'),
(111, 'Medo', 3, '0', 'Você projeta uma image fantasmagórica dos piores pavores da área. Criaturas em um cone de 9 metros ficam amedrontadas e devem largar o que seguram e fugir.'),
(112, 'Meio-Caminho', 2, '0', 'Transmutação que distorce o espaço, permitindo que você ou um aliado dobrem a distância de salto e ignorem terreno difícil por 10 minutos.'),
(113, 'Mensagem', 0, '0', 'Você aponta o dedo para uma criatura no alcance e sussurra. Apenas ela ouve a mensagem e pode responder com outro sussurro silencioso.'),
(114, 'Mente Corporativa', 5, '0', 'Você conecta telepaticamente as mentes de até seis criaturas voluntárias, permitindo comunicação instantânea a qualquer distância no mesmo plano.'),
(115, 'Metamorfose', 4, '0', 'Você transforma uma criatura viva em uma fera à sua escolha (como um Tiranossauro ou um Sapo). Os PV e atributos físicos do alvo mudam para os da nova forma.'),
(116, 'Metamorfose Verdadeira', 9, '0', 'Uma versão absoluta da metamorfose. Você transforma permanentemente uma criatura em outra, um objeto em criatura, ou uma criatura em um objeto inanimado.'),
(117, 'Milagre', 9, '0', 'A magia máxima de clérigo. Você canaliza a intervenção direta da sua divindade para duplicar o efeito de quase qualquer outra magia do jogo.'),
(118, 'Mímica Mágica', 3, '0', 'Você copia perfeitamente os maneirismos, voz e aparência de um alvo que você tenha observado por pelo menos 1 minuto.'),
(119, 'Mísseis Mágicos', 1, '3d4+3', 'Você cria três dardos brilhantes de força mágica inerráveis. Cada dardo atinge um alvo escolhido e causa 1d4+1 de dano de força.'),
(120, 'Modificar Memória', 5, '0', 'Você tenta moldar as lembranças de um alvo. Se ele falhar em Sabedoria, você pode apagar ou reescrever até 5 minutos de eventos que ocorreram nas últimas 24 horas.'),
(121, 'Montaria Fantasmagórica', 3, '0', 'Você conjura uma criatura quase real que se parece com um cavalo. Ela tem deslocamento de 30 metros e dura por 1 hora antes de sumir.'),
(122, 'Mover Terra', 6, '0', 'Você molda o terreno natural (terra, areia ou argila) em uma área, criando valas, rampas, colinas ou nivelando depressões ao longo de 2 horas.'),
(123, 'Muralha de Espinhos', 5, '7d8', 'Você cria uma parede de plantas espessas cobertas de espinhos. Criaturas que tentarem passar sofrem 7d8 de dano perfurante e têm o deslocamento drasticamente reduzido.'),
(124, 'Muralha de Fogo', 4, '5d8', 'Você cria uma parede de chamas ardentes de até 18 metros de comprimento. Criaturas que terminarem o turno perto dela ou passarem por ela sofrem 5d8 de fogo.'),
(125, 'Muralha de Gelo', 6, '10d6', 'Você cria uma parede de gelo sólido. Se for destruída, ela deixa para trás uma névoa congelante que causa 10d6 de dano gélido a quem tentar atravessar.'),
(126, 'Muralha de Pedras', 5, '0', 'Você ergue uma parede sólida de rocha permanente composta por vários painéis interligados. Ótima para criar fortificações ou prender inimigos.'),
(127, 'Muralha de Prismas', 9, '0', 'Você cria uma parede brilhante com sete camadas de cores diferentes. Cada camada tem um efeito destrutivo único, pune ataques e bloqueia magias e projéteis.'),
(128, 'Muralha de Vento', 3, '3d8', 'Uma barreira de vento forte surge do chão. Ela repele gases, flechas, projéteis leves e causa 3d8 de dano de concussão a criaturas que tentarem passar.'),
(129, 'Névoa Obscurecedora', 1, '0', 'Você invoca uma névoa espessa em uma esfera de 6 metros de raio. A área fica totalmente obscurecida para propósitos de visão.'),
(130, 'Névoa Mortal', 5, '5d10', 'Uma nuvem de gás esverdeado e tóxico surge. Ela se move 3 metros para longe de você a cada turno e causa 5d10 de dano de veneno a quem respirá-la.'),
(131, 'Névoa Sombria', 2, '0', 'Uma bruma escura cobre o chão em um raio de 9 metros, garantindo camuflagem para aliados e transformando a área em terreno difícil para inimigos.'),
(132, 'Nuvem Incendiária', 8, '10d8', 'Uma nuvem rodopiante de fumaça e brasas escaldantes causa 10d8 de dano de fogo a todas as criaturas que iniciarem o turno dentro dela.'),
(133, 'Ocular', 2, '0', 'Adivinhação que melhora a visão do conjurador, permitindo enxergar no escuro total por até 30 metros ou ler escritas rúnicas apagadas.'),
(134, 'Onda de Choque', 1, '1d6', 'Você golpeia o chão e causa um pequeno tremor. Criaturas terrestres a até 3 metros sofrem 1d6 de dano de concussão e caem derrubadas.'),
(135, 'Onda Trovejante', 1, '2d8', 'Uma onda de força trovejante emana de você. Criaturas num cubo de 4,5 metros sofrem 2d8 de dano trovejante e são empurradas 3 metros para trás.'),
(136, 'Oração de Cura', 2, '2d8+MOD', 'Você profere uma prece médica demorada de 10 minutos que cura até seis criaturas visíveis em 2d8 + seu modificador de atributo de conjuração.'),
(137, 'Ordem Rúnica', 4, '0', 'Você grava um símbolo de autoridade mística no ar. Inimigos que olharem devem passar em Carisma ou ficam paralisados pelo peso da sua presença.'),
(138, 'Padrão Hipnótico', 3, '0', 'Você cria um padrão de luzes coloridas no ar que hipnotiza criaturas na área. Alvos que falharem no teste de Sabedoria ficam incapacitados e imóveis.'),
(139, 'Palavra de Cura', 1, '1d4+MOD', 'Uma palavra mística restaura as forças de um aliado visível a até 18 metros em 1d4 + modificador. Pode ser usada como Ação Bônus.'),
(140, 'Palavra de Cura em Massa', 3, '1d4+MOD', 'Uma chamada divina cura até seis aliados que você possa ver dentro do alcance em 1d4 + modificador de conjuração. Usada como Ação Bônus.'),
(141, 'Palavra de Poder: Atordoar', 8, '0', 'Você profere uma palavra de poder. Se o alvo tiver 150 pontos de vida ou menos, ele fica instantaneamente atordoado. Não há teste inicial para evitar.'),
(142, 'Palavra de Poder: Matar', 9, '0', 'A palavra absoluta da morte. Se a criatura alvo tiver 100 pontos de vida ou menos, ela morre instantaneamente, sem direito a testes ou defesas.'),
(143, 'Palavra Sagrada', 7, 'Depende', 'Você profere uma palavra divina que pune heréticos. Criaturas extraplanares na área são banidas, e inimigos comuns podem ficar surdos, cegos ou mortos baseados em seus PV.'),
(144, 'Passos Longos', 1, '0', 'Você toca uma criatura voluntária. O deslocamento base dela aumenta em 3 metros por até 1 hora.'),
(145, 'Passos sem Pegadas', 2, '0', 'Uma cortina de sombras e silêncio irradia de você, concedendo a todos os aliados a até 9 metros um bônus de +10 em testes de Furtividade.'),
(146, 'Pele de Pedra', 4, '0', 'A pele do alvo se torna dura como rocha. Ele ganha resistência a dano de concussão, perfuração e corte não-mágicos por até 1 hora.'),
(147, 'Perdição', 1, '0', 'Até três criaturas devem fazer um teste de Carisma. Se falharem, devem subtrair 1d4 de todas as suas jogadas de ataque e testes de resistência.'),
(148, 'Pernas de Rã', 1, '0', 'Você toca uma criatura voluntária. A distância e altura máxima de salto do alvo são triplicadas até a duração da magia acabar.'),
(149, 'Praga', 5, '0', 'Seu toque transmite uma doença devastadora. O alvo deve passar em Constituição ou fica infectado, sofrendo desvantagem em testes vinculados ao atributo da doença.'),
(150, 'Praga de Insetos', 5, '4d10', 'Uma nuvem de gafanhotos vorazes preenche uma esfera de 6 metros de raio. A área fica obscurecida e causa 4d10 de dano perfurante a quem entrar.'),
(151, 'Prestitigitação', 0, '0', 'Você realiza pequenos truques mágicos e inofensivos por 1 hora (limpar objetos, aquecer comida, acender velas, criar fagulhas ou odores).'),
(152, 'Projeção Astral', 9, '0', 'Você e até oito criaturas viajam em suas formas espirituais para o Plano Astral, deixando seus corpos físicos inertes e protegidos em estase.'),
(153, 'Proteger Terreno', 6, '0', 'Você encanta uma área fechada (como uma torre ou masmorra), criando trancas mágicas, névoas, ilusões e efeitos de teletransporte para intrusos.'),
(154, 'Proteção contra Energia', 3, '0', 'Você concede resistência a um tipo de dano à sua escolha: Ácido, Fogo, Frio, Elétrico ou Trovão por até 1 hora.'),
(155, 'Proteção contra Lâminas', 0, '0', 'Você traça um sinal de defesa no ar. Até o final do seu próximo turno, você tem resistência contra dano de concussão, perfuração e corte.'),
(156, 'Proteção contra o Bem e o Mal', 1, '0', 'Garante proteções a um alvo. Criaturas do tipo aberrações, celestiais, elementais, fadas, demônios e mortos-vivos têm desvantagem para atacá-lo.'),
(157, 'Queda Suave', 1, '0', 'Como uma reação quando criaturas estiverem caindo, você retarda a descida de até 5 alvos. A velocidade de queda diminui e ninguém sofre dano ao pousar.'),
(158, 'Raio Solar', 6, '4d6', 'Um feixe de luz brilhante irrompe da sua mão. Criaturas em uma linha de 18 metros sofrem 4d6 de dano radiante e ficam cegas se falharem em Constituição.'),
(159, 'Raio Ardente', 2, '2d6', 'Você cria três raios de fogo e os atira contra alvos no alcance. Faça um ataque mágico para cada raio. Cada acerto causa 2d6 de dano de fogo.'),
(160, 'Raio de Bruxa', 1, '1d12', 'Você lança um raio de energia elétrica azul. Causa 1d12 de dano elétrico e, em turnos futuros, você pode usar sua ação para causar 1d12 automaticamente.'),
(161, 'Raio de Gelo', 0, '1d8', 'Um raio azul-branco de gelo vai em direção a uma criatura. Faça um ataque mágico. Se acertar, causa 1d8 de dano gélido e reduz o deslocamento do alvo em 3 metros.'),
(162, 'Rajada de Veneno', 0, '1d12', 'Você estende sua mão e projeta uma lufada de gás tóxico. A criatura deve passar num teste de Constituição ou sofrerá 1d12 de dano de veneno.'),
(163, 'Raio de Enfraquecimento', 2, '0', 'Um raio negro salta dos seus dedos. Faça um ataque mágico à distância. Se atingir, os ataques com armas baseadas em Força do alvo causam metade do dano.'),
(164, 'Recuo Acelerado', 1, '0', 'Você ativa seus reflexos e pernas magicamente. Pelas próximas rodadas, você pode realizar a ação de Disparada como uma ação bônus em cada turno.'),
(165, 'Reflexos', 2, '0', 'Você cria três duplicatas ilusórias de si mesmo. Sempre que for alvo de um ataque, role um d20 para ver se o golpe atinge você ou uma das cópias ilusórias.'),
(166, 'Regeneração', 7, '4d8+15', 'Você toca uma criatura e estimula sua cura natural. O alvo recupera 4d8+15 PV e, pelo próximo minuto, recupera 1 PV no início de cada um dos turnos dele.'),
(167, 'Reencarnação', 5, '0', 'Você toca um humanoide morto. Se a alma estiver livre, você molda um novo corpo biológico do zero, sorteando uma nova raça para o personagem ressurgido.'),
(168, 'Relâmpago', 3, '8d6', 'Um raio cruza uma linha de 30 metros de comprimento por 1,5 metros de largura. Criaturas na linha sofrem 8d6 de dano elétrico (Destreza reduz à metade).'),
(169, 'Remover Maldição', 3, '0', 'Ao seu toque, todas as maldições que estejam afetando uma criatura ou objeto terminam instantaneamente. Se o objeto for amaldiçoado, a sintonização quebra.'),
(170, 'Repulsão', 6, '0', 'Uma barreira invisível de força emana de você em um raio de 9 metros e se move junto com você, impedindo que inimigos se aproximem física ou magicamente.'),
(171, 'Resistência', 0, '0', 'Você toca uma criatura voluntária. O alvo pode rolar um d4 e adicionar o resultado a um teste de resistência à escolha dele antes da magia acabar.'),
(172, 'Resistência Elementar', 4, '0', 'Abjuração que concede a até três criaturas tocadas a capacidade de ignorar os primeiros 10 pontos de dano sofridos por uma fonte elemental específica.'),
(173, 'Ressurreição', 7, '0', 'Você toca um morto que esteja há menos de um século sepultado. A magia cura todas as feridas, restaura órgãos perdidos e o traz à vida com todos os PV.'),
(174, 'Ressurreição Verdadeira', 9, '0', 'A magia máxima de ressurreição. Traz uma criatura de volta à vida mesmo que o corpo tenha sido totalmente destruído, bastando falar o nome dela.'),
(175, 'Revivificar', 3, '0', 'Você toca uma criatura que tenha morrido no último minuto. Ela retorna instantaneamente à vida com 1 ponto de vida.'),
(176, 'Riso Histérico de Tasha', 1, '0', 'Um alvo afetado desaba no chão rindo descontroladamente, ficando caído e incapacitado pela duração se falhar no teste de Sabedoria.'),
(177, 'Rogação', 5, '0', 'Você envia sua consciência de forma telepática para uma divindade ou plano conceitual em busca de respostas sobre eventos que ocorrerão em breve.'),
(178, 'Rogar Maldição', 3, '1d6', 'Você toca uma criatura. Ela deve passar em Sabedoria ou fica amaldiçoada. Seus ataques contra ela causam 1d6 necrótico extra ou ela perde ações.'),
(179, 'Rompimento de Barreira', 5, '0', 'Evocação destrutiva focada em quebrar proteções físicas ou mágicas como campos de força, muralhas de pedra e portões fortificados.'),
(180, 'Runa de Proteção', 3, 'Depende', 'Você grava uma runa em uma superfície ou objeto. Quando gatilhada, a runa explode causando 5d8 de dano elemental ou ativa uma magia armazenada nela.'),
(181, 'Santuário', 1, '0', 'Você protege uma criatura. Qualquer oponente que tentar atacar o alvo diretamente deve passar em Sabedoria ou terá que escolher outro alvo.'),
(182, 'Santuário Privado de Mordenkainen', 5, '0', 'Você protege uma área contra espionagem mágica, sensores de adivinhação, teletransporte e impede a entrada de visões extraplanares.'),
(183, 'Salpico de Ácido', 0, '1d6', 'Você arremessa uma bolha de ácido. Uma ou duas criaturas adjacentes devem passar em Destreza ou sofrerão 1d6 de dano de ácido.'),
(184, 'Símbolo', 7, 'Depende', 'Você escreve um símbolo místico em uma superfície. Quando acionado por uma criatura, ele ativa efeitos devastadores como morte, dor, sono ou insanidade.'),
(185, 'Símbolo de Proteção', 2, '0', 'Gera um glifo invisível em uma porta ou baú que dispara um alarme sonoro ensurdecedor ou cega temporariamente quem tentar abri-lo sem autorização.'),
(186, 'Silêncio', 2, '0', 'Uma esfera de 6 metros de raio fica totalmente imune a sons. Nenhuma criatura na área pode conjurar magias que possuam componentes verbais.'),
(187, 'Simulacro', 7, '0', 'Você cria uma cópia ilusória idêntica de uma criatura viva feita de gelo e neve. O simulacro obedece seus comandos e possui metade dos PV do original.'),
(188, 'Sino de Alarme', 1, '0', 'Variante audível do alarme mágico que emite um som metálico agudo num raio de 18 metros quando uma criatura não autorizada cruza a linha.'),
(189, 'Sintonizar Flora', 3, '0', 'Você conversa e sintoniza com as plantas e árvores locais, descobrindo se criaturas passaram pela área ou caminhos escondidos na floresta.'),
(190, 'Sono', 1, '5d8', 'Você lança um feitiço de sono. Role 5d8; o resultado determina a quantidade total de PV de criaturas que a magia põe para dormir em ordem crescente.'),
(191, 'Sopro de Gelo', 1, '3d4', 'Uma lufada de vento congelante atinge os oponentes em cone. Causa 3d4 de dano gélido e reduz o deslocamento dos alvos pela metade.'),
(192, 'Sugestão', 2, '0', 'Você sugere um curso de ação (limitado a uma ou duas frases) a uma criatura. O alvo deve passar em Sabedoria ou obedecerá se a ordem parecer razoável.'),
(193, 'Sugestão em Massa', 6, '0', 'Uma versão estendida da sugestão que permite influenciar o comportamento e as ações de até doze criaturas simultaneamente por até 24 horas.'),
(194, 'Suporte Flutuante', 1, '0', 'Cria um disco mágico translúcido que flutua a meio metro do chão e acompanha seus passos, ideal para carregar baús pesados de tesouro.'),
(195, 'Sussurros Discordantes', 1, '3d6', 'Você projeta acordes mentais terríveis na mente de um alvo. Ele deve passar em Sabedoria ou sofre 3d6 psíquico e gasta sua reação para fugir de você.'),
(196, 'Sexto Sentido', 9, '0', 'Você ganha uma percepção visual e intuitiva perfeita do futuro imediato. Você não pode ser surpreendido e ataques contra você sofrem desvantagem.'),
(197, 'Sombra de Hadar', 4, '3d6', 'Uma escuridão faminta preenche a área. Criaturas que iniciarem o turno na névoa escura sofrem 3d6 de dano necrótico e ficam cegas.'),
(198, 'Soco de Força de Bigby', 5, '4d8', 'Você conjura uma mão flutuante gigante feita de força pura. Ela pode esmurrar alvos causando 4d8 de dano, empurrar oponentes ou agarrá-los.'),
(199, 'Tecer Teias', 2, '0', 'Massa de teias espessas e colantes preenche um cubo de 6 metros. Criaturas na área que falharem em Destreza ficam presas e impedidas de se mover.'),
(200, 'Teia de Aranha', 1, '0', 'Gera filamentos colantes mais leves que desaceleram oponentes e podem prender alvos de tamanho pequeno ou médio que falharem nos testes físicos.'),
(201, 'Teletransporte', 7, '0', 'Esta magia transporta instantaneamente você e até oito criaturas voluntárias para um destino que você escolher, que pode ser em qualquer lugar do mesmo plano.'),
(202, 'Teletransporte por Árvores', 6, '0', 'Você ganha a habilidade de entrar em uma árvore viva e sair de dentro de outra árvore do mesmo tipo a até 150 metros de distância instantaneamente.'),
(203, 'Tempestade de Gelo', 4, '4d6', 'Granizo avassalador cai em um cilindro de 6 metros de raio. Causa 2d8 de dano de concussão e 4d6 de dano gélido, transformando a área em terreno difícil.'),
(204, 'Tempestade da Vingança', 9, 'Depende', 'Você cria uma nuvem de tempestade massiva que assume o céu. A cada turno, ela desencadeia efeitos diferentes como chuva ácida, relâmpagos (5d6), granizo e fogo.'),
(205, 'Tempestade de Vento', 7, '0', 'Você cria uma barreira ciclônica vertical que impede a passagem de criaturas voadoras, gases e desvia qualquer tipo de projétil físico automaticamente.'),
(206, 'Tentáculos Negros de Evard', 4, '3d6', 'Tentáculos de ébano surgem num quadrado de 6 metros. Criaturas na área devem passar em Destreza ou sofrem 3d6 de concussão e ficam impedidas.'),
(207, 'Terremoto', 8, '0', 'Você cria um tremor devastador no chão em um raio de 30 metros. Desmorona estruturas, abre fendas no solo e derruba todas as criaturas que falharem em Destreza.'),
(208, 'Teia de Fogo', 4, '5d6', 'Cria linhas cruzadas de chamas densas que se agarram aos inimigos. Causa 5d6 de dano de fogo e continua queimando quem não gastar uma ação para apagar.'),
(209, 'Toque Chocante', 0, '1d8', 'Eletricidade corre pelas suas mãos. Um ataque mágico corpo a corpo causa 1d8 de dano elétrico e impede o alvo de realizar reações até o próximo turno dele.'),
(210, 'Toque dos Túmulos', 0, '1d8', 'Você cria uma mão esquelética fantasmagórica no espaço de uma criatura. Causa 1d8 de dano necrótico e impede o alvo de recuperar pontos de vida por 1 rodada.'),
(211, 'Toque Vampírico', 3, '3d6', 'O toque da sua mão envolta em sombras drena a energia vital dos outros. Faça um ataque mágico corpo a corpo: causa 3d6 necrótico e você cura metade disso.'),
(212, 'Transformação de Tenser', 6, '2d12', 'Você imbui a si mesmo com proeza marcial física. Você ganha 50 PV temporários, vantagem em ataques com armas e seus acertos causam 2d12 de dano de força extra.'),
(213, 'Tratamento de Alimentos', 1, '0', 'Invocação ritualística que expurga quimicamente impurezas, estragos, podridão e venenos biológicos de rações de viagem e odres de água comum.'),
(214, 'Tranca Arcana', 2, '0', 'Você tranca magicamente uma porta, janela, portão ou baú. A tranca se torna quase indestrutível e a CD para forçá-la ou arrombá-la aumenta em +10.'),
(215, 'Trânsito Planar', 7, '0', 'Você e até oito criaturas formam um círculo e viajam instantaneamente para um plano de existência diferente (como o Reino das Fadas ou o Inferno).'),
(216, 'Truque de Corda', 2, '0', 'Você toca uma corda de até 18 metros. Ela se ergue verticalmente no ar e o topo abre uma fenda para um espaço extradimensional invisível e seguro para até 8 criaturas.'),
(217, 'Tsunami', 8, '6d10', 'Uma parede de água de 90 metros de comprimento avança. Criaturas atingidas sofrem 6d10 de dano de concussão, são esmagadas e carregadas pela força da onda.'),
(218, 'Velocidade', 3, '0', 'Você altera o tempo de um aliado. Ele ganha +2 na CA, vantagem em testes de Destreza e uma ação adicional em cada turno (para atacar, disparar ou desengajar).'),
(219, 'Velocidade do Vento', 1, '0', 'O ar ao seu redor se move para impulsionar seus passos, duplicando sua velocidade de corrida e permitindo saltos mais longos por 1 minuto de duração.'),
(220, 'Ventriloquismo', 1, '0', 'Você faz com que sua voz ou sons específicos gravados pareçam emanar de um ponto, estátua ou objeto diferente dentro do alcance da magia.'),
(221, 'Vento Sussurrante', 2, '0', 'Você envia uma mensagem curta através do vento para um local específico que você conheça dentro do alcance. O vento sussurra as palavras assim que chega.'),
(222, 'Ver o Invisível', 2, '0', 'Pela duração de 1 hora, você enxerga perfeitamente criaturas e objetos invisíveis ou intangíveis, incluindo seres que estejam no Plano Etéreo adjacente.'),
(223, 'Viagem Fluvial', 4, '0', 'Transmutação que sintoniza um barco ou embarcação com a correnteza mágica, triplicando a velocidade de navegação por rios e canais por 8 horas.'),
(224, 'Viagem Dimensional', 4, '0', 'Você e uma criatura voluntária se teletransportam instantaneamente a até 150 metros de distância para um ponto que você possa ver ou visualizar em mente.'),
(225, 'Vigor da Natureza', 2, '0', 'Você canaliza a energia das florestas para garantir a um aliado vantagens em testes de resistência de Constituição e pontos de vida temporários por turno.'),
(226, 'Vínculo Telepático de Rary', 5, '0', 'Você cria um elo mental entre até oito criaturas voluntárias inteligentes. Elas podem se comunicar telepaticamente a qualquer distância planária.'),
(227, 'Visão Suprema', 6, '0', 'Você concede a si mesmo ou a um aliado a capacidade de enxergar a verdadeira forma de metamorfos, ver através de ilusões e focar no escuro mágico por 30 metros.'),
(228, 'Visão Invejosa', 2, '2d4', 'Ilusão mental que projeta imagens falsas nos olhos do inimigo. Causa 2d4 de dano psíquico e o deixa parcialmente cego até ele passar no teste de inteligência.'),
(229, 'Voz Protetora', 3, '0', 'Abjuração espiritual que emite um eco toda vez que um aliado for alvo de coerção mental, garantindo a ele a chance de refazer o teste com vantagem.'),
(230, 'Vórtice de Força', 5, '5d10', 'Um redemoinho de energia gravitacional pura puxa os inimigos para o centro. Causa 5d10 de dano de força e restringe o movimento de quem falhar.'),
(231, 'Zombaria Maliciosa', 0, '1d4', 'Você profere insultos amarrados com encantamentos. O alvo deve passar em Sabedoria ou sofre 1d4 de dano psíquico e desvantagem na próxima jogada de ataque.'),
(232, 'Zona de Verdade', 2, '0', 'Você cria uma zona mágica num raio de 4,5 metros. Criaturas na área que falharem num teste de Carisma ficam totalmente impedidas de proferir mentiras deliberadas.');

-- =============================================================================
-- 6. VÍNCULO: CLASSES <-> MAGIAS (Lista de Magias por Classe)
-- =============================================================================
INSERT INTO Classe_Magias (classe_id, magia_id) VALUES 

-- Bardo
(2, 4),   -- Consertar (Truque)
(2, 6),   -- Dançar com as Sombras / Dancing Lights (Truque)
(2, 11),  -- Ilusão Menor (Truque)
(2, 13),  -- Luz (Truque)
(2, 15),  -- Mensagem (Truque)
(2, 16),  -- Amizade (Truque)
(2, 17),  -- Prestitigitação (Truque)
(2, 231), -- Zombaria Maliciosa (Truque)
(2, 5),   -- Alarme (1º Círculo)
(2, 8),   -- Alterar Autoestima (2º Círculo)
(2, 12),  -- Amizade Animal (1º Círculo)
(2, 13),  -- Ampliar/Reduzir (2º Círculo)
(2, 18),  -- Aparência Ilusória (5º Círculo)
(2, 26),  -- Arrombamento (2º Círculo)
(2, 35),  -- Boca Mágica (1º Círculo)
(2, 36),  -- Bom Fruto / Goodberry (1º Círculo)
(2, 43),  -- Comando (1º Círculo)
(2, 45),  -- Compreender Idiomas (1º Círculo)
(2, 50),  -- Cegueira/Surdez (2º Círculo)
(2, 51),  -- Curar Ferimentos (1º Círculo)
(2, 55),  -- Comando (1º Círculo)
(2, 57),  -- Compreender Idiomas (1º Círculo)
(2, 59),  -- Confusão (4º Círculo)
(2, 60),  -- Dificultar Detecção / Disguise Self (1º Círculo)
(2, 61),  -- Dissonância Sussurrante / Dissonant Whispers (1º Círculo)
(2, 62),  -- Enfeitiçar Pessoa (1º Círculo)
(2, 64),  -- Escrito Ilusório (1º Círculo)
(2, 67),  -- Espelho Ilusório / Mirror Image (2º Círculo)
(2, 68),  -- Falar com Animais (1º Círculo)
(2, 71),  -- Gargalhada Incontrolável de Tasha (1º Círculo)
(2, 74),  -- Heroísmo (1º Círculo)
(2, 76),  -- Identificar (1º Círculo)
(2, 77),  -- Imagem Silenciosa (1º Círculo)
(2, 79),  -- Heroísmo (1º Círculo)
(2, 80),  -- Hipnose (3º Círculo)
(2, 81),  -- Identificar (1º Círculo)
(2, 82),  -- Idiomas (3º Círculo)
(2, 83),  -- Ilusão Maior (3º Círculo)
(2, 84),  -- Ilusão Menor (Truque)
(2, 85),  -- Imagem Silenciosa (1º Círculo)
(2, 87),  -- Imobilizar Pessoa (2º Círculo)
(2, 90),  -- Invisibilidade (2º Círculo)
(2, 91),  -- Invisibilidade Maior (4º Círculo)
(2, 100), -- Lentidão (3º Círculo)
(2, 104), -- Mandar (1º Círculo)
(2, 111), -- Medo (3º Círculo)
(2, 113), -- Mensagem (Truque)
(2, 115), -- Metamorfose (4º Círculo)
(2, 120), -- Modificar Memória (5º Círculo)
(2, 130), -- Névoa Obscurecedora / Fog Cloud (1º Círculo)
(2, 138), -- Padrão Hipnótico (3º Círculo)
(2, 139), -- Palavra de Cura (1º Círculo)
(2, 140), -- Palavra de Cura em Massa (3º Círculo)
(2, 141), -- Palavra de Poder: Atordoar (8º Círculo)
(2, 142), -- Palavra de Poder: Matar (9º Círculo)
(2, 144), -- Passos Longos (1º Círculo)
(2, 151), -- Prestitigitação (Truque)
(2, 153), -- Proteger Terreno / Guards and Wards (6º Círculo)
(2, 157), -- Queda Suave (1º Círculo)
(2, 164), -- Recuo Acelerado (1º Círculo)
(2, 165), -- Reflexos / Mirror Image (2º Círculo)
(2, 166), -- Regeneração (7º Círculo)
(2, 169), -- Remover Maldição (3º Círculo)
(2, 176), -- Riso Histérico de Tasha (1º Círculo)
(2, 178), -- Rogar Maldição (3º Círculo)
(2, 184), -- Símbolo (7º Círculo)
(2, 186), -- Silêncio (2º Círculo)
(2, 190), -- Sono (1º Círculo)
(2, 192), -- Sugestão (2º Círculo)
(2, 193), -- Sugestão em Massa (6º Círculo)
(2, 195), -- Sussurros Discordantes (1º Círculo)
(2, 218), -- Velocidade / Haste (3º Círculo)
(2, 220), -- Ventriloquismo (1º Círculo)
(2, 221), -- Vento Sussurrante (2º Círculo)
(2, 222), -- Ver o Invisível (2º Círculo)
(2, 226), -- Vínculo Telepático de Rary (5º Círculo)
(2, 232); -- Zona de Verdade (2º Círculo)


-- Clérigo
(3, 2),   -- Chama Sagrada (Truque)
(3, 4),   -- Consertar (Truque)
(3, 7),   -- Guidance / Eis-me Aqui (Truque)
(3, 13),  -- Luz (Truque)
(3, 19),  -- Resistência (Truque)
(3, 21),  -- Sensações Dracônicas / Thaumaturgy (Truque)
(3, 2),   -- Abençoar (1º Círculo)
(3, 5),   -- Alarme (1º Círculo)
(3, 6),   -- Aliado Planar (6º Círculo)
(3, 10),  -- Amanhecer (5º Círculo)
(3, 14),  -- Animar Mortos (3º Círculo)
(3, 24),  -- Arma Espiritual (2º Círculo)
(3, 25),  -- Arma Mágica (2º Círculo)
(3, 31),  -- Aura de Pureza (4º Círculo)
(3, 32),  -- Aura de Vida (4º Círculo)
(3, 33),  -- Aura de Vitalidade (3º Círculo)
(3, 34),  -- Aura Sagrada (8º Círculo)
(3, 35),  -- Auxílio Divino (2º Círculo)
(3, 37),  -- Banquete dos Heróis (6º Círculo)
(3, 50),  -- Cegueira/Surdez (2º Círculo)
(3, 55),  -- Comando (1º Círculo)
(3, 56),  -- Comunhão (5º Círculo)
(3, 66),  -- Criar Alimentos (3º Círculo)
(3, 67),  -- Criar Mortos-Vivos (6º Círculo)
(3, 69),  -- Curar Ferimentos (1º Círculo)
(3, 70),  -- Curar Ferimentos em Massa (5º Círculo)
(3, 71),  -- Curar Doenças (2º Círculo)
(3, 117), -- Milagre (9º Círculo)
(3, 127), -- Muralha de Prismas (9º Círculo)
(3, 136), -- Oração de Cura (2º Círculo)
(3, 139), -- Palavra de Cura (1º Círculo)
(3, 140), -- Palavra de Cura em Massa (3º Círculo)
(3, 143), -- Palavra Sagrada (7º Círculo)
(3, 147), -- Perdição (1º Círculo)
(3, 149), -- Praga (5º Círculo)
(3, 150), -- Praga de Insetos (5º Círculo)
(3, 156), -- Proteção contra o Bem e o Mal (1º Círculo)
(3, 158), -- Raio Solar (6º Círculo)
(3, 166), -- Regeneração (7º Círculo)
(3, 169), -- Remover Maldição (3º Círculo)
(3, 173), -- Ressurreição (7º Círculo)
(3, 174), -- Ressurreição Verdadeira (9º Círculo)
(3, 175), -- Revivificar (3º Círculo)
(3, 177), -- Rogação (5º Círculo)
(3, 178), -- Rogar Maldição (3º Círculo)
(3, 181), -- Santuário (1º Círculo)
(3, 184), -- Símbolo (7º Círculo)
(3, 185), -- Símbolo de Proteção (2º Círculo)
(3, 186), -- Silêncio (2º Círculo)
(3, 207), -- Terremoto (8º Círculo)
(3, 213), -- Tratamento de Alimentos (1º Círculo)
(3, 227), -- Visão Suprema / True Seeing (6º Círculo)
(3, 232); -- Zona de Verdade (2º Círculo)


-- DRUIDA 
(4, 3),   -- Chicote de Espinhos (Truque)
(4, 4),   -- Consertar (Truque)
(4, 5),   -- Criar Chamas (Truque)
(4, 7),   -- Guidance / Eis-me Aqui (Truque)
(4, 12),  -- Amizade Animal (1º Círculo)
(4, 13),  -- Ampliar/Reduzir (2º Círculo)
(4, 41),  -- Bom Fruto (1º Círculo)
(4, 44),  -- Caminhar na Névoa / Fog Cloud (1º Círculo)
(4, 45),  -- Caminhar na Água (3º Círculo)
(4, 46),  -- Canalizar Relâmpago / Call Lightning (3º Círculo)
(4, 49),  -- Cativar / Ensnaring Strike (1º Círculo)
(4, 52),  -- Fogo das Fadas / Chama Texturizada (1º Círculo)
(4, 58),  -- Cone de Frio (5º Círculo)
(4, 61),  -- Constrição / Entangle (1º Círculo)
(4, 68),  -- Cromorrai (1º Círculo)
(4, 69),  -- Curar Ferimentos (1º Círculo)
(4, 70),  -- Curar Ferimentos em Massa (5º Círculo)
(4, 115), -- Metamorfose (4º Círculo)
(4, 122), -- Mover Terra (6º Círculo)
(4, 123), -- Muralha de Espinhos (5º Círculo)
(4, 124), -- Muralha de Fogo (4º Círculo)
(4, 126), -- Muralha de Pedras (5º Círculo)
(4, 133), -- Ocular (2º Círculo)
(4, 134), -- Onda de Choque / Earth Tremor (1º Círculo)
(4, 135), -- Onda Trovejante / Thunderwave (1º Círculo)
(4, 144), -- Passos Longos (1º Círculo)
(4, 145), -- Passos sem Pegadas / Pass Without Trace (2º Círculo)
(4, 146), -- Pele de Pedra (4º Círculo)
(4, 148), -- Pernas de Rã / Jump (1º Círculo)
(4, 150), -- Praga de Insetos (5º Círculo)
(4, 154), -- Proteção contra Energia (3º Círculo)
(4, 157), -- Queda Suave (1º Círculo)
(4, 158), -- Raio Solar (6º Círculo)
(4, 161), -- Raio de Gelo (Truque)
(4, 167), -- Reencarnação (5º Círculo)
(4, 171), -- Resistência (Truque)
(4, 189), -- Sintonizar Flora (3º Círculo)
(4, 202), -- Teletransporte por Árvores (6º Círculo)
(4, 203), -- Tempestade de Gelo (4º Círculo)
(4, 204), -- Tempestade da Vingança (9º Círculo)
(4, 205), -- Tempestade de Vento (7º Círculo)
(4, 207), -- Terremoto (8º Círculo)
(4, 213), -- Tratamento de Alimentos (1º Círculo)
(4, 217), -- Tsunami (8º Círculo)
(4, 219), -- Velocidade do Vento (1º Círculo)
(4, 225), -- Vigor da Natureza (2º Círculo)
(4, 227); -- Visão Suprema / True Seeing (6º Círculo)


-- Paladino
(7, 2),   -- Abençoar (1º Círculo)
(7, 5),   -- Alarme (1º Círculo)
(7, 24),  -- Arma Espiritual (2º Círculo)
(7, 25),  -- Arma Mágica (2º Círculo)
(7, 31),  -- Aura de Pureza (4º Círculo)
(7, 32),  -- Aura de Vida (4º Círculo)
(7, 33),  -- Aura de Vitalidade (3º Círculo)
(7, 34),  -- Aura Sagrada (8º Círculo) -- Disponível via subclasses e juramentos específicos
(7, 35),  -- Auxílio Divino (2º Círculo)
(7, 43),  -- Comando (1º Círculo)
(7, 44),  -- Compulsão Duelista / Compelled Duel (1º Círculo)
(7, 50),  -- Cegueira/Surdez (2º Círculo)
(7, 53),  -- Destruição Colossal / Wrathful Smite (1º Círculo)
(7, 54),  -- Destruição Trovejante / Thunderous Smite (1º Círculo)
(7, 55),  -- Destruição Irradiante / Searing Smite (1º Círculo)
(7, 56),  -- Detectar o Bem e o Mal (1º Círculo)
(7, 57),  -- Detectar Magia (1º Círculo)
(7, 58),  -- Detectar Veneno e Doença (1º Círculo)
(7, 65),  -- Escudo da Fé (1º Círculo)
(7, 69),  -- Curar Ferimentos (1º Círculo)
(7, 71),  -- Curar Doenças / Lesser Restoration (2º Círculo)
(7, 74),  -- Heroísmo (1º Círculo)
(7, 75),  -- Destruição Trovejante (1º Círculo)
(7, 79),  -- Heroísmo (1º Círculo)
(7, 104), -- Mandar (1º Círculo)
(7, 109), -- Marca da Punição / Brand Smite (2º Círculo)
(7, 136), -- Oração de Cura (2º Círculo)
(7, 146), -- Pele de Pedra (4º Círculo)
(7, 156), -- Proteção contra o Bem e o Mal (1º Círculo)
(7, 169), -- Remover Maldição (3º Círculo)
(7, 175), -- Revivificar (3º Círculo)
(7, 181), -- Santuário (1º Círculo)
(7, 232); -- Zona de Verdade (2º Círculo)


-- Patrulheiro
(8, 5),   -- Alarme (1º Círculo)
(8, 9),   -- Alvo Marcado / Hunter's Mark (1º Círculo)
(8, 12),  -- Amizade Animal (1º Círculo)
(8, 41),  -- Bom Fruto / Goodberry (1º Círculo)
(8, 44),  -- Caminhar na Névoa / Fog Cloud (1º Círculo)
(8, 45),  -- Caminhar na Água (3º Círculo)
(8, 47),  -- Cão Fiel (4º Círculo) - via arquétipos/expansões de terreno
(8, 49),  -- Cativar / Ensnaring Strike (1º Círculo)
(8, 57),  -- Detectar Magia (1º Círculo)
(8, 58),  -- Detectar Veneno e Doença (1º Círculo)
(8, 59),  -- Confusão (4º Círculo)
(8, 61),  -- Constrição / Entangle (1º Círculo)
(8, 68),  -- Falar com Animais (1º Círculo)
(8, 69),  -- Curar Ferimentos (1º Círculo)
(8, 71),  -- Curar Doenças / Lesser Restoration (2º Círculo)
(8, 72),  -- Granizo de Espinhos / Hail of Thorns (1º Círculo)
(8, 86),  -- Imobilizar Monstro (5º Círculo)
(8, 90),  -- Invisibilidade (2º Círculo)
(8, 91),  -- Invisibilidade Maior (4º Círculo)
(8, 110), -- Marca do Caçador / Hunter's Mark (1º Círculo)
(8, 115), -- Metamorfose (4º Círculo)
(8, 120), -- Marca do Caçador (Repetição/Sinônimo indexado - 1º Círculo)
(8, 130), -- Névoa Obscurecedora (1º Círculo)
(8, 133), -- Muralha de Espinhos (5º Círculo)
(8, 144), -- Passos Longos (1º Círculo)
(8, 145), -- Passos sem Pegadas / Pass Without Trace (2º Círculo)
(8, 146), -- Pele de Pedra (4º Círculo)
(8, 148), -- Pernas de Rã / Jump (1º Círculo)
(8, 154), -- Proteção contra Energia (3º Círculo)
(8, 189), -- Sintonizar Flora (3º Círculo)
(8, 203), -- Tempestade de Gelo (4º Círculo)
(8, 219), -- Velocidade do Vento (1º Círculo)
(8, 225); -- Vigor da Natureza (2º Círculo)


-- Feiticeiro
(10, 11),  -- Amizade (Truque)
(10, 28),  -- Ataque Certeiro (Truque)
(10, 60),  -- Dançar com as Sombras / Dancing Lights (Truque) (Reindexed ID 60 original)
(10, 72),  -- Dançar com as Sombras (Truque)
(10, 77),  -- Explosão Arcana / Toque Chocante (Mapeamento de Dano)
(10, 84),  -- Ilusão Menor (Truque)
(10, 113), -- Mensagem (Truque)
(10, 118), -- Mãos Mágicas (Truque)
(10, 123), -- Mensagem (Truque)
(10, 151), -- Prestitigitação (Truque)
(10, 161), -- Raio de Gelo (Truque)
(10, 162), -- Rajada de Veneno (Truque)
(10, 209), -- Toque Chocante (Truque)
(10, 3),   -- Aflorar dos Elementos / Absorb Elements (1º Círculo)
(10, 4),   -- Ajuste de Chamas / Burning Hands (1º Círculo)
(10, 13),  -- Ampliar/Reduzir (2º Círculo)
(10, 15),  -- Animar Objetos (5º Círculo)
(10, 18),  -- Aparência Ilusória (5º Círculo)
(10, 21),  -- Arco Elétrico (3º Círculo)
(10, 23),  -- Armadura Mágica (1º Círculo)
(10, 26),  -- Arrombamento (2º Círculo)
(10, 36),  -- Aviso / Expeditious Retreat (1º Círculo)
(10, 40),  -- Bola de Fogo (3º Círculo)
(10, 44),  -- Caminhar na Névoa / Fog Cloud (1º Círculo)
(10, 50),  -- Cegueira/Surdez (2º Círculo)
(10, 53),  -- Chuva de Meteoros (9º Círculo)
(10, 58),  -- Cone de Frio (5º Círculo)
(10, 59),  -- Confusão (4º Círculo)
(10, 60),  -- Dificultar Detecção / Disguise Self (1º Círculo)
(10, 62),  -- Enfeitiçar Pessoa (1º Círculo)
(10, 67),  -- Espelho Ilusório / Mirror Image (2º Círculo)
(10, 68),  -- Cromorrai / Chromatic Orb (1º Círculo)
(10, 74),  -- Desintegrar (6º Círculo)
(10, 76),  -- Enfeitiçar Pessoa (1º Círculo)
(10, 78),  -- Hálito de Dragão (2º Círculo)
(10, 80),  -- Hipnose / Padrão Hipnótico (3º Círculo)
(10, 83),  -- Ilusão Maior (3º Círculo)
(10, 85),  -- Imagem Silenciosa (1º Círculo)
(10, 86),  -- Imobilizar Monstro (5º Círculo)
(10, 87),  -- Imobilizar Pessoa (2º Círculo)
(10, 90),  -- Invisibilidade (2º Círculo)
(10, 91),  -- Invisibilidade Maior (4º Círculo)
(10, 100), -- Lentidão (3º Círculo)
(10, 107), -- Mãos de Fogo (1º Círculo)
(10, 111), -- Medo (3º Círculo)
(10, 115), -- Metamorfose (4º Círculo)
(10, 119), -- Mísseis Mágicos (1º Círculo)
(10, 124), -- Muralha de Fogo (4º Círculo)
(10, 129), -- Névoa Obscurecedora (1º Círculo)
(10, 130), -- Névoa Mortal (5º Círculo)
(10, 131), -- Névoa Sombria (2º Círculo)
(10, 132), -- Nuvem Incendiária (8º Círculo)
(10, 134), -- Onda de Choque (1º Círculo)
(10, 135), -- Onda Trovejante (1º Círculo)
(10, 138), -- Padrão Hipnótico (3º Círculo)
(10, 145), -- Passos sem Pegadas (2º Círculo) - via Linhagem da Terra/Sombra
(10, 148), -- Pernas de Rã / Jump (1º Círculo)
(10, 150), -- Praga de Insetos (5º Círculo) - via Linhagem Pestilenta
(10, 154), -- Proteção contra Energia (3º Círculo)
(10, 155), -- Proteção contra Lâminas (Truque/Reação)
(10, 157), -- Queda Suave (1º Círculo)
(10, 158), -- Raio Solar (6º Círculo)
(10, 159), -- Raio Ardente (2º Círculo)
(10, 164), -- Recuo Acelerado (1º Círculo)
(10, 165), -- Reflexos / Mirror Image (2º Círculo)
(10, 168), -- Relâmpago (3º Círculo)
(10, 190), -- Sono (1º Círculo)
(10, 191), -- Sopro de Gelo (1º Círculo)
(10, 192), -- Sugestão (2º Círculo)
(10, 193), -- Sugestão em Massa (6º Círculo)
(10, 197), -- Sombra de Hadar / Escuridão (4º Círculo)
(10, 203), -- Tempestade de Gelo (4º Círculo)
(10, 218), -- Velocidade (3º Círculo)
(10, 224); -- Viagem Dimensional / Porta Dimensional (4º Círculo)


-- Bruxo
(11, 11),  -- Amizade (Truque)
(11, 28),  -- Ataque Certeiro (Truque)
(11, 77),  -- Explosão Arcana (Truque)
(11, 84),  -- Ilusão Menor (Truque)
(11, 118), -- Mãos Mágicas (Truque)
(11, 151), -- Prestitigitação (Truque)
(11, 162), -- Rajada de Veneno (Truque)
(11, 209), -- Toque Chocante (Truque)
(11, 210), -- Toque dos Túmulos (Truque)
(11, 1),   -- Abraço de Hadar (1º Círculo)
(11, 22),  -- Armadura de Agathys (1º Círculo)
(11, 26),  -- Arrombamento (2º Círculo)
(11, 42),  -- Braços de Hadar (1º Círculo)
(11, 43),  -- Bruxaria / Hex (1º Círculo)
(11, 45),  -- Compreender Idiomas (1º Círculo)
(11, 50),  -- Cegueira/Surdez (2º Círculo)
(11, 62),  -- Enfeitiçar Pessoa (1º Círculo)
(11, 63),  -- Contra-ataque Infernal / Hellish Rebuke (1º Círculo)
(11, 64),  -- Contra-mágica / Counterspell (3º Círculo)
(11, 73),  -- Dedo da Morte (7º Círculo)
(11, 76),  -- Enfeitiçar Pessoa (1º Círculo)
(11, 80),  -- Hipnose (3º Círculo)
(11, 86),  -- Imobilizar Monstro (5º Círculo)
(11, 87),  -- Imobilizar Pessoa (2º Círculo)
(11, 90),  -- Invisibilidade (2º Círculo)
(11, 103), -- Malignidade (3º Círculo)
(11, 111), -- Medo (3º Círculo)
(11, 131), -- Névoa Sombria (2º Círculo)
(11, 138), -- Padrão Hipnótico (3º Círculo)
(11, 141), -- Palavra de Poder: Atordoar (8º Círculo)
(11, 142), -- Palavra de Poder: Matar (9º Círculo)
(11, 147), -- Perdição (1º Círculo)
(11, 150), -- Praga de Insetos (5º Círculo)
(11, 156), -- Proteção contra o Bem e o Mal (1º Círculo)
(11, 160), -- Raio de Witch / Raio de Bruxa (1º Círculo)
(11, 163), -- Raio de Enfraquecimento (2º Círculo)
(11, 169), -- Remover Maldição (3º Círculo)
(11, 178), -- Rogar Maldição (3º Círculo)
(11, 192), -- Sugestão (2º Círculo)
(11, 193), -- Sugestão em Massa (6º Círculo)
(11, 197), -- Sombra de Hadar (4º Círculo)
(11, 206), -- Tentáculos Negros de Evard (4º Círculo)
(11, 211), -- Toque Vampírico (3º Círculo)
(11, 215), -- Trânsito Planar (7º Círculo)
(11, 224); -- Viagem Dimensional / Porta Dimensional (4º Círculo)


-- Mago
(12, 28),  -- Ataque Certeiro (Truque)
(12, 4),   -- Consertar (Truque)
(12, 60),  -- Dançar com as Sombras / Dancing Lights (Truque)
(12, 72),  -- Dançar com as Sombras (Truque)
(12, 84),  -- Ilusão Menor (Truque)
(12, 113), -- Mensagem (Truque)
(12, 118), -- Mãos Mágicas (Truque)
(12, 123), -- Mensagem (Truque)
(12, 151), -- Prestitigitação (Truque)
(12, 161), -- Raio de Gelo (Truque)
(12, 162), -- Rajada de Veneno (Truque)
(12, 209), -- Toque Chocante (Truque)
(12, 210), -- Toque dos Túmulos (Truque)
(12, 3),   -- Aflorar dos Elementos / Absorb Elements (1º Círculo)
(12, 4),   -- Ajuste de Chamas / Burning Hands (1º Círculo)
(12, 5),   -- Alarme (1º Círculo)
(12, 7),   -- Alterar Forma (9º Círculo)
(12, 13),  -- Ampliar/Reduzir (2º Círculo)
(12, 14),  -- Animar Mortos (3º Círculo)
(12, 15),  -- Animar Objetos (5º Círculo)
(12, 18),  -- Aparência Ilusória (5º Círculo)
(12, 20),  -- Aprisionamento (9º Círculo)
(12, 21),  -- Arco Elétrico (3º Círculo)
(12, 23),  -- Armadura Mágica (1º Círculo)
(12, 25),  -- Arma Mágica (2º Círculo)
(12, 26),  -- Arrombamento (2º Círculo)
(12, 27),  -- Assassino Fantasmagórico (4º Círculo)
(12, 36),  -- Aviso / Expeditious Retreat (1º Círculo)
(12, 38),  -- Barreira Física (3º Círculo)
(12, 39),  -- Boca Mágica (1º Círculo)
(12, 40),  -- Bola de Fogo (3º Círculo)
(12, 44),  -- Caminhar na Névoa / Fog Cloud (1º Círculo)
(12, 47),  -- Cão Fiel (4º Círculo)
(12, 48),  -- Catapulta (1º Círculo)
(12, 50),  -- Cegueira/Surdez (2º Círculo)
(12, 53),  -- Chuva de Meteoros (9º Círculo)
(12, 54),  -- Clone (8º Círculo)
(12, 57),  -- Compreender Idiomas (1º Círculo)
(12, 58),  -- Cone de Frio (5º Círculo)
(12, 59),  -- Confusão (4º Círculo)
(12, 60),  -- Dificultar Detecção / Disguise Self (1º Círculo)
(12, 62),  -- Enfeitiçar Pessoa (1º Círculo)
(12, 64),  -- Escrito Ilusório (1º Círculo)
(12, 67),  -- Espelho Ilusório / Mirror Image (2º Círculo)
(12, 64),  -- Contra-mágica / Counterspell (3º Círculo)
(12, 68),  -- Cromorrai (1º Círculo)
(12, 71),  -- Gargalhada Incontrolável de Tasha (1º Círculo)
(12, 73),  -- Dedo da Morte (7º Círculo)
(12, 74),  -- Desintegrar (6º Círculo)
(12, 76),  -- Enfeitiçar Pessoa (1º Círculo)
(12, 78),  -- Hálito de Dragão (2º Círculo)
(12, 80),  -- Hipnose (3º Círculo)
(12, 81),  -- Identificar (1º Círculo)
(12, 83),  -- Ilusão Maior (3º Círculo)
(12, 85),  -- Imagem Silenciosa (1º Círculo)
(12, 86),  -- Imobilizar Monstro (5º Círculo)
(12, 87),  -- Imobilizar Pessoa (2º Círculo)
(12, 90),  -- Invisibilidade (2º Círculo)
(12, 91),  -- Invisibilidade Maior (4º Círculo)
(12, 92),  -- Invocação Instantânea de Drawmij (6º Círculo)
(12, 93),  -- Invocação de Projéteis (3º Círculo)
(12, 96),  -- Isolamento Místico (4º Círculo)
(12, 97),  -- Janela Arcana / Unseen Servant (1º Círculo)
(12, 100), -- Lentidão (3º Círculo)
(12, 102), -- Mago Fiel de Mordenkainen (7º Círculo)
(12, 105), -- Mansão Magnífica de Mordenkainen (7º Círculo)
(12, 107), -- Mãos de Fogo (1º Círculo)
(12, 111), -- Medo (3º Círculo)
(12, 115), -- Metamorfose (4º Círculo)
(12, 116), -- Metamorfose Verdadeira (9º Círculo)
(12, 118), -- Mímica Mágica (3º Círculo)
(12, 119), -- Mísseis Mágicos (1º Círculo)
(12, 120), -- Modificar Memória (5º Círculo)
(12, 121), -- Montaria Fantasmagórica (3º Círculo)
(12, 124), -- Muralha de Fogo (4º Círculo)
(12, 125), -- Muralha de Gelo (6º Círculo)
(12, 126), -- Muralha de Pedras (5º Círculo)
(12, 127), -- Muralha de Prismas (9º Círculo)
(12, 128), -- Muralha de Vento (3º Círculo)
(12, 129), -- Névoa Obscurecedora (1º Círculo)
(12, 130), -- Névoa Mortal (5º Círculo)
(12, 131), -- Névoa Sombria (2º Círculo)
(12, 132), -- Nuvem Incendiária (8º Círculo)
(12, 134), -- Onda de Choque (1º Círculo)
(12, 135), -- Onda Trovejante (1º Círculo)
(12, 138), -- Padrão Hipnótico (3º Círculo)
(12, 141), -- Palavra de Poder: Atordoar (8º Círculo)
(12, 142), -- Palavra de Poder: Matar (9º Círculo)
(12, 144), -- Passos Longos (1º Círculo)
(12, 146), -- Pele de Pedra (4º Círculo)
(12, 148), -- Pernas de Rã / Jump (1º Círculo)
(12, 152), -- Projeção Astral (9º Círculo)
(12, 153), -- Proteger Terreno (6º Círculo)
(12, 154), -- Proteção contra Energia (3º Círculo)
(12, 155), -- Proteção contra Lâminas (Truque)
(12, 156), -- Proteção contra o Bem e o Mal (1º Círculo)
(12, 157), -- Queda Suave (1º Círculo)
(12, 158), -- Raio Solar (6º Círculo)
(12, 159), -- Raio Ardente (2º Círculo)
(12, 160), -- Raio de Bruxa (1º Círculo)
(12, 163), -- Raio de Enfraquecimento (2º Círculo)
(12, 164), -- Recuo Acelerado (1º Círculo)
(12, 165), -- Reflexos / Mirror Image (2º Círculo)
(12, 168), -- Relâmpago (3º Círculo)
(12, 176), -- Riso Histérico de Tasha (1º Círculo)
(12, 180), -- Runa de Protection / Glifo (3º Círculo)
(12, 182), -- Santuário Privado de Mordenkainen (5º Círculo)
(12, 187), -- Simulacro (7º Círculo)
(12, 190), -- Sono (1º Círculo)
(12, 191), -- Sopro de Gelo (1º Círculo)
(12, 192), -- Sugestão (2º Círculo)
(12, 193), -- Sugestão em Massa (6º Círculo)
(12, 194), -- Suporte Flutuante (1º Círculo)
(12, 196), -- Sexto Sentido / Foresight (9º Círculo)
(12, 199), -- Tecer Teias (2º Círculo)
(12, 201), -- Teletransporte (7º Círculo)
(12, 206), -- Tentáculos Negros de Evard (4º Círculo)
(12, 212), -- Transformação de Tenser (6º Círculo)
(12, 214), -- Tranca Arcana (2º Círculo)
(12, 215), -- Trânsito Planar (7º Círculo)
(12, 216), -- Truque de Corda (2º Círculo)
(12, 218), -- Velocidade (3º Círculo)
(12, 220), -- Ventriloquismo (1º Círculo)
(12, 222), -- Ver o Invisível (2º Círculo)
(12, 224), -- Viagem Dimensional / Porta Dimensional (4º Círculo)
(12, 226), -- Vínculo Telepático de Rary (5º Círculo)
(12, 227); -- Visão Suprema / True Seeing (6º Círculo)