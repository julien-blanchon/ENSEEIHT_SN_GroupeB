%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token PROCESS ACTIVITY REQUIRES STARTS FINISHES IF STARTED FINISHED
%token RESOURCE AMOUNT
%token LEFT_BRACE RIGHT_BRACE
/* Defini le type des donnees associees a l'unite lexicale */
%token <int> NUMBER
%token <string> IDENTIFIER
/* Unite lexicale particuliere qui represente la fin du fichier */
%token END

/* Type renvoye pour le nom terminal fichier */
%type <unit> fichier

/* Le non terminal fichier est l'axiome */
%start fichier

%% /* Regles de productions */

fichier : processus END { (print_endline "fichier : processus END") }

processus : PROCESS IDENTIFIER LEFT_BRACE elements RIGHT_BRACE { (print_endline "processus : process IDENTIFIER { elements }") }

elements : /* Lambda, mot vide */ { (print_endline "elements : /* Lambda, mot vide */") }
              | element elements { (print_endline "elements : element elements") }

element : activite { (print_endline "element : activite") }
	| resource { (print_endline "element : resource") }

resource : RESOURCE IDENTIFIER AMOUNT NUMBER { (print_endline "resource : resource IDENTIFIER amount NUMBER") }

activite : ACTIVITY IDENTIFIER exigences contraintes { (print_endline "activite : activity IDENTIFIER contraintes") }
            | ACTIVITY IDENTIFIER LEFT_BRACE elements RIGHT_BRACE exigences contraintes { (print_endline "activite : activity IDENTIFIER {elements} exigences contraintes") }

exigences : /* Lambda, mot vide */ { (print_endline "exigences : /* Lambda, mot vide */") }
            | requires exigences { (print_endline "exigences : REQUIRES") }

requires : /* Lambda, mot vide */ { (print_endline "requires : /* Lambda, mot vide */") }
           | REQUIRES NUMBER IDENTIFIER { (print_endline "requires : require NUMBER IDENTIFIER") }       

contraintes : /* Lambda, mot vide */ { (print_endline "contraintes : /* Lambda, mot vide */") }
              | contrainte contraintes { (print_endline "contraintes : contrainte contraintes") }

contrainte : action IF IDENTIFIER etat { (print_endline "contrainte : action if IDENTIFIER etat") }

action : STARTS { (print_endline "action : STARTS") }
         | FINISHES { (print_endline "action : FINISHES") }

etat : STARTED { (print_endline "etat : STARTED") }
         | FINISHED { (print_endline "etat : FINISHED") }

%%
