clc;
clear all;
indPoll = 2:3;  %确定将被poll的节点
indnotPoll = setdiff(1:4, indPoll)