--@block
CREATE DATABASE qodex

--@block
USE  qodex;


--@block
SELECT * FROM utilisateurs ;

--@block
SELECT * FROM categories ;

--@block
SELECT * FROM quiz ;

--@block
SELECT * FROM questions ;

--@block 
SELECT * FROM resultat



--@block
CREATE TABLE  utilisateurs(
    id_utilisateur INT  PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL ,
    email VARCHAR(255) NOT NULL UNIQUE,
    motdepasse VARCHAR(255) NOT NULL,
    role ENUM('enseignant ' , 'etudiant') NOT NULL
) ;



--@block 
CREATE TABLE categories(
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(255) NOT NULL 

);



--@block
CREATE TABLE quiz (
    id_quiz INT  PRIMARY KEY AUTO_INCREMENT,
    titre_quiz VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    id_categorie INT NOT NULL,
    id_enseignant INT NOT NULL, 
    duree_minutes INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie),
    FOREIGN KEY (id_enseignant) REFERENCES utilisateurs(id_utilisateur)
);


--@block 
CREATE TABLE questions(
    id_question INT AUTO_INCREMENT PRIMARY KEY ,
    texte_question  VARCHAR(255) NOT NULL, 
    reponse_correcte VARCHAR(255) NOT NULL ,
    points INT NOT NULL,
    id_quiz INT NOT NULL,
    FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz)

);


--@block 
CREATE TABLE resultat(
    id_resultat INT  PRIMARY KEY AUTO_INCREMENT,
    score INT NOT NULL,
    date_passage DATE NOT NULL,
    id_etudiant INT NOT NULL,
    quiz_id INT NOT NULL,
    
    FOREIGN KEY (id_etudiant) REFERENCES utilisateurs(id_utilisateur)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quiz(id_quiz)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);



--@block
INSERT INTO utilisateurs (nom, email, motdepasse, role) VALUES
('Ahmed Karim', 'ahmed.karim@example.com',  SHA2('code1', 256), 'etudiant'),
('Sara Benali', 'sara.benali@example.com', SHA2('code2', 256), 'etudiant'),
('Youssef Amrani', 'youssef.amrani@example.com', SHA2('code3', 256), 'etudiant'),
('Omar El Idrissi', 'omar.idrissi@example.com', SHA2('code4', 256), 'etudiant'),
('Mouna Zahra', 'mouna.zahra@example.com', SHA2('code5', 256), 'etudiant'),
('Hajar Fathi', 'hajar.fathi@example.com', SHA2('code6', 256), 'etudiant'),
('Imane Kaddi', 'imane.kaddi@example.com', SHA2('code7', 256), 'etudiant'),
('Rachid Naji', 'rachid.naji@example.com', SHA2('code8', 256), 'etudiant'),
('Anas Chami', 'anas.chami@example.com', SHA2('code9', 256), 'etudiant'),
('Meryem Laasri', 'meryem.laasri@example.com', SHA2('code10', 256), 'etudiant'),

('Prof Ali Mansour', 'ali.mansour@example.com', SHA2('code11', 256), 'enseignant '),
('Prof Samira Lahlou', 'samira.lahlou@example.com', SHA2('code12', 256), 'enseignant '),
('Prof Redouane Tahiri', 'redouane.tahiri@example.com', SHA2('code13', 256), 'enseignant '),
('Prof Hind Nouira', 'hind.nouira@example.com', SHA2('code14', 256), 'enseignant '),
('Prof Yassine Rifi', 'yassine.rifi@example.com', SHA2('code15', 256), 'enseignant '),
('Prof Lamia Jidar', 'lamia.jidar@example.com', SHA2('code16', 256), 'enseignant '),
('Prof Khalid Souiri', 'khalid.souiri@example.com', SHA2('code17', 256), 'enseignant '),
('Prof Amal Moubarik', 'amal.moubarik@example.com', SHA2('code18', 256), 'enseignant '),
('Prof Salim Othmani', 'salim.othmani@example.com',SHA2('code19', 256), 'enseignant '),
('Prof Karima Ziani', 'karima.ziani@example.com', SHA2('code20', 256), 'enseignant ');


--@block
INSERT INTO categories (nom_categorie) VALUES
('Programmation'),
('Base de données'),
('Réseaux'),
('Sécurité informatique'),
('Développement web'),
('Mathématiques'),
('Physique'),
('Chimie'),
('Biologie'),
('Histoire'),
('Géographie'),
('Langue française'),
('Anglais'),
('Java'),
('Python'),
('C++'),
('JavaScript'),
('Cloud Computing'),
('IA et Machine Learning'),
('DevOps');




--@block
INSERT INTO questions (texte_question, reponse_correcte, points, id_quiz) VALUES
('Que signifie HTML ?', 'HyperText Markup Language', 5, 4),
('Quel est l opérateur d affectation en Python ?', '=', 5, 1),
('Quel mot-clé crée une classe en Java ?', 'class', 5, 2),
('Quel port utilise HTTP ?', '80', 5, 5),
('Que signifie SQL ?', 'Structured Query Language', 5, 3),
('Quelle est la dérivée de x^2 ?', '2x', 5, 6),
('Un Newton mesure quoi ?', 'Force', 5, 7),
('H2O correspond à ?', 'Eau', 5, 8),
('En quelle année a commencé la WWII ?', '1939', 5, 9),
('Traduction de "apple" ?', 'pomme', 5, 10),

('Quel mot-clé déclare une variable JS ?', 'let', 5, 11),
('Quel symbole permet les pointeurs en C++ ?', '*', 5, 12),
('Qu’est-ce qu’un dataset ?', 'Ensemble de données', 5, 13),
('Que signifie AWS ?', 'Amazon Web Services', 5, 14),
('Que signifie CI/CD ?', 'Integration Continue / Déploiement Continu', 5, 15),
('Quelle est l’unité de base de la vie ?', 'Cellule', 5, 16),
('Capitale de l Espagne ?', 'Madrid', 5, 17),
('Protocole de sécurité des sites web HTTPS ?', 'TLS', 5, 18),
('Synonyme de "joyeux" ?', 'heureux', 5, 19),
('Que signifie IDE ?', 'Integrated Development Environment', 5, 20);




--@block

INSERT INTO quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes) VALUES
('Quiz Python Basics', 'Introduction au langage Python', 15, 11, 20),
('Quiz Java OOP', 'Concepts POO en Java', 14, 12, 25),
('Quiz SQL', 'Requêtes de base SQL', 2, 13, 30),
('Quiz HTML/CSS', 'Questions sur le développement web', 5, 14, 15),
('Quiz Réseaux', 'Notions essentielles des réseaux', 3, 15, 20),
('Quiz Math Analyse', 'Fonctions et dérivées', 6, 16, 25),
('Quiz Physique', 'Bases de la mécanique', 7, 17, 30),
('Quiz Chimie', 'Réactions chimiques', 8, 18, 20),
('Quiz Histoire', 'Histoire moderne', 10, 19, 30),
('Quiz Anglais', 'Test de vocabulaire', 13, 20, 15),

('Quiz JavaScript', 'Syntaxe et fonctions', 17, 11, 20),
('Quiz C++', 'Pointeurs et classes', 16, 12, 25),
('Quiz Machine Learning', 'Concepts de base', 19, 13, 30),
('Quiz Cloud AWS', 'Services principaux AWS', 18, 14, 20),
('Quiz DevOps', 'CI/CD et pipelines', 20, 15, 25),
('Quiz Biologie', 'Cellules et ADN', 9, 16, 20),
('Quiz Géographie', 'Capitales du monde', 11, 17, 15),
('Quiz Sécurité Info', 'Principes de sécurité', 4, 18, 20),
('Quiz Français', 'Grammaire et conjugaison', 12, 19, 20),
('Quiz Programmation', 'Concepts généraux de programmation', 1, 20, 30);

--@block
INSERT INTO resultat (score, date_passage, id_etudiant, quiz_id) VALUES
(15, '2025-01-05', 1, 1),
(18, '2025-01-06', 2, 2),
(12, '2025-01-07', 3, 3),
(20, '2025-01-08', 4, 4),
(17, '2025-01-09', 5, 5),
(14, '2025-01-10', 6, 6),
(16, '2025-01-11', 7, 7),
(19, '2025-01-12', 8, 8),
(13, '2025-01-13', 9, 9),
(18, '2025-01-14', 10, 10),

(20, '2025-01-15', 1, 11),
(14, '2025-01-16', 2, 12),
(17, '2025-01-17', 3, 13),
(12, '2025-01-18', 4, 14),
(19, '2025-01-19', 5, 15),
(15, '2025-01-20', 6, 16),
(18, '2025-01-21', 7, 17),
(11, '2025-01-22', 8, 18),
(20, '2025-01-23', 9, 19),
(16, '2025-01-24', 10, 20);


--@block
INSERT INTO quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes)
VALUES ('CSS style', 'utiliser CSS pour style interface ui', 4, 11, 50);


--@block 
UPDATE quiz 
SET duree_minutes = 120
WHERE id_quiz = 7 ;


--@block
SELECT * FROM utilisateurs ;


--@block
SELECT nom,  email  FROM utilisateurs;


--@block
SELECT * FROM quiz ;

--@block
SELECT titre_quiz FROM quiz

--@block 
SELECT * FROM categories;

--@block
SELECT * FROM utilisateurs
WHERE role = 'enseignant'

--@block
SELECT * FROM utilisateurs
WHERE role = 'etudiant'

--@block
SELECT * FROM quiz
WHERE duree_minutes > 30;

--@block 
SELECT * FROM quiz
WHERE duree_minutes <= 45;

--@block
SELECT * FROM questions
WHERE points > 5;

--@block
SELECT * FROM quiz
WHERE duree_minutes BETWEEN 20 AND 40;

--@block
SELECT * FROM resultat
WHERE score >= 60 ;

--@block
SELECT * FROM resultat
WHERE score < 60 ;

--@block
SELECT * FROM questions
WHERE points BETWEEN 5 AND 15;

--@block
SELECT * FROM quiz
WHERE id_enseignant = 11;


--@block 
SELECT * FROM quiz
ORDER BY duree_minutes ;


--@block 
SELECT * FROM resultat
ORDER BY score DESC ;

--@block
SELECT * FROM resultat
ORDER BY score DESC
LIMIT 5;

--@block
SELECT * FROM questions
ORDER BY  points 


--@block
SELECT * FROM resultat
ORDER BY date_passage DESC
LIMIT 3 ;

--@block 
SELECT Quiz.titre_quiz, Categories.nom_categorie
FROM Quiz
JOIN Categories ON Quiz.id_categorie = Categories.id_categorie;

