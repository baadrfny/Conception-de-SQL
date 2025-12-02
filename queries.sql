/* =======================================================
QODEX PROJECT - BASE TEMPLATE (Simplified)
======================================================= */

-- 1) CREATE DATABASE
CREATE DATABASE qodex;
USE qodex;

-- 2) TABLES CREATION

-- TABLE 1: UTILISATEURS
CREATE TABLE Utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom            VARCHAR(100) NOT NULL,
    email          VARCHAR(100) NOT NULL UNIQUE,
    motdepasse     VARCHAR(255) NOT NULL,
    role           ENUM('enseignant', 'etudiant') NOT NULL
);

-- TABLE 2: CATEGORIES
CREATE TABLE Categories (
    id_categorie  INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(100) NOT NULL
);

-- TABLE 3: QUIZ
CREATE TABLE Quiz (
    id_quiz       INT PRIMARY KEY AUTO_INCREMENT,
    titre_quiz    VARCHAR(150) NOT NULL,
    description   TEXT,
    id_categorie  INT,
    id_enseignant INT,
    duree_minutes INT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_quiz_categorie
        FOREIGN KEY (id_categorie) REFERENCES Categories(id_categorie),
    CONSTRAINT fk_quiz_enseignant
        FOREIGN KEY (id_enseignant) REFERENCES Utilisateurs(id_utilisateur)
);

-- TABLE 4: QUESTIONS
CREATE TABLE Questions (
    id_question      INT PRIMARY KEY AUTO_INCREMENT,
    texte_question   TEXT NOT NULL,
    reponse_correcte TEXT NOT NULL,
    points           INT NOT NULL,
    id_quiz          INT NOT NULL,
    CONSTRAINT fk_question_quiz
        FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz)
);

-- TABLE 5: RESULTATS
CREATE TABLE Resultats (
    id_resultat  INT PRIMARY KEY AUTO_INCREMENT,
    score        INT NOT NULL,
    date_passage DATETIME NOT NULL,
    id_etudiant  INT NOT NULL,
    id_quiz      INT NOT NULL,
    CONSTRAINT fk_result_etudiant
        FOREIGN KEY (id_etudiant) REFERENCES Utilisateurs(id_utilisateur),
    CONSTRAINT fk_result_quiz
        FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz)
);

-- ===== INSERT DATA =====

-- Categories
INSERT INTO Categories (nom_categorie)
VALUES ('Informatique'),
       ('Mathématiques'),
       ('Histoire');

-- Utilisateurs
INSERT INTO Utilisateurs (nom, email, motdepasse, role)
VALUES ('Prof Badr', 'badr@example.com', '1234', 'enseignant'),
       ('Sara', 'sara@example.com', '1234', 'etudiant'),
       ('Ali', 'ali@example.com', '1234', 'etudiant');

-- Quiz
INSERT INTO Quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes)
VALUES ('Quiz SQL', 'Introduction aux bases de SQL', 1, 1, 30),
       ('Quiz Math', 'Révision des équations simples', 2, 1, 45);

-- Questions
INSERT INTO Questions (texte_question, reponse_correcte, points, id_quiz)
VALUES ('Que signifie SQL ?', 'Structured Query Language', 10, 1),
       ('2 + 2 = ?', '4', 5, 2),
       ('3 + 5 = ?', '8', 5, 2);

-- Resultats
INSERT INTO Resultats (score, date_passage, id_etudiant, id_quiz)
VALUES (80, NOW(), 2, 1),
       (60, NOW(), 3, 1),
       (90, NOW(), 2, 2),
       (40, NOW(), 3, 2);

-- ===== 23 QUERIES =====

INSERT INTO Quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes)
VALUES ('Quiz SQL', 'Introduction aux bases de SQL', 1, 1, 30);

UPDATE Quiz SET duree_minutes = 10 WHERE id_quiz = 1;

SELECT * FROM Utilisateurs;

SELECT nom, email FROM Utilisateurs;

SELECT * FROM Quiz;

SELECT titre_quiz FROM Quiz;

SELECT * FROM Categories;

SELECT * FROM Utilisateurs WHERE role = 'enseignant';

SELECT * FROM Utilisateurs WHERE role = 'etudiant';

SELECT * FROM Quiz WHERE duree_minutes > 20;

SELECT * FROM Quiz WHERE duree_minutes <= 28;

SELECT * FROM Questions WHERE points > 5;

SELECT * FROM Quiz WHERE duree_minutes BETWEEN 20 AND 40;

SELECT * FROM Resultats WHERE score >= 60;

SELECT * FROM Resultats WHERE score < 50;

SELECT * FROM Questions WHERE points BETWEEN 5 AND 15;

SELECT * FROM Quiz WHERE id_enseignant = 1;

SELECT * FROM Quiz ORDER BY duree_minutes ASC;

SELECT * FROM Resultats ORDER BY score DESC;

SELECT * FROM Resultats ORDER BY score DESC LIMIT 5;

SELECT * FROM Questions ORDER BY points ASC;

SELECT * FROM Resultats ORDER BY date_passage DESC LIMIT 3;

SELECT Quiz.titre_quiz, Categories.nom_categorie
FROM Quiz
JOIN Categories ON Quiz.id_categorie = Categories.id_categorie;
