with Ada.Text_IO; with Adjacent_Count;
with Cellular_Automaton_Package;

procedure Main is

	type Simple_Cell is (O, I);
	
	function Simple_Rule ( C : Simple_Cell ) return Simple_Cell is
	begin
		if C = Simple_Cell'First then return Simple_Cell'Last;
		else return Simple_Cell'First;
		end if;
	end Simple_Rule;
	
	package Simple_CA is new Cellular_Automaton_Package ( Cell => Simple_Cell, Rule => Simple_Rule );
	
	CA : Simple_CA.Cellular_Automaton(3, 3);

begin

	Simple_CA.Run(CA, 5);

end Main;
