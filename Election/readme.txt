-- Ada Programming & mid-term, 2022. March. 24. - COPY THIS TEXT TO EVERY MARK

--This solution was submitted and prepared by <Name, Neptun ID> for the mid-term assignment of the Ada Programming course.

-- I declare that this solution is my own work.

â I have not copied or used third-party solutions.

-- I have not passed my solution to my classmates, neither made it public.

-- Studentsâ regulation of Eotvos Lorand University (ELTE Regulations Vol. II. 74/C.) states that as long as

-- a student presents another studentâs work - or at least the significant part of it - as his/her own performance,

-- it will count as a disciplinary fault.

-- The most serious consequence of a disciplinary fault can be dismissal of the student from the University.

 

Implement the generic package of an election_package. The generic parameters are:

* discrete type `Candidates` (type will be enum representing several candidates of election)

 * discrete type `Regions` (type will be enum representing several areas of country for example like Budapest, Debrecen so on)

 

Implement `Election` limited private type with a discriminant `Count` of type Integer which will represent number of `Candidates`. The record has two private typed fields:

* `Regional_Votes` -> matrix type with `Regions` and `Candidates` indexes and Integer elements. This will represent the votes for each candidate from different regions.

* `Final_Votes` -> array of Integer with index of `Candidates`. This will represent final votes result based on regional votes. Initially all of the final votes are 0.

 

**NOTE:**

* In a demo program instantiate the package with these types:

** type Candidates is (Rasul, Bill, Jill, Will, Nill);

** type Regions is (Budapest, Pecs, Gyor, Debrecen, Szeged);

* For each mark illustrate and test extensively the operations of the specific mark (keep also the previous marks' tests).

 

For Grade 2:

* Implement in election_package.ads file the generic specification given above.

* Implement `Initialize_Regional_Votes` operation which fills `Regional_Votes` matrix with random integers between 0 and 50. Random generating example can be found below.

** procedure Initialize_Regional_Votes (E : in out Election);

* Implement `Finalize_Votes` operation which fills `Final_Votes` array based on calculations from each region according to candidates. For example: Rasul got 10 votes from each region, and if we have 5 regions then total should be 50.

** procedure Finalize_Votes (E : in out Election);

* Implement `Final_Vote_Of_Candidate` operation which will return the given candidateâs total votes.

** function Final_Vote_Of_Candidate(E : Election; C : Candidates) return Integer;

* Implement `Regional_Vote_Of_Candidate` operation which will return regional votesâ number based on the given region and candidate parameters.

** function Regional_Vote_Of_Candidate(E : Election; R : Regions; C : Candidates) return Integer;

 

For Grade 3:

Add the following operations to the previous mark:

* Implement `Find_First_Place` operation which will return the candidate who has the most total votes.

** function Find_First_Place (E : Election) return Candidates;

* Implement `Find_Last_Place` operation which will return the candidate who has the least total votes.

** function Find_Last_Place (E : Election) return Candidates;

* Implement `Find_N_th_Place` operation which will return candidate who has the nth most total votes.

** function Find_N_th_Place (E : Election; N : Integer) return Candidates;

* Implement `compare_Candidates` will return true if C1's total votes will be greater than C2's total votes, false otherwise

** function compare_Candidates (E : Election; C1 : Candidates; C2 : Candidates) return Boolean;

 

For Grade 4:

Add the following operations to the previous mark:

* Implement `Calculate_Percentage_Of_Candidate` operation which will return float percentage for a candidate total votes over all votes around election.

** function Calculate_Percentage_Of_Candidate (E : Election; C : Candidates) return Float;

* Implement `Calculate_Regional_Percentage_Of_Candidate` operation which will return float percentage for a candidate of a specific region.

** function Calculate_Regional_Percentage_Of_Candidate (E : Election; R : Regions; C : Candidates) return Float;

* Implement `Print` operation which will print regional votes if B is true, otherwise print total votes.

** procedure Print (E : Election; B : Boolean := True);

 

For Grade 5:

Add the following operations to the previous marks:

* Create a generic procedure `ForEach` inside the package with a region parameter, which performs an Action function parameter on the Region parameter and every candidate of the `Regional_Votes`. For example, if the Region is Budapest and the action is decreasing votes by 10 (this is the actual Action in the main program), then for all the votes of each candidate in the region Budapest, it should be decreased by 10.

** procedure ForEach ( E : in out Election; R : Regions );

* In the demo

** Create a function my_action which takes an integer and returns it subtracted by 10. If votes go below 0, assign 0 to it.

** Instantiate my_ForEach using my_action function and test it extensively on the Elections.

 

Example for Random integer generating.

```

with Ada.Numerics.Discrete_Random, Ada.Integer_Text_IO, Ada.Text_IO;

use Ada.Integer_Text_IO, Ada.Text_IO;

 

    procedure test is

      package Random_int is new Ada.Numerics.Discrete_Random (Integer);

      G : Random_int.Generator;

    begin

      Random_int.Reset(G);

 

      for i in 1..10 loop

        Put("random Integer : ");

        Put(Random_int.Random(G));

        new_line;

      end loop;

     

    end test;

```
