with Ada.Text_IO, birds;
use ADA.Text_IO;

procedure Main is
   type Index is range 1..10;
   type grid is array (Index, Index) of Natural;

   My_Grid : Grid := (others => (others => 1));

   package My_Nestlings is new birds(Index,grid);
   use My_Nestlings;

begin
   Put_Line("Total nestlings: " & Natural'Image(b_count(My_Grid)));
   Put_Line("Is more than Max 110: " & Boolean'Image(more_than(My_Grid, 110)));


end Main;
