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
   
   -- grade 4
   
   function Compare(A, B : Element) return Boolean is
   begin
      If Op(A) and not Op(B) then
         return True;
      else
         return False;
      end if;
   end Compare;
   
   
   function "<"(V1: Vector; V2: Vector) return Boolean is
      Num1, Num2 : Natural := 0;
   begin
      for I in V1'Range loop
         If Op(V1(I)) then 
            Num1 := Num1 + 1;
         end if;
      end loop;
      
      for J in V2'Range loop
         If Op(V2(J)) then 
            Num2 := Num2 + 1;
         end if;
      end loop;
      
      return Num1 < Num2;
   end "<";
   
   -- grade 5
   
   procedure ForEach(V: in out Vector) is
   begin
      for I in V'Range loop
         V(I) := Action(V(I));
      end loop;
   end ForEach;

end Count;
