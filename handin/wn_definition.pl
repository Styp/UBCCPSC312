:- consult('wn_s.pl').
:- consult('wn_g.pl').

definition(X,Y) :- s(Z,_,X,_,_,_), g(Z,Y).