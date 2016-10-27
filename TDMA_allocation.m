%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         基于多个因素分配超帧中TDMA阶段
%         Author:yf
%         Date:2016/10/27
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [TDMAalloc] = TDMA_allocation(numOfConLoss, UPnode, E_buff, B_buff, TDMAlen)
% Input:
%     numOfConLoss: continuous packet loss of nodes
%     UPnode: different UP of nodes
%     E_buff: energy buffer of nodes (unit)
%     B_buff: data buffer of nodes (unit)
%     TDMAlen: length of TDMA phase in this superframe
% Output:
%     TDMAalloc: resource allocation of TDMA phase (slot)

global Emax
TDMAalloc = zeros(1, length(E_buff)); % length(E_buff)个节点
%计算每个节点的需求，一个时隙发一个包，使用一个单位的能量（后期再设计这个函数）
request = min(E_buff, B_buff);
%归一化参数
UPnodeO = (UPnode + 1) / 8;
E_buffO = E_buff / Emax;
% B_buffO = B_buff / Bmax;
numOfConLossO = ( numOfConLoss - min(numOfConLoss) ) / ( max(numOfConLoss) - min(numOfConLoss) );

%计算节点对应参数
lambda = 0.8;
weight = UPnodeO.*(E_buffO - lambda*numOfConLossO);

%求解优化函数：利用贪心算法（暂时不考虑可传输函数的约束）
%降序排序
[~, index] = sort(weight, 'descend');

for i = 1 : length(index)
    TDMAalloc(i) = min(request(i), TDMAlen);
    TDMAlen = TDMAlen - TDMAalloc(i);
end




