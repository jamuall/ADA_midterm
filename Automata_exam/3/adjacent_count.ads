generic


	type Item is private;
	type Index is (<>);
	type Matrix is array ( Index range <>, Index range <> ) of Item;
	with function Predicate ( I : Item ) return Boolean;

function Adjacent_Count ( M : Matrix; X, Y : Index ) return Natural;
