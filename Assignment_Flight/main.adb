with Ada.Text_IO, Ada.Strings.Unbounded, flight_management, Airline_Types;
use Ada.Text_IO, Ada.Strings.Unbounded, flight_management;

procedure Main is
   F : Flight_Data;

   type Elem is new Flight_Data;
   type Index is new Positive;
   type Flight_Array is array(Index range <>) of Elem;

   package My_Airline_1 is new Airline_Types(Elem,Index,Flight_Array,Get_Ticket_Cost,Get_Number_Of_Passengers,Get_Operating_Cost,Is_Flight_Active,Print_Flight_Data, Deactivate_Flight);
   use My_Airline_1;

   Max: Index := Index'First + 3;
   A: Airline(Max);


   Flight1 : Elem;
   Flight2 : Elem;
   Flight3 : Elem;
   Flight4 : Elem;
   Flight5 : Elem;


   FArray : Flight_Array(1..5);

   function High_Cost_Flight(Flight : Elem) return Boolean is
   begin
      return Get_Ticket_Cost(Flight) > 200.0;
   end High_Cost_Flight;

   procedure Record_High_Cost_Flights is new Record_Flights_Conditionally(High_Cost_Flight);

   procedure Reduce_Ticket_Price_By_10(Flight : in out Elem) is
   begin
      Set_Ticket_Cost(Flight, Get_Ticket_Cost(Flight) - 10.0);   -- Subtract 10 from the ticket cost
      if Get_Ticket_Cost(Flight) < 0.0 then  -- Ensure the ticket cost does not go negative
         Set_Ticket_Cost(Flight, 0.0);
      end if;
   end Reduce_Ticket_Price_By_10;

   procedure Apply_Price_Reduction is new Apply_To_All_Active_Flights(Reduce_Ticket_Price_By_10);

begin
   Create_Flight(F, A350, To_Unbounded_String("New York"), To_Unbounded_String("London"), 500.0, True);
   Put_Line("Initial ticket cost: ");
   Print_Flight_Data(F);
   -- modification of ticket cost
   Modify_Ticket_Cost(F, 200.0);

   Put_Line(" ");
   Put_Line("Modified by 200 ticket cost: ");
   Print_Flight_Data(F);

   --  Put_Line("Aircraft: " & TAircraft'Image(Get_Aircraft_Type(F)));
   --  Put_Line("Departure: " & To_String(Get_Departure_City(F)));
   --  Put_Line("Arrival: " & To_String(Get_Arrival_City(F)));
   --  Put_Line("Ticket Cost: " & Dollars'Image(Get_Ticket_Cost(F)));
   --  Put_Line("Operating Cost: " & Dollars'Image(Get_Operating_Cost(F)));
   --  Put_Line("Number of Passengers: " & Get_Number_Of_Passengers(F)'Image);

   Create_Flight(Flight1, A320, To_Unbounded_String("Baku"), To_Unbounded_String("Budapest"), 250.0, False);
   Create_Flight(Flight2, B787, To_Unbounded_String("Budapest"), To_Unbounded_String("Rome"), 200.0, True);
   Create_Flight(Flight3, A350, To_Unbounded_String("Rome"), To_Unbounded_String("Valencia"), 270.0, True);
   Create_Flight(Flight4, A350, To_Unbounded_String("Budapest"), To_Unbounded_String("Paris"), 250.0, True);
   Create_Flight(Flight5, B777, To_Unbounded_String("Budapest"), To_Unbounded_String("Berlin"), 180.0, True);


   FArray := (Flight1, Flight2, Flight3, Flight4, Flight5);

   Put_Line(" ");
   Put("Airline flight capacity: ");
   Put_Line(Get_Flights(A)'Length'Image);
   Create_Airline(A, To_Unbounded_String("WizzAir"));


   Add_Flights(A, FArray); -- Capacity is 4 flights but we add 5, so it gives error as " Cannot add more flights. Maximum capacity reached "

   Put_Line(" ");
   Put_Line("Airline initialized: ");
   Print_Airline_Data(A);

   Put_Line(" ");
   Put_Line("Flights with their original ticket cost");
   Print_All_Flights(A);
   Apply_Price_Reduction(A);
   Put_Line(" ");
   Put_Line("Flights with their reduced ticket cost");
   Print_All_Flights(A);


   Put_Line(" ");
   Record_High_Cost_Flights(A); -- Adds flights if ticket costs more than 200
   Put_Line("Airline data: ");
   Print_Airline_Data(A);

   Put_Line(" ");
   Print_All_Flights(A); -- prints flights that are not recorded because of condition


end Main;
