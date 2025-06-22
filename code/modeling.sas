/* ========================================================================= */
/* 📂 03_modeling.sas                                                        */
/* Modélisation logistique pour prédire un niveau de stress élevé           */
/* Objectif : Identifier les variables prédictives du stress chez les étudiants */
/* Auteur : Amir EL HADRI – Juin 2025                                       */
/* ========================================================================= */

libname projet ".";

/* Modèle logistique binaire pour prédire le stress élevé */
proc logistic data=projet.clean descending;
    class sexe(ref="Femme") 
          situation_logement(ref="Famille") 
          utilisation_services_psy(ref="Non") / param=ref;

    model niveau_stress_categoriel = 
          activité_physique 
          temps_devant_ecran 
          niveau_anxiete 
          niveau_depression 
          sexe 
          situation_logement 
          utilisation_services_psy;

    title "Régression logistique pour prédire un stress élevé chez les étudiants";
run;
