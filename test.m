clc;
clear all;
Succ_TX_ind = [];

TX_time = cell(1,N);
for n=1:N
    ind_TX = find( TX_time_rap(:,n)==1 );
    if( ~isempty(ind_TX) )
        TX_time{1,n} = ind_TX;
    end
end