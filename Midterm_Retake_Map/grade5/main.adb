with Ada.Text_IO, mapP;
use Ada.Text_IO;

procedure Main is
   
   package my_map is new mapP(Character, Integer);
   use my_map;
   
   procedure Print(A: Integer; B: Integer) is
   begin
      Put(" |" & Integer'Image(A) & " -> " & Integer'Image(B));
   end Print;
   
   package my_map1 is new mapP(Integer, Integer);
   use my_map1;
   
   procedure printingMap is new my_map1.ForEach(Print);
   
   
   M: my_map.Map(5);
   
   A: my_map1.Map(7);
   B: my_map1.Map(8);

begin
   my_map.Put(M, 'A', 3);
   my_map.Put(M, 'B', 4);
   my_map.Put(M, 'C', 5);
   my_map.Put(M, 'D', 6);
   my_map.Put(M, 'E', 7);
   my_map.Put(M, 'B', 8);
   my_map.Put(M, 'F', 9);
   
   Put_Line(Integer'Image(my_map.Get(M, 'A')));
   Put_Line(Integer'Image(my_map.Get(M, 'B')));
   Put_Line(Integer'Image(my_map.Get(M, 'C')));
   Put_Line(Integer'Image(my_map.Get(M, 'D')));
   Put_Line(Integer'Image(my_map.Get(M, 'E')));
   
   Put_Line(Boolean'Image(my_map.Contains(M, 'E'))); 
   Put_Line(Natural'Image(my_map.Size(M)));
   
   my_map.Remove(M, 'C');
   Put_Line(Boolean'Image(my_map.Contains(M, 'C'))); 
   my_map.Remove(M, 'C');
   Put_Line(Natural'Image(my_map.Size(M)));
   Put_Line(Integer'Image(my_map.Get(M, 'D')));
   Put_Line(Integer'Image(my_map.Get(M, 'E')));
   
   Put_Line("##################");
   my_map1.Put(A, 1, 3);
   my_map1.Put(A, 2, 5);
   my_map1.Put(A, 4, 6);
   my_map1.Put(A, 6, 8);
   my_map1.Put(A, 7, 11);
   my_map1.Put(A, 11, 33);
   my_map1.Put(A, 21, 88);
      
   printingMap(A);
   my_map1.Remove(A, 6);
   printingMap(A);

   
   my_map1.Put(B, 1, 3);
   my_map1.Put(B, 2, 5);
   my_map1.Put(B, 4, 6);
   my_map1.Put(B, 6, 8);
   my_map1.Put(B, 7, 11);
   my_map1.Put(B, 11, 33);
   my_map1.Put(B, 21, 88);
   my_map1.Put(B, 22, 90);
   
   if my_map1."<="(A,B) then
      Put_Line("inside2 ");
   end if;

   if my_map1."="(A,B) then
      Put_Line("both inside each other");
   end if;
   
end Main;
