with Ada.Text_IO;

package body Cellular_Automaton_Package is

	procedure Init ( InCA : in Coordinate_Array; OutCA : out Cellular_Automaton ) is
	begin

		for I in InCA'Range loop		
			if 1 < OutCA.Board'First(1) or  1 < OutCA.Board'First(2) or InCA(I).X > OutCA.Board'Last(1) or InCA(I).Y > OutCA.Board'Last(2) then
				raise CA_Out_Of_Range;
			end if;

			OutCA.Board(InCA(I).X, InCA(I).Y) := InCA(I).Value;
		
		end loop;

	end Init;
	
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
				CA.Board(I,J) := Rule( Temp.Board(I,J), Adjacents(Temp.Board, I, J) );
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
	
   function Is_Alive ( C : Cell ) return Boolean is 
   begin return C = Cell'Last; end Is_Alive;

end Cellular_Automaton_Package;
