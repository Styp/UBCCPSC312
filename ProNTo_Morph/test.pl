:- consult('pronto_morph_engine.pl').

word_line_morphs :- read(X), morph_atoms_bag(X,Y), write(Y).