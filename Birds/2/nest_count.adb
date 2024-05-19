function Nest_Count(G: Grid) return Natural is
   Count : Natural := 0;
   
begin
   for I in G'Range(1) loop
      for J in G'Range(2) loop
           Count := Count + G(I,J);
      end loop;
   end loop;
   return Count;
end Nest_Count;
