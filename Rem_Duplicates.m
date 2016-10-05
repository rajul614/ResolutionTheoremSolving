function rem_duplicates = Rem_Duplicates(resolvents)
% CS4300_Rem_Duplicates - removes duplicate resolvents
% On input:
% resolvents: array of conjunctive resolvents
% On output:
% rem_duplicates : array of conjunctive resolvents without duplicates
% Call: (example from Russell & Norvig, p. 252)
% Sr = CS4300_RTP(resolvents);
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%
    rem_duplicates = [];
    rem_counter = 1;
    if(length(resolvents)==1)
        rem_duplicates = resolvents;
        return ;
    end
    
    for i = 1:length(resolvents)
        d1 = resolvents(i).clauses;
        for j = i+1:length(resolvents)
            d2 = resolvents(j).clauses;
            if(isequal(d1, d2))
                resolvents(j).clauses = [0,0];
            end
        end
    end
    
    for i = 1:length(resolvents)
        if(~isequal(resolvents(i).clauses, [0,0]))
            rem_duplicates(rem_counter).clauses = resolvents(i).clauses;
            rem_counter = rem_counter + 1;
        end
    end

end