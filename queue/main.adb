with Ada.Text_IO, Queuep2;
use Ada.Text_IO;

procedure queue2demo is

   type Elem is new Integer;
   type Index is new Positive;
   type My_Array is array(Index range <>) of Elem;
   
   function My_Compare(S: Natural; I: Index) return Boolean is
   begin
      if Index(S) = I then
         return True;
      else return False;
      end if;
   end My_Compare;
   

   package My_Queue is new Queuep2(Elem, Index, My_Array, My_Compare);

   procedure Print_Element(E: Elem) is
   begin
      Put_Line(Elem'Image(E));
   end Print_Element;

   procedure Print_Queue is new My_Queue.ForEach(Print_Element);

   Max: Index := Index'First + 4;
   Q: My_Queue.Queue(Max);
begin

   My_Queue.Own_Enqueue (Q, 1);
   My_Queue.Own_Enqueue (Q, 3);
   My_Queue.Own_Enqueue (Q, 2);
   My_Queue.Own_Enqueue (Q, 5);
   My_Queue.Own_Enqueue (Q, 4);
   Print_Queue(Q);
end queue2demo;
