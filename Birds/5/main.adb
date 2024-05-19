with ADA.Text_IO, migrate_birds;
use ADA.Text_IO;

procedure Main is
   type my_Grid is array (Integer range <>, Integer range <>) of Natural;

   procedure my_migrate is new migrate_birds(Integer, my_Grid);

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

   my_migrate(M, 4);

   Put_Line("New Grid");

   for I in M'range(1) loop
      for J in M'range(2) loop
            Put(Integer'Image(M(I,J)));
         end loop;
         New_Line;
   end loop;
   New_Line;
end Main;
