generic
   type Index is (<>);
   type Grid is array(Index range <>, Index range <>) of Natural;
   
function Nest_Count(G: Grid) return Natural;
