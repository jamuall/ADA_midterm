generic 
   type Index is range <>;
   type Grid is array (Index, Index) of Natural; 

package birds is
   function b_count(g: Grid) return Natural;

   -- mark 3
   function more_than(g:Grid; Max: Natural) return boolean;
end birds;
