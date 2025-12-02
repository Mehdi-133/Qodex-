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
DROP TABLE resultat


--@block
INSERT INTO utilisateurs (nom, email, motdepasse, role)
VALUES
('Prof Karim', 'karim.prof@example.com', SHA2('code1', 256), 'enseignant'),
('Prof Sara', 'sara.prof@example.com',  SHA2('code2', 256), 'enseignant'),
('Mehdi Karbitou', 'mehdi.etudiant@example.com',  SHA2('code3', 256), 'etudiant'),
('Khalid Younssi', 'yassine.etudiant@example.com',  SHA2('code4', 256), 'etudiant');



--@block
INSERT INTO categories (nom_categorie)
VALUES
('Javascript'),
('HTML'),
('PHP'),
('CSS');



--@block
INSERT INTO quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes)
VALUES
('introduction a js', 'Quiz sur les function', 1, 1,30),
('Python Débutant', 'Quiz sur les bases de Python', 2, 2, 90),
('tags a HTML', 'Quiz sur tags generale sur html', 3, 1, 45);



--@block

INSERT INTO questions (texte_question, reponse_correcte, points, id_quiz)
VALUES
('Quelle méthode affiche un message dans la console ?', 'console.log()', 3, 4),
('Quelle est la bonne syntaxe pour déclarer une fonction ?', 'function maFonction()', 3, 4),
('Quel mot clé déclare une variable modifiable ?', 'let', 4, 4),

('Quel mot clé permet de définir une fonction en Python ?', 'def', 3, 5),
('Comment affiche-t-on un texte en Python ?', 'print()', 3, 5),
('Quel type de données représente une liste ?', 'list', 4, 5),

('Quel tag définit un paragraphe en HTML ?', '<p>', 3, 6),
('Quel tag est utilisé pour créer un lien ?', '<a>', 3, 6),
('Quel tag définit un titre de niveau 1 ?', '<h1>', 4, 6);


--@block
INSERT INTO resultat(score, date_passage, id_etudiant, quiz_id)
VALUES
(10, '2025-12-01', 3, 6),  
(8, '2025-12-01', 4, 6), 
(12, '2025-12-01', 3, 4),  
(5, '2025-12-01', 4, 4), 
(6, '2025-12-02', 3, 5),  
(8, '2025-12-02', 4, 5);  



--start creating les requetes

--@block
INSERT INTO quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes)
VALUES ('CSS style', 'utiliser CSS pour style interface ui', 4, 2, 50);


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
WHERE id_enseignant = 1;


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


