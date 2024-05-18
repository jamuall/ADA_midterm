generic
	type Cell is (<>);
	with function Rule(C : Cell) return Cell;

package Cellular_Automaton_Package is

	type Cellular_Automaton ( Height, Width : Positive ) is private;

	procedure Run ( CA : in out Cellular_Automaton; N : Natural );
	procedure Iterate ( CA : in out Cellular_Automaton );
	procedure Put ( CA : Cellular_Automaton );

private

	type Board_Matrix is array ( Positive range <>, Positive range <> ) of Cell;
	type Cellular_Automaton ( Height, Width : Positive ) is record
		Board : Board_Matrix ( 1 .. Height, 1 .. Width ) := ( 1 .. Height => ( 1 .. Width => Cell'First ) );
	end record;

end Cellular_Automaton_Package;