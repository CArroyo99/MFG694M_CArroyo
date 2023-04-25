clc
clear all

x1 = optimvar('x1', 'LowerBound', 135883.87, 'UpperBound', Inf);
x2 = optimvar('x2', 'LowerBound', 21933.17, 'UpperBound', Inf);
x3 = optimvar('x3', 'LowerBound', 238649.52, 'UpperBound', Inf);
x4 = optimvar('x4', 'LowerBound', 3533.26, 'UpperBound', Inf);
x5 = optimvar('x5', 'LowerBound', 9401.29, 'UpperBound', Inf);
x6 = optimvar('x6', 'LowerBound', 1595.19, 'UpperBound', Inf);

obj_func = 0.02*x1 + 1.59*x2 + 0.01*x3 + 0.06*x4 + 2.72*x5 + 39.66*x6;
prob = optimproblem('Objective', obj_func, 'ObjectiveSense','min');

prob.Constraints.c1 = x1 + x2 + x3 + x4 + x5 + x6 == 679197.39*(1-0.3316-0.0022);
prob.Constraints.c2 = 39.66*x6 >= 1.59*x2;
prob.Constraints.c3 = 1.59*x2 >= 2.72*x5;
prob.Constraints.c4 = 2.72*x5 >= 0.02*x1;
prob.Constraints.c5 = 2.72*x5 >= 0.01*x3;
prob.Constraints.c6 = 2.72*x5 >= 0.06*x4;

prob_struct = prob2struct(prob);
[sol, fval, exitflag, output] = linprog(prob_struct)