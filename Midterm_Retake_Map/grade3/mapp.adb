With ADA.Text_IO;
use ADA.Text_IO;

package body mapP is

   function Size(M: Map) return Natural is
   begin
      return M.Pointer;
   end Size;
   
   
   function Contains(M: Map; K:Key) return Boolean is
   begin
      for I in 0..M.Pointer loop
         if M.Data(I).PKey = K then
            return True;
         end if;
      end loop;
      return False;
   end Contains;
   
   procedure Put(M: in out Map; K:Key; V: Value) is
      Exists : Boolean := False;
      Num: Natural;
   begin
      for I in 0..M.Pointer loop
         if M.Data(I).PKey = K then
            Exists := True;
            Num := I;
            exit;
         end if;
      end loop;
      
      if Exists then
         M.Data(Num).PValue := V;
      else
         if M.Pointer < M.Max then
            M.Pointer := M.Pointer + 1;
            M.Data(M.Pointer).PKey := K;
            M.Data(M.Pointer).PValue := V;
         else
            Put_Line("No Space Left");
         end if;
         
      end if;
   end Put;
   
   function Get(M: Map; K: Key) return Value is
      val: Value;
   begin 
      for I in 0..M.Pointer loop
         if M.Data(I).PKey = K then
            val := M.Data(I).PValue;
         end if;
      end loop;
      return val;
   end Get;
   
   procedure Remove(M: in out Map; K: Key) is
      isExist : Boolean := Contains(M, K);
      num: natural;
   begin
      if isExist then
         for I in 0..M.Pointer loop
            if M.Data(I).PKey = K then
               num := I;
            end if;
         end loop;
         
         for J in num..M.Pointer-1 loop
            M.Data(J).PKey := M.Data(J+1).PKey;
            M.Data(J).PValue := M.Data(J+1).PValue;
         end loop;
         
         M.Pointer := M.Pointer - 1;
         
      else
         Put_Line("Key not found");
      end if;
            
   end Remove;
   

end mapP;
