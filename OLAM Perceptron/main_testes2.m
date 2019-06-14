clc;
close all;
clearvars;


nome_arquivo = 'column_2C.dat';
num_atributos = 6;
atributo = 'AB';

[acuracia, desv_padrao] = perceptron(10, atributo, nome_arquivo, num_atributos)
