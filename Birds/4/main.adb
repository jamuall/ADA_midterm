with ADA.Text_IO, Count_Value;
use ADA.Text_IO;
procedure Main is
   type my_Grid is array (Integer range <>, Integer range <>) of Natural;

   function moreThan3 (I : Natural) return Boolean is
   begin
      return I >= 3;
   end moreThan3;

   function my_count_value is new Count_Value(Natural, Integer, my_Grid, moreThan3);

   M: my_Grid(1..10, 1..10);



begin

   for I in M'range(1) loop
      for J in M'range(2) loop
         if I = J then
            M(I, J) := 5;
            Put(Integer'Image(M(I,J)));
         else
            M(I,J) := 1;
            Put(Integer'Image(M(I,J)));
         end if;
         end loop;
         New_Line;
   end loop;
   New_Line;

   Put_Line("Number of nests have more than 3 birds: " & Integer'Image( my_count_value(M) ));


end Main;
