generic
   type Elem is private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
   with function "="(S: Natural; I: Index) return Boolean is <>;
   with function "mod"(I1, I2: Index) return Index is <>;

package Queuep2 is

   type Queue(Max: Index) is limited private;
   
   procedure Own_Enqueue(Q: in out Queue; E: in Elem);
   procedure Own_Dequeue(Q: in out Queue; E: out Elem);
   
   function Get_First(Q: Queue) return Elem;
   function Is_Empty(Q: Queue) return Boolean;
   function Is_Full(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;
   
   generic
      with procedure Process_Element(Item: in Elem);
   procedure ForEach(Q: in Queue);
   
private
   
   type Queue(Max: Index) is record
      Data: TArray(Index'First..Max);
      Last, First: Index := Index'First;
      Size: Natural := 0;
   end record;

end Queuep2;
