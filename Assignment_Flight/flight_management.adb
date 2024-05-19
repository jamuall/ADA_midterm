with Ada.Text_IO, Ada.Strings.Unbounded; 
use Ada.Text_IO,Ada.Strings.Unbounded;

package body flight_management is

   function Is_WideBody(Aircraft: TAircraft) return Boolean is
   begin
      return Aircraft in B787 | A350 | B777 | A380;
   end Is_WideBody;


   function Calculate_Operating_Cost(Departure, Arrival : Unbounded_String; Aircraft : TAircraft; Is_Widebody : Boolean) return Dollars is
      NumOfPassengers : Integer := Integer(TAircraft'Enum_Rep(Aircraft));
      Multiplier : integer := (if Is_WideBody then 2 else 1);
      Distance : integer := abs(Length(Departure) - Length(Arrival));
      begin
      return Dollars(Distance * NumOfPassengers * 50 * Multiplier);
      end Calculate_Operating_Cost;
   
   procedure Create_Flight(F : out Flight_Data; Aircraft : TAircraft; Departure, Arrival : Unbounded_String; Ticket_Cost : Dollars; Is_Widebody : Boolean) is
      begin
       F.Aircraft_Type := Aircraft;
       F.Departure_City := Departure;
       F.Arrival_City := Arrival;
       F.Ticket_Cost := Ticket_Cost;
       F.Operating_Cost := Calculate_Operating_Cost(Departure, Arrival, Aircraft, Is_Widebody);
      end Create_Flight;
   
   function Get_Operating_Cost(F : Flight_Data) return Dollars is
      begin
      return Dollar_To_Float(F.Operating_Cost);
      end Get_Operating_Cost;

   -- Implementations of getters
   function Get_Aircraft_Type(F : Flight_Data) return TAircraft is
   begin
      return F.Aircraft_Type;
   end Get_Aircraft_Type;

   function Get_Departure_City(F : Flight_Data) return Unbounded_String is
      begin
      return F.Departure_City;
      end Get_Departure_City;

   function Get_Arrival_City(F : Flight_Data) return Unbounded_String is
      begin
      return F.Arrival_City;
      end Get_Arrival_City;


   function Get_Ticket_Cost(F : Flight_Data) return Dollars is
      begin
      return Dollar_To_Float(F.Ticket_Cost);
      end Get_Ticket_Cost;

   function Get_Number_Of_Passengers(F : Flight_Data) return Integer is
      begin
      return Integer(TAircraft'Enum_Rep(F.Aircraft_Type));
      end Get_Number_Of_Passengers;

   -- Setters
   procedure Set_Ticket_Cost(F: in out Flight_Data; New_Cost : Dollars) is
      begin
      F.Ticket_Cost := New_Cost;
      end Set_Ticket_Cost;

   procedure Modify_Ticket_Cost(F : in out Flight_Data; Amount : Dollars) is
      begin
      F.Ticket_Cost := F.Ticket_Cost + Amount;
      end Modify_Ticket_Cost;

   procedure Print_Flight_Data(F : Flight_Data) is
      begin
      Put("{");
      Put("Aircraft: " & TAircraft'Image(F.Aircraft_Type));
      Put(", Departure: " & To_String(F.Departure_City));
      Put(", Arrival: " & To_String(F.Arrival_City));
      Put(", Ticket Cost: " & Dollars'Image(F.Ticket_Cost));
      Put(", Operating Cost: " & Dollars'Image(F.Operating_Cost));
      Put("}");
      New_Line;
   end Print_Flight_Data;
   
   function Dollar_To_Float(D : Dollars) return Float is
   begin
      return Float(D);
   end Dollar_To_Float;
   
   procedure Deactivate_Flight(F : in out Flight_Data) is
   begin
      F.Is_Active := False;
   end Deactivate_Flight;
   
   function Is_Flight_Active(F : Flight_Data) return Boolean is
   begin
      return F.Is_Active;
   end Is_Flight_Active;

end flight_management;
