% facts
% father(F, C): F is the father of C
% mother(M, C): M is the mother of C
male(k).
female(h).
husband(h,w).

father(jim,sam).
mother(laura,sam).
father(jim,tom).
mother(laura,tom).
father(jim,sonia).
mother(laura,sonia).
brother(sam,tom).
sibling(sam,sonia).
sibling(tom,sonia).

father(james,tony).
mother(carmen,tony).
father(james,sandra).
mother(carmen,sandra).
sibling(tony,sandra).

brother(jim,james).
sister(carmen,laura).

uncle(james,sam).
aunt(carmen,sam).
uncle(james,tom).
aunt(carmen,tom).

nephew(sam,james).
niece(sonia,james).
cousin_brother(tom,sandra).
cousin_sister(sonia,tony).
maternal_uncle(james,sam).

% reasoning

%sibling(F,G): F is the sibling of G
sibling(F,G):-parent(F,C),parent(G,C),F!=G. 
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

% brother(B, C): B is the brother of C
brother(B,C):-parent(B,Z),parent(C,Z),male(C),B!=C.
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

% sister(B, C): B is the sister of C
sister(B,C):-parent(B,Z),parent(C,Z),female(C),B!=C.
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

% uncle(F,B): F is the uncle of B 
uncle(F,B):- parent(B,C),parent(C,A),parent(B,A),male(F).
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

% aunt(F,B): F is the aunt of B 
aunt(F,B):- parent(B,C),parent(C,A),parent(B,A),female(F).
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

%nephew(F,B): F is the nephew of B
nephew(F,B):- parent(F,C),parent(C,A),parent(B,A),male(F).
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

%niece(F,B): F is the niece of B
nephew(F,B):- parent(F,C),parent(C,A),parent(B,A),female(F).
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

%cousin_brother(E,G): E is the cousin brother of G
cousin_brother(E,G):-parent(G,C),parent(E,B),parent(B,A),parent(C,A),male(E). 
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

%cousin_sister(E,G): E is the cousin sister of G
cousin_sister(E,G):-parent(G,C),parent(E,B),parent(B,A),parent(C,A),female(E). 
parent(X,Y):-father(Y,X).
parent(X,Y):-mother(Y,X).

%maternal_uncle(F,B): F is the maternal uncle of B
maternal_uncle(F,B):- parent(B,C),sister(C,Z),husband(F,Z),male(F).
parent(X,Y):-mother(Y,X).
