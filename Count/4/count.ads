generic
   type Index is (<>);
   type Element is (<>);
   type Vector is array(Index range <>) of Element;
   with function Op(E:Element) return Boolean;
package Count is

   function Exists(V: Vector; E:Element) return Boolean;   
   function Count_of_intersection(X: Vector; Y: Vector) return Natural;
   function Count_of_union(X: Vector; Y:Vector) return Natural;

   -- grade 3
   function Count_of_difference(X: Vector; Y: Vector) return Natural;
   function Count_of_repetitions(X:Vector; E: Element) return Natural;
   function Max_of_repetitions(V: Vector) return Element;
   
   -- grade 4
   
   function Compare(A, B : Element) return Boolean;
   function "<"(V1: Vector; V2: Vector) return Boolean;

end Count;
