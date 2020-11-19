with Ada.Text_IO;          use Ada.Text_IO;

package body TH is

	procedure Initialiser(Th: out T_TH) is
	begin
		for i in 1..Capacite loop
			Initialiser(Th(i)); --! Surcharge de Initialiser avec T_LCA
		end loop;
	end Initialiser;

	function Est_Vide (Th : T_TH) return Boolean is
	begin
		for i in 1..Capacite loop
			if not( Est_Vide(Th(i)) ) then
				return False;
			end if;
		end loop;
		return True;
	end;

	function Taille (Th : in T_TH) return Integer is
		Compteur : Integer := 0;
	begin
		for i in 1..Capacite loop
			Compteur := Compteur+Taille(Th(i));
		end loop;
		return Compteur;
	end Taille;


	procedure Enregistrer (Th : in out T_TH ; Cle : in T_Cle ; Donnee : in T_Donnee) is
	begin
		Enregistrer(Th(Hashage(Cle)), Cle, Donnee);
	end Enregistrer;


	function Cle_Presente (Th : in T_TH ; Cle : in T_Cle) return Boolean is
	begin
		return Cle_Presente(Th(Hashage(Cle)), Cle);
	end Cle_Presente;

	function La_Donnee (Th : in T_TH ; Cle : in T_Cle) return T_Donnee is
	begin
		return La_Donnee(Th(Hashage(Cle)), Cle);
	end La_Donnee;

	procedure Supprimer (Th : in out T_TH ; Cle : in T_Cle) is
	begin
		Supprimer(Th(Hashage(Cle)), Cle);
	end Supprimer;


	procedure Vider(Th : in out T_TH) is
	begin
		for i in 1..Capacite loop
			Vider(Th(i));
		end loop;
	end Vider;


	procedure Pour_Chaque (Th : in T_TH) is
		procedure Pour_Chaque_LCA is
			new LCA_Generic.Pour_Chaque(Traiter);
	begin

		for i in 1..Capacite loop
			Pour_Chaque_LCA(Th(i));
		end loop;
		exception
			when others =>  Put_Line("Le traitement a échoué ... on continue");
	end Pour_Chaque;

end TH;
