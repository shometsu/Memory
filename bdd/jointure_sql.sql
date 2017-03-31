
/* Lister tous les groupes de voyage */
SELECT * FROM groupe_voyage


/* Afficher le mail de l’utilisateur de pseudo ‘Jean Dupond */
SELECT email FROM utilisateur WHERE prenom = "Hannah" AND nom = "Huffman"


/* Afficher la liste des utilisateurs dont le nom commence par ‘L’ */
SELECT * FROM utilisateur WHERE nom LIKE 'B%'

/*Afficher la liste des utilisateurs de Grenoble, Lyon, Chambery Annecy ou Valence. */
SELECT * FROM utilisateur WHERE ville = "Hody" OR ville ="Forchtenstein" OR ville = "Wabamun" OR ville ="Pinto" OR ville = "Valence"


/* Afficher le nom des évenements ayant lieu entre le 3 novembre 2016 et le 10 décembre 2016 */
SELECT * FROM evenement WHERE date_evenement BETWEEN '2016-11-03' AND '2016-12-10'

/* Lister les utilisateurs belges nés avant 1990   */
SELECT * FROM utilisateur WHERE pays = 'Gambia' AND date_naissance < '1990-01-01';

/* Afficher les groupes de voyage dont la confidentialité n’est pas renseignée */
SELECT * FROM groupe_voyage WHERE confidentialite_groupe IS NULL 




Découvertes jointures :

/* Pour chaque évenement, afficher le nom, la date et l’heure, ainsi que le nom et le prénom de son créateur */

SELECT nom_evenement, date_evenement, heure_evenement, nom, prenom FROM evenement 
JOIN utilisateur
ON evenement.id_utilisateur_createur = utilisateur.id_utilisateur


/* Pour chaque message envoyé par le (ou  les) utilisateur « dupond », afficher les informations
 de l’utilisateur, et le contenu et la date du message */

 SELECT prenom,nom,ville,date_naissance,confidentialite_user,email,mot_de_passe,pays,date_message
 heure_message, contenu_message FROM message
 JOIN utilisateur
 ON message.id_utilisateur = utilisateur.id_utilisateur




 Jointures : 

 /*1. Liste des publications et des utilisateurs qui les ont créées */ 

SELECT prenom ,nom, email ,ville, titre_publication, contenu_publication  FROM publication
JOIN utilisateur
ON publication.id_utilisateur = utilisateur.id_utilisateur


/*2. Liste des publications de l’utilisateur ‘toto’  */

SELECT prenom, titre_publication, contenu_publication  FROM publication
JOIN utilisateur
ON publication.id_utilisateur = utilisateur.id_utilisateur WHERE prenom ='alea'


/*3. Liste des utilisateurs ayant aimé (liké) une publication donnée (par son id) */

SELECT prenom,nom,email,id_like FROM utilisateur
JOIN _like
ON _like.id_utilisateur = utilisateur.id_utilisateur WHERE id_publication = 9

/* 4. Liste des utilisateurs ayant aimé (liké) une publication donnée (par son titre) */


SELECT nom,prenom,titre_publication FROM _like
JOIN utilisateur ON utilisateur.id_utilisateur = _like.id_utilisateur
JOIN publication ON _like.id_publication = publication.id_publication WHERE titre_publication = 'voyage Japon'



/*5. Liste des id des publications likées par toto */

SELECT publication.id_publication FROM publication
JOIN _like
ON publication.id_publication = _like.id_like
JOIN utilisateur
ON publication.id_publication = utilisateur.id_utilisateur WHERE prenom ="Hannah"


/* 6. Liste des titres des publications likées par toto */

SELECT publication.titre_publication FROM publication
JOIN _like
ON publication.id_publication = _like.id_like
JOIN utilisateur
ON publication.id_publication = utilisateur.id_utilisateur WHERE prenom ="jesse"

/* 7. Liste des utilisateurs qui ont commenté  et les commentaires qu’ils ont fait (inner join) */

SELECT prenom, nom, contenu_commentaire FROM utilisateur
JOIN commentaire
ON utilisateur.id_utilisateur = commentaire.id_commentaire

/* 8. Liste de tous les utilisateurs, plus les commentaires éventuels qu’ils ont fait (outer join) */ 

SELECT nom, prenom, contenu_commentaire FROM utilisateur
LEFT JOIN commentaire
ON utilisateur.id_utilisateur = commentaire.id_utilisateur;


/* 9. Liste des id des amis d’un utilisateur (connu par son id) */ 

SELECT id_utilisateur_2 FROM amis
WHERE id_utilisateur_1 = 7


/* 10. Liste des id des amis d’un utilisateur (connu par son nom) */

SELECT id_utilisateur_2 FROM amis
JOIN utilisateur
ON amis.id_utilisateur_1 = utilisateur.id_utilisateur WHERE nom = "Benjamin"

/* 11. Liste des noms des amis d’un utilisateur (connu par son id) */

SELECT U.nom, U.prenom FROM utilisateur AS U
JOIN amis ON U.id_utilisateur = amis.id_utilisateur_1 
JOIN utilisateur as U1  ON U1.id_utilisateur = amis.id_utilisateur_2
WHERE U1.id_utilisateur = 7

/* 12. Liste des noms des amis d’un utilisateur (connu par son nom) */ 

SELECT U.nom, U.prenom FROM utilisateur AS U
JOIN amis ON U.id_utilisateur = amis.id_utilisateur_1 
JOIN utilisateur as U1  ON U1.id_utilisateur = amis.id_utilisateur_2
WHERE U1.nom = "Benjamin"


/* 13. Liste des amis de l’utilisateur de Eaton Boyer habitant dans la même ville que lui */

SELECT U.nom, U.prenom FROM utilisateur AS U
JOIN amis ON U.id_utilisateur = amis.id_utilisateur_1 
JOIN utilisateur as U1  ON U1.id_utilisateur = amis.id_utilisateur_2
WHERE  U1.nom = "Boyer" AND U1.prenom ="Eaton" AND U.ville = U1.ville

/* 14.. Liste des participants à un évenement créé par ‘Alea Randolph’  */ 

SELECT U.nom, U.prenom FROM utilisateur AS U




/* 15 Liste des personnes ayant « liké » une des publications de ‘toto’ */


