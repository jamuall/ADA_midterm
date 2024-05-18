with Adjacent_Count;
generic

	type Cell is (<>);
	with function Rule(C : Cell; N : Natural) return Cell;

package Cellular_Automaton_Package is

	type Coordinate is record
		X : Positive;
		Y : Positive;
		Value : Cell;
	end record;
	
	type Coordinate_Array is array ( Positive range <> ) of Coordinate;

	type Cellular_Automaton ( Height, Width : Positive ) is private;

	CA_Out_Of_Range : exception;

	procedure Init ( InCA : in Coordinate_Array; OutCA : out Cellular_Automaton );
	procedure Run ( CA : in out Cellular_Automaton; N : Natural );
	procedure Iterate ( CA : in out Cellular_Automaton );
	procedure Put ( CA : Cellular_Automaton );

private
	
	type Board_Matrix is array ( Positive range <>, Positive range <> ) of Cell;
	type Cellular_Automaton ( Height, Width : Positive ) is record
		Board : Board_Matrix ( 1 .. Height, 1 .. Width ) := ( 1 .. Height => ( 1 .. Width => Cell'First ) );
	end record;
	
	function Is_Alive ( C : Cell ) return Boolean;
	function Adjacents is new Adjacent_Count( Item => Cell, Index => Positive, Matrix => Board_Matrix, Predicate => Is_Alive );
end Cellular_Automaton_Package;
