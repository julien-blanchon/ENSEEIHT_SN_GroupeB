with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
	--! Les Unbounded_String ont une capacité variable, contrairement au String
	--! pour lesquelles une capacité doit être fixée.
with LCA;

procedure LCA_Sujet is

	package LCA_String_Integer is
		new LCA (T_Cle => Unbounded_String, T_Donnee => Integer);
	use LCA_String_Integer;

	Mon_LCA : T_LCA; --! LCA_String_Integer.T_LCA

	-- Afficher une Unbounded_String et un entier.
	procedure Afficher (S: in Unbounded_String; N: in Integer) is
	begin
		Put (To_String(S));
		Put (" : ");
		Put (N, 1);
		New_Line;
	end Afficher;

	-- Afficher la Sda.
	procedure Afficher_Pour_Chaque is
		new Pour_Chaque (Afficher);

begin
	Initialiser (Mon_LCA);
	Enregistrer (Mon_LCA, To_Unbounded_String("un"), 10);
	Enregistrer (Mon_LCA, To_Unbounded_String("deux"), 20);
	Afficher_Pour_Chaque (Mon_LCA);
	Vider(Mon_LCA);
end LCA_Sujet;
