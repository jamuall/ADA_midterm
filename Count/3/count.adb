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
   begin
      for I in X'Range loop
         if not Exists(Y, X(I)) and op(X(I)) then
            Count := Count + 1;
         end if;
      end loop;
      
      for J in Y'Range loop
         if  Op(Y(J)) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count_of_union;
   
   --grade 3
   function Count_of_difference(X: Vector; Y: Vector) return Natural is
      Count : Natural := 0;
   begin
      for I in X'Range loop
         if not Exists(Y, X(I)) and op(X(I)) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count_of_difference;
   
   function Count_of_repetitions(X:Vector; E: Element) return Natural is
      Count : Natural := 0;
   begin
      for I in X'Range loop
         If X(I) = E then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count_of_repetitions;
   
   function Max_of_repetitions(V: Vector) return Element is
      Elem : Element := V(Index'First);
      Max:  Natural := 0;
   begin
      for I in V'Range loop
         If Count_of_repetitions(V, V(I)) > Count_of_repetitions(V, Elem) and Op(V(I))then
            Elem := V(I);
            Max := Count_of_repetitions(V, V(I));
         end if;
      end loop;
      return Elem;
   end Max_of_repetitions;
   

end Count;
