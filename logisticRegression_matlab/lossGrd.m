
function [w] = lossGrd(w, x, y)

w = y*x - x*exp(w*x')/(1+exp(w*x'));


