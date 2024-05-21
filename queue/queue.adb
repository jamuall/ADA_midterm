package body Queuep2 is

   procedure Own_Enqueue (Q : in out Queue; E : in Elem) is
   begin
      Q.Data (Q.Last) := E;
      Q.Last          := Index'Succ(Q.Last mod Q.Max);
      Q.Size          := Q.Size + 1;
   end Own_Enqueue;

   procedure Own_Dequeue (Q : in out Queue; E : out Elem) is
   begin
      E       := Get_First (Q);
      Q.First := Index'Succ(Q.First mod Q.Max);
      Q.Size  := Q.Size - 1;
   end Own_Dequeue;

   function Get_First (Q : Queue) return Elem is
   begin
      return Q.Data (Q.First);
   end Get_First;

   function Is_Empty (Q : Queue) return Boolean is
   begin
      return Size (Q) = 0;
   end Is_Empty;

   function Is_Full (Q : Queue) return Boolean is
   begin
      return Q.Size = Q.Max;
   end Is_Full;

   function Size (Q : Queue) return Natural is
   begin
      return Q.Size;
   end Size;
   
   procedure ForEach(Q: in Queue) is 
   begin
      for I in Q.First..Q.Max loop
         Process_Element(Q.Data(I));
      end loop;
   end ForEach;

end Queuep2;
