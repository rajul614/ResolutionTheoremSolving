function rem_duplicates = Rem_Duplicates(resolvents)
% CS4300_Rem_Duplicates - resolution theorem prover
% On input:
% sentences (CNF data structure): array of conjuctive clauses
% (i).clauses
% each clause is a list of integers (- for negated literal)
% thm (CNF datastructure): a disjunctive clause to be tested
% vars (1xn vector): list of variables (positive integers)
% On output:
% Sip (CNF data structure): results of resolution
% []: proved sentence |- thm
% not []: thm does not follow from sentences
% Call: (example from Russell & Norvig, p. 252)
% DP(1).clauses = [-1,2,3,4];
% DP(2).clauses = [-2];
% DP(3).clauses = [-3];
% DP(4).clauses = [1];
% thm = [4];
% vars = [1,2,3,4];
% Sr = CS4300_RTP(DP,thm,vars);
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
        d1 = resolvents(i).resolvent;
        for j = i+1:length(resolvents)
            d2 = resolvents(j).resolvent;
            if(isequal(d1, d2))
                resolvents(j).resolvent = [0,0];
            end
        end
    end
    
    for i = 1:length(resolvents)
        if(~isequal(resolvents(i).resolvent, [0,0]))
            rem_duplicates(rem_counter).resolvent = resolvents(i).resolvent;
            rem_counter = rem_counter + 1;
        end
    end

end