function Sip = CS4300_RTP(sentences,thm,vars)
% CS4300_RTP - resolution theorem prover
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

clauses = [];
new = [];
while 1
    for c1 = 1:length(sentences)
        for c2 = c1+1:length(sentences)
            resolvents = CS4300_PL_Resolve(sentences(c1).clauses, sentences(c2).clauses);
            if Contains_Empty_Clause(resolvents)
               Sip = 1;
               return;
            end
            new = [new resolvents];
            new = Rem_Duplicates(new);
        end
    end
    
    if Is_Subset(new, sentences)
        Sip = 0;
        return;
    end
    
    clauses = [clauses new];
    clauses = Rem_Duplicates(clauses);
end
end

function contains_empty = Contains_Empty_Clause(resolvents)
    contains_empty = 0;
    for i = 1:length(resolvents)
        if isempty(resolvents(i).resolvent)
            contains_empty = 1;
            return;
        end
    end
end

function is_subset = Is_Subset(new, sentences)
    is_subset = 0;
    counter = 0;
    for r1 = 1:length(new)
        currentNew = new(r1);
        for r2 = 1:length(sentences)
            currentSentence = sentences(r2);
            if isequal(currentNew, currentSentence)
                counter = counter + 1;
            end            
        end
    end
    if counter == length(new)
        is_subset = 1;
    end
end