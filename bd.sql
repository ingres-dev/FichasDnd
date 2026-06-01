CREATE DATABASE dnd5e;

-- 1. Tabela de Idiomas
CREATE TABLE IF NOT EXISTS Idiomas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Tabela de Raças
CREATE TABLE IF NOT EXISTS Racas (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    tamanho VARCHAR(20)
);

-- 3. NOVA TABELA: Sub-raças (Ex: Alto Elfo, Anão da Montanha)
CREATE TABLE IF NOT EXISTS Sub_Racas (
    id INT NOT NULL PRIMARY KEY,
    raca_id INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    CONSTRAINT fk_subraca_raca FOREIGN KEY (raca_id) REFERENCES Racas(id) ON DELETE CASCADE
);

-- 4. TABELA INTERMEDIÁRIA: Raças <-> Idiomas (N:N)
CREATE TABLE IF NOT EXISTS Raca_Idiomas (
    raca_id INT NOT NULL,
    id_idioma INT NOT NULL,
    movimento INT,
    PRIMARY KEY (raca_id, id_idioma),
    CONSTRAINT fk_raca_idioma_raca FOREIGN KEY (raca_id) REFERENCES Racas(id) ON DELETE CASCADE,
    CONSTRAINT fk_raca_idioma_idioma FOREIGN KEY (id_idioma) REFERENCES Idiomas(id) ON DELETE CASCADE
);

-- 5. Tabela de Classes
CREATE TABLE IF NOT EXISTS Classes (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    dados_vida INT NOT NULL,
    qtd_pericias_escolha INT NOT NULL DEFAULT 2
);

-- 6. TABELA: Sub-classes / Arquétipos
CREATE TABLE IF NOT EXISTS Sub_Classes (
    id INT NOT NULL PRIMARY KEY,
    classe_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT fk_subclasse_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE
);

-- 7. TABELA INTERMEDIÁRIA: Classe <-> Testes de Resistência (Saving Throws)
-- Salva os dois atributos em que a classe tem proficiência nativa
CREATE TABLE IF NOT EXISTS Classe_Testes_Resistencia (
    classe_id INT NOT NULL,
    atributo VARCHAR(15) NOT NULL, -- 'FORCA', 'DESTREZA', etc.
    PRIMARY KEY (classe_id, atributo),
    CONSTRAINT fk_classe_res_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE
);

-- 8. Tabela Origens (Antecedentes)
CREATE TABLE IF NOT EXISTS Origens (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

-- 9. Tabela Atributos
CREATE TABLE IF NOT EXISTS Atributos (
    id SERIAL PRIMARY KEY,
    forca INT NOT NULL DEFAULT 10,
    destreza INT NOT NULL DEFAULT 10,
    inteligencia INT NOT NULL DEFAULT 10,
    sabedoria INT NOT NULL DEFAULT 10,
    carisma INT NOT NULL DEFAULT 10,
    constituicao INT NOT NULL DEFAULT 10
);

-- 10. Tabela de Personagem (Expandida com Vida, Status, RP e Sub-raça)
CREATE TABLE IF NOT EXISTS Personagem (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,
    raca_id INT NOT NULL, 
    subraca_id INT,
    origem_id INT NOT NULL,
    atributos_id INT NOT NULL UNIQUE,
    
    -- Status de Jogo Dinâmicos
    vida_maxima INT NOT NULL DEFAULT 10,
    vida_atual INT NOT NULL DEFAULT 10,
    vida_temporaria INT NOT NULL DEFAULT 0,
    dados_vida_restantes INT NOT NULL DEFAULT 1,
    experiencia_xp INT NOT NULL DEFAULT 0,
    inspiracao INT NOT NULL DEFAULT 0,
    
    -- Dados Estéticos e Interpretativos (RP)
    alinhamento VARCHAR(25) DEFAULT 'Neutro', -- Não gosto, mas vou deixar aqui
    personalidade TEXT,
    
    CONSTRAINT fk_personagem_raca FOREIGN KEY (raca_id) REFERENCES Racas(id),
    CONSTRAINT fk_personagem_subraca FOREIGN KEY (subraca_id) REFERENCES Sub_Racas(id),
    CONSTRAINT fk_personagem_origem FOREIGN KEY (origem_id) REFERENCES Origens(id),
    CONSTRAINT fk_personagem_atributos FOREIGN KEY (atributos_id) REFERENCES Atributos(id) ON DELETE CASCADE
);

-- 11. TABELA INTERMEDIÁRIA: Personagem <-> Classes (N:N para Multiclasse e Subclasses)
CREATE TABLE IF NOT EXISTS Personagem_Classes (
    personagem_id INT NOT NULL,
    classe_id INT NOT NULL,
    subclasse_id INT,
    nivel INT NOT NULL DEFAULT 1,
    PRIMARY KEY (personagem_id, classe_id),
    CONSTRAINT fk_per_classe_personagem FOREIGN KEY (personagem_id) REFERENCES Personagem(id) ON DELETE CASCADE,
    CONSTRAINT fk_per_classe_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE,
    CONSTRAINT fk_per_classe_subclasse FOREIGN KEY (subclasse_id) REFERENCES Sub_Classes(id)
);

-- 12. Tabela Talentos
CREATE TABLE IF NOT EXISTS Talentos (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT
);

-- 13. TABELA INTERMEDIÁRIA: Origem <-> Talentos (N:N)
CREATE TABLE IF NOT EXISTS Origem_Talento (
    origem_id INT NOT NULL,
    talento_id INT NOT NULL,
    PRIMARY KEY (origem_id, talento_id),
    CONSTRAINT fk_origem_talento_origem FOREIGN KEY (origem_id) REFERENCES Origens(id) ON DELETE CASCADE,
    CONSTRAINT fk_origem_talento_talento FOREIGN KEY (talento_id) REFERENCES Talentos(id) ON DELETE CASCADE
);

-- 14. Tabela Magias
CREATE TABLE IF NOT EXISTS Magias (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    dano VARCHAR(15),
    circulo INT,
    descricao TEXT
);

-- 15. TABELA INTERMEDIÁRIA: Classes <-> Magias (N:N)
CREATE TABLE IF NOT EXISTS Classe_Magias (
    classe_id INT NOT NULL,
    magia_id INT NOT NULL,
    PRIMARY KEY (classe_id, magia_id),
    CONSTRAINT fk_classe_magia_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE,
    CONSTRAINT fk_classe_magia_magia FOREIGN KEY (magia_id) REFERENCES Magias(id) ON DELETE CASCADE
);

-- 16. TABELA INTERMEDIÁRIA: Personagem <-> Magias (N:N)
CREATE TABLE IF NOT EXISTS Personagem_Magias (
    personagem_id INT NOT NULL,
    magia_id INT NOT NULL,
    PRIMARY KEY (personagem_id, magia_id),
    CONSTRAINT fk_personagem_magia_personagem FOREIGN KEY (personagem_id) REFERENCES Personagem(id) ON DELETE CASCADE,
    CONSTRAINT fk_personagem_magia_magia FOREIGN KEY (magia_id) REFERENCES Magias(id) ON DELETE CASCADE
);

-- 17. Tabela de Perícias
CREATE TABLE IF NOT EXISTS Pericias (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE,
    atributo_base VARCHAR(15) NOT NULL
);

-- 18. TABELA INTERMEDIÁRIA: Classes <-> Perícias (N:N)
CREATE TABLE IF NOT EXISTS Classe_Pericias_Opcoes (
    classe_id INT NOT NULL,
    pericia_id INT NOT NULL,
    PRIMARY KEY (classe_id, pericia_id),
    CONSTRAINT fk_classe_pericia_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE,
    CONSTRAINT fk_classe_pericia_pericia FOREIGN KEY (pericia_id) REFERENCES Pericias(id) ON DELETE CASCADE
);

-- 19. TABELA INTERMEDIÁRIA: Personagem <-> Perícias (N:N)
CREATE TABLE IF NOT EXISTS Personagem_Pericias (
    personagem_id INT NOT NULL,
    pericia_id INT NOT NULL,
    PRIMARY KEY (personagem_id, pericia_id),
    CONSTRAINT fk_personagem_pericia_personagem FOREIGN KEY (personagem_id) REFERENCES Personagem(id) ON DELETE CASCADE,
    CONSTRAINT fk_personagem_pericia_pericia FOREIGN KEY (pericia_id) REFERENCES Pericias(id) ON DELETE CASCADE
);

-- 20. Tabela Equipamentos e Itens do Jogo
CREATE TABLE IF NOT EXISTS Equipamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    categoria VARCHAR(20) NOT NULL CHECK (categoria IN ('ARMADURA', 'ARMA', 'FERRAMENTA', 'ITEM_GERAL')),
    peso DECIMAL(5,2) DEFAULT 0.0,
    descricao TEXT
);

-- 21. TABELA INTERMEDIÁRIA: Classes <-> Proficiências de Equipamentos (N:N)
CREATE TABLE IF NOT EXISTS Classe_Proficiencias (
    classe_id INT NOT NULL,
    equipamento_id INT NOT NULL,
    PRIMARY KEY (classe_id, equipamento_id),
    CONSTRAINT fk_classe_prof_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE,
    CONSTRAINT fk_classe_prof_equip FOREIGN KEY (equipamento_id) REFERENCES Equipamentos(id) ON DELETE CASCADE
);

-- 22. Tabela Habilidades de Classe (Gambiarra)
CREATE TABLE IF NOT EXISTS Habilidades (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT NOT NULL
);

-- 23. TABELA INTERMEDIÁRIA: Progressão de Habilidades por Classe (N:N)
CREATE TABLE IF NOT EXISTS Classe_Habilidades (
    classe_id INT NOT NULL,
    habilidade_id INT NOT NULL,
    nivel_ganho INT NOT NULL CHECK (nivel_ganho BETWEEN 1 AND 20),
    PRIMARY KEY (classe_id, habilidade_id),
    CONSTRAINT fk_classe_hab_classe FOREIGN KEY (classe_id) REFERENCES Classes(id) ON DELETE CASCADE,
    CONSTRAINT fk_classe_hab_hab FOREIGN KEY (habilidade_id) REFERENCES Habilidades(id) ON DELETE CASCADE
);

-- 24. NOVA TABELA INTERMEDIÁRIA: Inventário do Personagem (Mochila e Equipados)
CREATE TABLE IF NOT EXISTS Inventario_Personagem (
    personagem_id INT NOT NULL,
    equipamento_id INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    esta_equipado BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (personagem_id, equipamento_id),
    CONSTRAINT fk_inv_personagem FOREIGN KEY (personagem_id) REFERENCES Personagem(id) ON DELETE CASCADE,
    CONSTRAINT fk_inv_equipamento FOREIGN KEY (equipamento_id) REFERENCES Equipamentos(id) ON DELETE CASCADE
);

-- 25. NOVA TABELA INTERMEDIÁRIA: Rastreamento de Slots de Magia do Personagem (Consumo Diário)
CREATE TABLE IF NOT EXISTS Personagem_Slots_Magia (
    personagem_id INT NOT NULL,
    circulo INT NOT NULL CHECK (circulo BETWEEN 1 AND 9),
    slots_maximos INT NOT NULL DEFAULT 0,
    slots_atuais INT NOT NULL DEFAULT 0, 
    PRIMARY KEY (personagem_id, circulo),
    CONSTRAINT fk_slots_personagem FOREIGN KEY (personagem_id) REFERENCES Personagem(id) ON DELETE CASCADE
);