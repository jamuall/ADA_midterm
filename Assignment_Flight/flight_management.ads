with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package flight_management is
   
   type TAircraft is (A320, B787, A350, B777, A380);
   for TAircraft use (144, 311, 395, 412, 517);
   
   subtype Dollars is Float range 0.0 .. Float'Last;
   
   type Flight_Data is private;
   
   function Is_WideBody(Aircraft: TAircraft) return Boolean;

   function Calculate_Operating_Cost(Departure, Arrival : Unbounded_String; Aircraft : TAircraft; Is_Widebody : Boolean) return Dollars;
   
   procedure Create_Flight(F: out Flight_Data; Aircraft : TAircraft; Departure, Arrival : Unbounded_String; Ticket_Cost : Dollars; Is_Widebody : Boolean);
   
   function Get_Aircraft_Type(F: Flight_Data) return TAircraft;
   function Get_Departure_City(F : Flight_Data) return Unbounded_String;
   function Get_Arrival_City(F : Flight_Data) return Unbounded_String;
   function Get_Ticket_Cost(F : Flight_Data) return Dollars;
   function Get_Operating_Cost(F : Flight_Data) return Dollars;
   function Get_Number_Of_Passengers(F : Flight_Data) return Integer;

   procedure Set_Ticket_Cost(F : in out Flight_Data; New_Cost : Dollars);
   procedure Modify_Ticket_Cost(F : in out Flight_Data; Amount : Dollars);
   procedure Print_Flight_Data(F : Flight_Data);
   
   function Dollar_To_Float(D : Dollars) return Float;
   function Is_Flight_Active(F : Flight_Data) return Boolean;
   procedure Deactivate_Flight(F : in out Flight_Data);

   
private
   type Flight_Data is record
      Aircraft_Type : TAircraft;
      Departure_City : Unbounded_String;
      Arrival_City : Unbounded_String;
      Ticket_Cost : Dollars;
      Operating_Cost : Dollars;
      Is_Active : Boolean := True;
      end record;

   
end flight_management;
