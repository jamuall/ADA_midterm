with ADA.Text_IO, Count;
use ADA.Text_IO;

procedure Main is

   type Integer_Vector is array(Natural range <>) of Integer;
   function IsEven(N: Integer) return Boolean is
   begin
      return N mod 2 = 0;
   end IsEven;


   package Count_Integer is new Count(Natural, Integer, Integer_Vector, IsEven);
   use Count_Integer;

   A: Integer_Vector(0..5) := (12, 20, 25, 25, 25, 20);
   B: Integer_Vector(0..8) := (5, 10, 15, 20, 35, 30, 35, 40, 35);


   type String_Vector is array(Natural range <>) of Character;

   X: String_Vector(0..8) := "OeJamuali";
   Y: String_Vector(0..12) := "okushPokaberi";

   function IsVowel(Ch: Character) return Boolean is
      Temp : String := "aeuoiAEUOI";
   begin
         for I in Temp'Range loop
               if Ch=Temp(I) then
                  return True;
               end if;
            end loop;
            return False;
   end IsVowel;

   package Count_Character is new Count(Natural, Character, String_Vector, IsVowel);
   use Count_Character;

begin

   New_Line;
   Put_Line("For Integers: ");
   Put_Line("Count of union" & Natural'Image( Count_Integer.Count_of_union(A,B)));
   Put_Line("Count of intersection" & Natural'Image( Count_Integer.Count_of_intersection(A,B)));
   Put_Line("Count of difference" & Natural'Image( Count_Integer.Count_of_difference(A,B)));
   Put_Line("Count of repetition " & Natural'Image( Count_Integer.Count_of_repetitions(A,25)));
   Put_Line("Element has max of repetitions" & Integer'Image( Count_Integer.Max_of_repetitions(A)));


   New_Line;
   Put_Line("For Strings: ");
   Put_Line("Count of union " & Natural'Image( Count_Character.Count_of_union(X,Y)));
   Put_Line("Count of intersection " & Natural'Image( Count_Character.Count_of_intersection(X,Y)));
   Put_Line("Count of difference" & Natural'Image( Count_Character.Count_of_difference(X,Y)));
   Put_Line("Count of repetition " & Natural'Image( Count_Character.Count_of_repetitions(X,'a')));
   Put_Line("Element has max of repetitions" & Character'Image( Count_Character.Max_of_repetitions(Y)));



end Main;
