with Ada.Text_IO; with Adjacent_Count;
with Cellular_Automaton_Package;

procedure Main is

	type Game_Cell is (O, I);
	
	function Game_Rule ( C : Game_Cell; N : Natural ) return Game_Cell is
	begin
		if C = Game_Cell'First then
			if N = 3 then return Game_Cell'Last;
			else return Game_Cell'First; end if;
		else
			if N = 2 or N = 3 then return Game_Cell'Last;
			else return Game_Cell'First; end if;
		end if;
	end Game_Rule;
	
	package Automaton is new Cellular_Automaton_Package ( Cell => Game_Cell, Rule => Game_Rule );

	Config : Automaton.Coordinate_Array := ( (3, 1, I), (3, 2, I), (3, 3, I), (2, 3, I), (1, 2, I));
	CA : Automaton.Cellular_Automaton(10,10);

begin

	Automaton.Init(Config, CA);
	Automaton.Put(CA); Ada.Text_IO.New_Line;
	Automaton.Run(CA, 3);

end Main;
