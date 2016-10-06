function data = CS4300_RTP_Data()
% CS4300_RTP_Data - Driver to get data for RTP
% On output:
% Call:
% CS4300_RTP_Data();
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%
    DP = [];
    DP(1).clauses = [1];
    DP(1).clauses = [2];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
    thm = [1];
    vars = [1,2];
    ans = CS4300_RTP(DP,thm,vars);

    thm = [2];
    ans = CS4300_RTP(DP,thm,vars);


end