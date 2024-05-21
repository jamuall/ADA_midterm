generic
   type Index is (<>);
   type Element is (<>);
   type Vector is array(Index range <>) of Element;
   with function Op(E:Element) return Boolean;

package Count is

   function Exists(V: Vector; E:Element) return Boolean;
   
   
   function Count_of_intersection(X: Vector; Y: Vector) return Natural;
   function Count_of_union(X: Vector; Y:Vector) return Natural;

   
end Count;
