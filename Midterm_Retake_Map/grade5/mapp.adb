With ADA.Text_IO;
use ADA.Text_IO;

package body mapP is

   function Size(M: Map) return Natural is
   begin
      return M.Pointer;
   end Size;
   
   
   function Contains(M: Map; K:Key) return Boolean is
   begin
      for I in 0..M.Pointer-1 loop
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
            M.Data(M.Pointer).PKey := K;
            M.Data(M.Pointer).PValue := V;
            M.Pointer := M.Pointer + 1;
         else
            Put_Line("No Space Left");
         end if;
         
      end if;
   end Put;
   
   function Get(M: Map; K: Key) return Value is
      val: Value;
   begin 
      for I in 0..M.Pointer-1 loop
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
         for I in 0..M.Pointer-1 loop
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
   
   procedure ForEach (M: Map) is
   begin
      for I in 0..M.Pointer-1 loop
         Action(M.Data(I).PKey, M.Data(I).PValue);
      end loop;
      New_Line;
   end ForEach;

   function "<="(M1,M2 : Map) return Boolean is
      exist : Boolean := false;
   begin
      for I in 0..M1.Pointer-1 loop
         for J in 0..M2.Pointer-1 loop
            if M2.Data(J).PKey = M1.Data(I).PKey and M2.Data(J).PValue = M1.Data(I).PValue then
               exist := True;
            end if;
         end loop;
         if not exist then
            return False;
         end if;
         exist := False;
      end loop;
      return True;
   end "<=";
   
   function "="(M1,M2 : Map) return Boolean is
   begin
      return M1 <= M2 and M2 <= M1;
   end "=";

end mapP;
