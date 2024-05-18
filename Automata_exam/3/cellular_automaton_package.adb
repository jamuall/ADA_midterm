with Ada.Text_IO;
package body Cellular_Automaton_Package is

	procedure Run ( CA : in out Cellular_Automaton; N : Natural ) is
	begin
		for I in 1 .. N loop
			Iterate(CA);
			Put(CA);
			Ada.Text_IO.New_Line;
		end loop;
		delay 0.5;
	end Run;
	
	procedure Iterate ( CA : in out Cellular_Automaton ) is
		Temp : Cellular_Automaton := CA;
	begin
		for I in CA.Board'Range(1) loop
			for J in CA.Board'Range(2) loop
				CA.Board(I,J) := Rule( Temp.Board(I,J) );
			end loop;
		end loop;
	end Iterate;
	
	procedure Put ( CA : Cellular_Automaton ) is
	begin
		for I in CA.Board'Range(1) loop
			for J in CA.Board'Range(2) loop
				Ada.Text_IO.Put( Cell'Image( CA.Board(I,J) ) & " " );
			end loop;
			Ada.Text_IO.New_Line;
		end loop;
	end Put;

end Cellular_Automaton_Package;
