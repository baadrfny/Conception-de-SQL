Qodex – SQL Database & ERD

Ce projet consiste à concevoir et documenter la base de données de la plateforme Qodex, dédiée à l’organisation et à la participation aux hackathons. Le travail inclut la modélisation (ERD), la création du schéma SQL ainsi que l’écriture de requêtes de manipulation et de consultation des données.

🎯 Objectif

Mettre en place une base de données relationnelle robuste et évolutive permettant de gérer :

les utilisateurs (enseignants & étudiants)

les catégories

les quiz

les questions

les résultats des étudiants

📌 Schéma de Données (Résumé)

Utilisateurs : id, nom, email, motdepasse, role

Categories : id, nom_categorie

Quiz : id, titre, description, id_categorie, id_enseignant, duree_minutes

Questions : id, texte_question, reponse_correcte, points, id_quiz

Resultats : id, score, date_passage, id_etudiant, id_quiz

🔗 Relations

Un enseignant crée plusieurs quiz

Une catégorie contient plusieurs quiz

Un quiz contient plusieurs questions

Un étudiant peut passer plusieurs quiz et obtenir des résultats

🧩 Contenu du projet

Script SQL de création de la base

Diagramme ERD

23 requêtes SQL couvrant l’ajout, la modification et la consultation des données

📝 Requêtes incluses (exemples)

Ajouter un quiz

Modifier la durée d’un quiz

Afficher utilisateurs / quiz / catégories

Filtrer les quiz par durée

Afficher les meilleurs scores

Obtenir les 3 derniers résultats

Associer chaque quiz à sa catégorie
