generic
   type Element is (<>);
   type Index is (<>);
   type Grid is array(Index range <>, Index range <>) of Element;
   with function Predicate (I : Element) return Boolean;
   
function Count_Value(G: Grid) return Natural;
