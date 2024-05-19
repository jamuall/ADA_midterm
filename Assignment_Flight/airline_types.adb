with Ada.Text_IO; use Ada.Text_IO;
package body Airline_Types is

   procedure Create_Airline (A : out Airline; Name : Unbounded_String) is
   begin
      A.Name := Name;
   end Create_Airline;

   procedure Add_Flights (A : in out Airline; FArray : Flight_Array) is
      Counter : Integer := 0;
   begin
      for I in FArray'Range loop
         if Counter < A.Flights'Length then
            A.Flights (I) := FArray (I);
            Counter       := Counter + 1;
         else
            Put_Line ("Cannot add more flights. Maximum capacity reached");
            return;
         end if;
      end loop;
   end Add_Flights;

   function Get_Flights (A : in out Airline) return Flight_Array is
   begin
      return A.Flights;
   end Get_Flights;

   function Profit_or_Loss (A : in out Airline) return Dollars is
   begin
      return A.Revenue - A.Total_Costs;
   end Profit_or_Loss;

   procedure Print_Airline_Data (A : in Airline) is
   begin
      Put_Line (" { ");
      Put_Line (" Airline Name: " & To_String (A.Name));
      Put_Line (" Revenue: " & Dollars'Image (A.Revenue));
      Put_Line (" Total Costs: " & Dollars'Image (A.Total_Costs));
      Put_Line (" Total Passengers: " & Natural'Image (A.Total_Passengers));
      Put_Line (" }");
   end Print_Airline_Data;

   procedure Print_All_Flights (A : in Airline) is
   begin
      Put_Line ("Flights:");
      for I in A.Flights'Range loop
         if Is_Flight_Active(A.Flights(I)) then
            Print_Flight_Data (A.Flights (I));
         end if;
      end loop;
   end Print_All_Flights;

   procedure Record_Flights_Conditionally(A : in out Airline) is
   begin
   for I in A.Flights'Range loop
      if Condition_For_Recording(A.Flights(I)) and Is_Flight_Active(A.Flights(I)) then
         A.Revenue := A.Revenue + Float_To_Dollar(Get_Ticket_Cost(A.Flights(I)) * Float(Get_Number_Of_Passengers(A.Flights(I))));
         A.Total_Costs := A.Total_Costs + Float_To_Dollar(Get_Operating_Cost(A.Flights(I)));
         A.Total_Passengers := A.Total_Passengers + Get_Number_Of_Passengers(A.Flights(I));
         Deactivate_Flight(A.Flights(I));  -- Mark the flight as inactive
      end if;
   end loop;
   end Record_Flights_Conditionally;

   --  procedure Record_Flights_Conditionally(A : in out Airline) is
   --  Last_Valid_Index : Index := Index'First;  -- Start before the first index to safely increment.
   --  begin
   --  -- Initialize financial and passenger counters.
   --  A.Revenue := 0.0;
   --  A.Total_Costs := 0.0;
   --  A.Total_Passengers := 0;
   --  
   --  -- Loop over each flight.
   --  for I in A.Flights'Range loop
   --     if Condition_For_Recording(A.Flights(I)) then
   --        -- If the condition is met, update airline financials and passenger totals.
   --        A.Revenue := A.Revenue + Float_To_Dollar(Get_Ticket_Cost(A.Flights(I)) * Float(Get_Number_Of_Passengers(A.Flights(I))));
   --        A.Total_Costs := A.Total_Costs + Float_To_Dollar(Get_Operating_Cost(A.Flights(I)));
   --        A.Total_Passengers := A.Total_Passengers + Get_Number_Of_Passengers(A.Flights(I));
   --     else
   --        -- If not, shift this flight down in the array to retain it.
   --        Last_Valid_Index := Index'Succ(Last_Valid_Index);
   --        A.Flights(Last_Valid_Index) := A.Flights(I);
   --     end if;
   --  end loop;
   --  end Record_Flights_Conditionally;

   procedure Apply_To_All_Active_Flights(A : in out Airline) is
   begin
      for I in A.Flights'Range loop
         if Is_Flight_Active(A.Flights(I)) then
            Modify_Flight_Data(A.Flights(I)); -- Apply the function to modify the flight data
         end if;
      end loop;
   end Apply_To_All_Active_Flights;

   function Dollar_To_Float (D : Dollars) return Float is
   begin
      return Float (D);
   end Dollar_To_Float;

   function Float_To_Dollar (F : Float) return Dollars is
   begin
      return Dollars (F);
   end Float_To_Dollar;

end Airline_Types;
