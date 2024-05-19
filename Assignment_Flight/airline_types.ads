with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

generic
   type Elem is private;
   type Index is (<>);
   type Flight_Array is array (Index range <>) of Elem;
   with function Get_Ticket_Cost(Flight : Elem) return Float;
   with function Get_Number_Of_Passengers(Flight : Elem) return Natural;
   with function Get_Operating_Cost(Flight : Elem) return Float;
   with function Is_Flight_Active(F : Elem) return Boolean;
   with procedure Print_Flight_Data(Flight : Elem);
   with procedure Deactivate_Flight(F : in out Elem);

   
package Airline_Types is
   subtype Dollars is Float range 0.0 .. Float'Last;

   
   type Airline(Max_Flights : Index) is private;
   procedure Create_Airline(A: out Airline; Name: Unbounded_String);
   procedure Add_Flights(A: in out Airline; FArray : Flight_Array);
   function Get_Flights(A: in out Airline) return Flight_Array;
   function Profit_or_Loss(A: in out Airline) return Dollars;
   procedure Print_Airline_Data(A : in Airline);
   procedure Print_All_Flights(A : in Airline);
   
   function Dollar_To_Float(D : Dollars) return Float;
   function Float_To_Dollar(F : Float) return Dollars;
  
   generic
      with function Condition_For_Recording(Flight : Elem) return Boolean;
   procedure Record_Flights_Conditionally(A : in out Airline);
   
   generic
      with procedure Modify_Flight_Data(Flight : in out Elem);
   procedure Apply_To_All_Active_Flights(A : in out Airline);

   
private
   
   type Airline(Max_Flights : Index) is record
      Name: Unbounded_String;
      Flights: Flight_Array(Index'First..Max_Flights);
      Revenue : Dollars := 0.0;
      Total_Costs : Dollars := 0.0;
      Total_Passengers : Natural := 0;
   end record;
end Airline_Types;
