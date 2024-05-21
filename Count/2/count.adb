with ADA.Text_IO;
use ADA.Text_IO;

package body Count is

   function Exists(V: Vector; E:Element) return Boolean is
   begin
      for I in V'Range loop
         if V(I) = E then
            return True;
         end if;
      end loop;
      return False;
   end Exists;
   
      
   function Count_of_intersection(X: Vector; Y: Vector) return Natural is
      Count: Natural := 0;
   begin
      for I in X'Range loop
         for J in Y'Range loop
            if X(I) = Y(J) and Op(X(I)) then
                   Count := Count + 1;
                end if;
         end loop;
      end loop;
      return Count;
   end Count_of_intersection;
   
   
   function Count_of_union(X: Vector; Y:Vector) return Natural is
      Count : Natural := 0;
      exist : Boolean := False;
   begin
      for I in X'Range loop
         for J in Y'Range loop
            if X(I) = Y(J) then
               exist:= True;
            end if;
         end loop;
         if not exist and op(X(I)) then
            Count := Count + 1;
         end if;
         exist:= False;
      end loop;
      
      for J in Y'Range loop
         if  Op(Y(J)) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count_of_union;

end Count;
