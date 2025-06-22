/* ========================================================================= */
/* 📂 01_cleaning.sas                                                        */
/* Projet personnel : Santé mentale des étudiants en France                  */
/* Objectif : Importer le fichier CSV, nettoyer les données, créer des      */
/*            variables dérivées utiles pour l'analyse et la modélisation.  */
/* Auteur : Amir EL HADRI – Juin 2024                                       */
/* ========================================================================= */

libname projet "."; /* Création d'une bibliothèque de travail locale */

/* Étape d'importation du fichier CSV */
data projet.clean;
    infile "etudiants_sante_mentale.csv" dlm=',' firstobs=2 dsd;
    input id 
          age 
          sexe :$10. 
          situation_logement :$25. 
          activité_physique 
          temps_devant_ecran 
          perception_stress 
          niveau_anxiete 
          niveau_depression 
          utilisation_services_psy :$5.;

    /* Remplacement des valeurs manquantes dans 'niveau_anxiete' */
    if niveau_anxiete = . then niveau_anxiete = .N;

    /* Création d'une variable binaire de stress élevé (1 si score > 7) */
    niveau_stress_categoriel = (perception_stress > 7);

    label niveau_stress_categoriel = "Stress élevé (1 = oui)";
run;
