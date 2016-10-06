function ans = CS4300_RTP_Test()
% CS4300_RTP_Test - Test for resolution theorem prover
% On output:
% ans : results of resolve
% Call:
% CS4300_RTP_Test();
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%
    DP = [];
    DP(1).clauses = [-1,2];
    DP(2).clauses = [1,3];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
    thm = [2];
    vars = [1,2,3,4];
    ans = CS4300_RTP(DP,thm,vars);


end