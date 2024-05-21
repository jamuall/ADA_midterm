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

   A: Integer_Vector(1..5) := (10,20, 25, 30, 55);
   B: Integer_Vector(1..8) := (5, 10, 15, 20, 25, 30, 35, 40);


   type String_Vector is array(Natural range <>) of Character;

   X: String_Vector(1..8) := "eJamuali";
   Y: String_Vector(1..12) := "OkushPokaber";

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


   Put_Line("Count of union" & Natural'Image( Count_Integer.Count_of_union(A,B)));
   Put_Line("Count of intersection" & Natural'Image( Count_Integer.Count_of_intersection(A,B)));

   Put_Line("Count of union for string" & Natural'Image( Count_Character.Count_of_union(X,Y)));
   Put_Line("Count of intersection for string" & Natural'Image( Count_Character.Count_of_intersection(X,Y)));


end Main;
