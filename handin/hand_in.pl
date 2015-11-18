% CPSC 312 Project 1 First Week Submission
% Team members
% Alborz Massah Student Number 75256099 CPSC ID w1f7
% Martin Stypinski Student Number 58385155 CPSC ID o4n0b
% James Marcellin Student Number 76287093 CPSC ID x4c8


%%% Importing of all necessary files for the code to run.




%%%% Question 1

:- consult('wn_s.pl').
:- consult('wn_g.pl').

definition(X,Y) :- s(Z,_,X,_,_,_), g(Z,Y).

%% Explanation of above code
%%% We call consult on wn_s.pl and wn_g.pl because 's' contains the word to
%%% ID mapping and
%%% 'g' contains the mapping of ID to the meaning.
%%% We require both to build our predicate definition.
%%% X is the ID in this case and Y is the meaning of the word as defined in definition.
%%% The anonymous variables are the irrelevant variables. Z is the ID and X is word
%%% we are looking for. The other variables are not relevant.

%%%% Question 2

:- consult('pronto_morph_engine.pl').

word_line_morphs :- read(X), morph_atoms_bag(X,Y), write(Y).


%% Explanation of above code
%%% We had to call the pronto morph engine because we will be using it to find
%%% all the morphological parsings.
%%% All we had to do was write console-in and console-out around the morph_atoms_bag
%%% predicate which was given by the pronto_morph_engine.pl.
%%% We did read because after word_line_morphs. is run, the user can input their
%%% word and write because it writes to the console the user is using.

%%%% Question 3

:- consult('312-pess.pl').

/* Line 353-358 of 312-pess.pl
process(['words:'|L]) :-
	words(R,L,[]), write('Return: '), write(R),
      %  rule(R,L,[]),       % Parse the rule.
        bug(R),            % Print it for debugging.
        assert_rules(R), !. % Assert it (them, potentially) in the DB. */

%%% Explanation of above code:
%%% If there is a "words:" at the start of the list elements, we use
%%% the custom rules predicate called 'words(R,L,[]).'
%%% To parse the words in their unique syntax similar to how rules were parsed.
%%% The predicate words will explained below.
%%% Bug and assert_rules did not need to be modified because their function
%%% remains the same for words and rules.


/* Line 193-221 of 312-pess-grammer.pl
% Rules for words
% rule(Rules) -->

parseWords(Return) -->
	[ImportantWord], %{ write(ImportantWord) },
	 fwOne, fwTwo ,obj(ObjType),
	 %{ write(ObjType) },
	{ build_words(Return, ObjType, ImportantWord) }.


words([Head|Tail]) --> parseWords(Head), optAnd, words(Tail), !.

words([Return]) --> parseWords(Return).

optAnd --> [and].
optAnd --> [].

fwOne --> [is].
fwOne --> [].

fwTwo --> [a].
fwTwo --> [an].
fwTwo --> [].

obj(n) --> [noun].
obj(v) --> [verb].
obj(adv) --> [adverb].
obj(adj) --> [adjective]. */

%%%% Explanation of above code:
%%% The above is the grammer structure as a DCG for the words instead of the rules.
%%% parseWords is a DCG to parse a simple case without an AND or concatination with
%%% fewer statements as in just one line or expression, not multiple as it is
%%% evident in most of the other "Words" cases. So it is only focused on the case of
%%% the first and second example.

%%% The ImportantWord is followed by a filling word (fwOne) and fillnig word (fwTwo)(which could be empty)
%%% Filling words have to be according to the rules defined as by
%%% fwTWo or fwOne and these rules account for all the cases present in the
%%% word examples provided.

%% Lines 71 and 72 (parseWords) are only there to parse simple and concatinated
%% statements such as having no "and" or having an "and" respectively.
%% By calling build_words with your ObjType and ImportantWord you get
%% a functor back.


/* Line 427-437 of 312-pess-grammer.pl
% build_words just brakes the words....

build_words(Return, Obj, Word) :- functor(Return, Obj, 1), arg(1, Return, Word).

*/

%%%% Explanation of above code
%%% build_words is generating the functor from the importantWord and the type
%%% given.

%%% You are inputing a word and a type and you get the functor of the word back.

%%% stuff to run the code automatically
:- nl.
:- nl.
:- nl.
:- write('QUESTION 1 ANSWER...').
:- nl.
:- nl.

:- write('Running the definition(hello, X) with single quotations around hello produces the following...').
:- nl.
:- nl.
:- definition('hello', X), write(X).
:- nl.
:- nl.
:- write('Running the definition(discipula, X) with single quotations around discipula should produce false... which is why it says goal derivative fails below.').
:- nl.
:- nl.
:- definition('discipula', X), write(X).
:- nl.
:- nl.
:- write('Running the definition(hypernym, Z) with single quotations around hypernym produces the following...').
:- nl.
:- nl.
:- definition('hypernym', Z), write(Z).


:- nl.
:- nl.
:- nl.

:- write('QUESTION 2 ANSWER....').
:- nl.
:- nl.
:- write('For question 2, the input cannot be run automatically because
it requires user input. So type in word_line_moprhs. below
then try inputting says. Afterwards, do it again for triples to get the
intended project result').

:- nl.
:- nl.
:- nl.

:- write('QUESTION 3 ANSWER...').
:- nl.
:- nl.
:- load_rules('myrules.kb').
