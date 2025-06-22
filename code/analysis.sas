/* ========================================================================= */
/* 📂 02_analysis.sas                                                         */
/* Analyse descriptive des variables liées à la santé mentale étudiante     */
/* Objectif : Explorer les tendances, corrélations et comportements          */
/* Auteur : Amir EL HADRI – Juin 2024                                        */
/* ========================================================================= */

libname projet ".";

/* Fréquences croisées entre le genre et le recours aux services psy */
proc freq data=projet.clean;
    title "Table de contingence : Sexe x Utilisation des services psy";
    tables sexe*utilisation_services_psy / chisq; /* Test du chi² */
run;

/* Fréquences de la situation de logement */
proc freq data=projet.clean;
    title "Répartition des situations de logement";
    tables situation_logement / nocum;
run;

/* Statistiques descriptives des variables continues */
proc means data=projet.clean mean std min max n;
    title "Statistiques descriptives des comportements et scores psychologiques";
    var activité_physique temps_devant_ecran niveau_anxiete niveau_depression;
run;

/* Corrélation entre variables comportementales et psychologiques */
proc corr data=projet.clean;
    title "Corrélations entre comportements et indicateurs psychologiques";
    var activité_physique temps_devant_ecran niveau_anxiete niveau_depression;
run;

/* Visualisation : part d'utilisation des services psy par sexe */
proc sgplot data=projet.clean;
    title "Recours aux services psy selon le genre";
    vbar sexe / group=utilisation_services_psy stat=percent datalabel;
run;
