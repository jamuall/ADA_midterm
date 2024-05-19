with Ada.Text_IO;
use ADA.Text_IO;

package body birds is

   function b_count(g: Grid) return Natural is
      base : Natural := 0;
   begin
      for I in g'Range(1) loop
         for J in g'Range(2) loop
               base := base + g(I,J);
         end loop;
      end loop;
      return base;
   end b_count;
   -- mark3
   function more_than(g:Grid; Max: Natural) return boolean is
   begin
      return b_count(g) >= Max;
   end more_than;

end birds;
