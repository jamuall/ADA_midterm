generic
   type Key is (<>);
   type Value is (<>);


package mapP is

   type Map(Max: Natural) is private;

   function Size(M: Map) return Natural;
   function Contains(M: Map; K:Key) return Boolean;
   procedure Put(M: in out Map; K:Key; V: Value);
   function Get(M: Map; K: Key) return Value;
   
private
   
   type Pair is record
      PKey: Key;
      PValue: Value;
   end record;
 
   type m_array is array (Natural range <>) of Pair;
   
   type Map(Max: Natural) is record 
      Data: m_array(0..Max);
      Pointer: Natural := 0;
   end record;


end mapP;
