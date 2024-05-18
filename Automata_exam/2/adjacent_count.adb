function Adjacent_Count ( M : Matrix; X, Y : Index ) return Natural is
Count : Natural := 0;

begin

	for I in Index'Pred(X) .. Index'Succ(X) loop	
		for J in Index'Pred(Y) .. Index'Succ(Y) loop		
			if I in M'Range(1) and J in M'Range(2) then
				if ( I /= X or J /= Y ) and Predicate ( M(I,J) ) then count := count + 1; end if;
			end if;		
		end loop;
	end loop;
	return Count;
end Adjacent_Count;
