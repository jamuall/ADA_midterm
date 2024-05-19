procedure migrate_birds(G: in out Grid; Max: Natural) is
begin
   for I in G'Range(1) loop
      for J in G'Range(2) loop
         if G(I,J) >= Max then
            if Index'Pred(I) in G'Range(1) then
               G(Index'Pred(I),J) := G(Index'Pred(I),J) + 1; end if;
            if Index'Succ(I) in G'Range(1) then
               G(Index'Succ(I), J) := G(Index'Succ(I), J) + 1; end if;
            if Index'Pred(J) in G'Range(2) then
               G(I,Index'Pred(J)) := G(I,Index'Pred(J)) + 1; end if;
            if Index'Succ(J)  in G'Range(2) then
               G(I, Index'Succ(J)) := G(I, Index'Succ(J)) + 1; end if;
            G(I,J) := G(I, J) - 4;
         end if;
      end loop;
   end loop;
end migrate_birds;
