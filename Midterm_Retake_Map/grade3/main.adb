with Ada.Text_IO, mapP;
use Ada.Text_IO;

procedure Main is
   
   package my_map is new mapP(Character, Integer);
   use my_map;
   
   M: Map(5);
begin
   Put(M, 'A', 3);
   Put(M, 'B', 4);
   Put(M, 'C', 5);
   Put(M, 'D', 6);
   Put(M, 'E', 7);
   Put(M, 'B', 8);
   Put(M, 'F', 9);
   
   Put_Line(Integer'Image(Get(M, 'A')));
   Put_Line(Integer'Image(Get(M, 'B')));
   Put_Line(Integer'Image(Get(M, 'C')));
   Put_Line(Integer'Image(Get(M, 'D')));
   Put_Line(Integer'Image(Get(M, 'E')));
   
   Put_Line(Boolean'Image(Contains(M, 'E'))); 
   Put_Line(Natural'Image(Size(M)));
   
   Remove(M, 'C');
   Put_Line(Boolean'Image(Contains(M, 'C'))); 
   Remove(M, 'C');
   Put_Line(Natural'Image(Size(M)));
   Put_Line(Integer'Image(Get(M, 'D')));
   Put_Line(Integer'Image(Get(M, 'E')));
   
end Main;
