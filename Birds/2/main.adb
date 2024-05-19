with ADA.Text_IO, Nest_Count;
use ADA.Text_IO;
procedure Main is
   type my_Grid is array (Integer range <>, Integer range <>) of Natural;
   function my_Nest_Count is new Nest_Count(Integer, my_Grid);

   M: my_Grid(1..10, 1..10);
   -- M : my_Grid(1..10, 1..10) := (others => (others => 1)); --possible implementation



begin

   for I in M'range(1) loop
      for J in M'range(2) loop
         if I = J then
            M(I, J) := 1;
            Put(Integer'Image(M(I,J)));
         else
            M(I,J) := 0;
            Put(Integer'Image(M(I,J)));
         end if;
         end loop;
         New_Line;
      end loop;
      New_Line;

      Put_Line("Count: " & Integer'Image(my_Nest_Count(M)));



end Main;
