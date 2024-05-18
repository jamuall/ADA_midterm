-- Ada Programming mid-term, 2024. Apr 3. COPY THIS TEXT TO EVERY MARK

-- This solution was submitted and prepared by

-- <Name, Neptun ID> for the mid-term of the Ada Programming course.

--  I declare that this solution is my own work.

--  I have not copied or used third-party solutions.

--  I have not passed my solution to my classmates, neither made it public.

 

For each mark create a directory and place the solution for that mark in there (e.g. /2 for mark 2, /3 for mark 3 etc.). Submit only source files, .adb and .ads files (delete .o, .exe etc.) and connected project file .gpr.

 

## Mark 2

 

Implement the `Adjacent_Count` generic function which counts for an element of a matrix the neighbour fields (horizontal, vertical and diagonal) which satisfy a property.

The generic parameters are

* `Item` a definite any type (equality check is possible).

* `Index` discrete type.

* `Matrix` a 2-dimensional array with indefinite `Index` and `Item` elements.

* `Predicate(Item) -> Boolean` a logical function on `Item`.

The function parameters are a Matrix used for computation, X` and `Y` indexes and returning a natural value. It counts for the value of given indexes the number of neighbours that satisfy the Predicate (be careful counting at borders not to index outside the limits).

In demo instantiate the function as `Even_Adjacents`, which counts how many even neighbours are. Use the following snippet for a matrix M of indexes ( 1 .. 5, 1 .. 5 ):

for I in M'range(1) loop

    for J in M'range(2) loop

        M(I, J) := Integer(I * J);

        Ada.Text_IO.Put(Integer'Image(M(I,J)));

    end loop;

    Ada.Text_IO.New_Line;

end loop;

 

Ada.Text_IO.Put( Integer'Image( Even_Adjacents(M, 1, 1) )); --3

Ada.Text_IO.Put( Integer'Image( Even_Adjacents(M, 3, 3) )); --8

Ada.Text_IO.Put( Integer'Image( Even_Adjacents(M, 4, 5) )); --3

Ada.Text_IO.Put( Integer'Image( Even_Adjacents(M, 5, 5) )); --3

 

## Mark 3

Implement a game of life as cellular automaton. A field can be alive or dead. We use well defined rules for iterations to create new fields built from previous ones.

https://conwaylife.com/wiki/Glider

 

First create the `Cellular_Automaton_Package` generic package with the parameters:

* `Cell` discrete type to represent cells.

* `Rule(Cell) -> Cell` function which transforms a cell into a new one.

The package has the `Cellular_Automaton` private record type, `Height` and `Width` positive discriminants. The record has one field `Board`, which should be implemented using a `Height` times `Width` matrix (the matrix type should be private, it is indexed by positives and it has `Cell` elements). The initial value of each field of the matrix of field `Board` should be the first value of the `Cell` type.

The generic package includes the following procedures:

* `Run(Cellular_Automaton, Natural)` executes the number of steps specified by the second parameter on the parameter  automaton. After each step, it draws the automaton and then waits for half a second (`delay 0.5;`).

* `Iterate(Cellular_Automaton)` applies the rules to the previous state of the automaton and then updates the state of the parameter automaton with the new values, call this cell trajectory. Make sure to use the state of the previous track!

* `Put(Cellular_Automaton)` prints the trajectory of the automaton. (It is advisable to write a dividing line as well, and a space between elements.)

The demo presents the task in a sample program by running five iterations. The cells should be enumeration of `O` and `I` elements, and the rule should convert one value to another. Now the track's cells will constantly alternate between one element and another.

I I I

I I I

I I I

 

O O O

O O O

O O O

 

I I I

I I I

I I I

 

O O O

O O O

O O O

 

I I I

I I I

I I I

 

## Mark 4

We will need to initialize the fields, let's implement this in the following way: define 2 public types: `Coordinate' type and `Coordinate_Array` in the generic package `Cellular_Automaton_Package`.

Implement the public `Coordinate' type, which is a three-field record. Its fields are the positive integers `X`, `Y`, and a `Value` field, which indicates what value should take on this coordinate.

The `Coordinate_Array` array type is an array of `Coordinate` type values, with indefinite positive indexing.

Implement the `Init` procedure (additionally to previous mark 3), which expects an outgoing `Cellular_Automaton` and an incoming `Coordinate_Array` parameters, iterates through the latter and assigns the `Value` value to each coordinate.

procedure Init ( InCA : in Coordinate_Array; OutCA : out Cellular_Automaton );

Let's test the program modified in this way; after instantiation add:

C1 : Coordinate := (X => 1, Y => 1, Value => Simple_Cell'Last);

C2 : Coordinate := (X => 2, Y => 3, Value => Simple_Cell'Last);

InCA : Coordinate_Array (1 .. 2) := (C1, C2);

CA : Cellular_Automaton(3, 3);

The run: Init(InCA, CA);  Run(CA, 5);

O I I

I I O

I I I

 

I O O

O O I

O O O

 

O I I

I I O

I I I

 

I O O

O O I

O O O

 

O I I

I I O

I I I

 

## Mark 5

Cellular automata basically determine the new state of a cell from the state of the neighbouring cells of the previous state. So we will need a private helper function to implement this logic.

Let this be the function `Adjacents(Matrix, Positive, Positive) -> Natural', which counts the living neighbours of the coordinates `X' and `Y' of a received matrix (consider it alive if the field is the same as the last value of the Cell type). To do this, let's instantiate the generic function written in the first task (mark 2).

Modify the `Rule` rule so that it expects a `Natural` in addition to the `Cell` parameter, this will be the result of the above function. Make sure to pass the state of the old matrix to the function!

Modify the rule of the main program according to the following logic:

 

* If a cell was dead, then if it had exactly three living neighbours, it should be alive from now on, otherwise it should remain dead.

* If a cell was alive, then if it had two or three living neighbours, it would remain alive, otherwise it would be dead.

Run the above program with the following configuration (`Automaton' is the name of the instantiated generic package):

Config : Automaton.Coordinate_Array := ( (3, 1, I), (3, 2, I), (3, 3, I), (2, 3, I), (1, 2, I));

CA : Automaton.Cellular_Automaton(10,10);

Then run: Automaton.Init(Config, CA); Automaton.Put(CA); Ada.Text_IO.New_Line; Automaton.Run(CA, 3);

O I O O O O O O O O

O O I O O O O O O O

I I I O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

 

O O O O O O O O O O

I O I O O O O O O O

O I I O O O O O O O

O I O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

 

O O O O O O O O O O

O O I O O O O O O O

I O I O O O O O O O

O I I O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

 

O O O O O O O O O O

O I O O O O O O O O

O O I I O O O O O O

O I I O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

O O O O O O O O O O

If all went well, we implemented Conway's Game of Life and got the [Glider shape]( https://conwaylife.com/wiki/Glider).

Have fun with programming!
