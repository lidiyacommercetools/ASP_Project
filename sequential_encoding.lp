%%% ---Initialization--- %%%
time(0..T) :- maxsteps(T).
pick(up).
pick(down).






%new code with pick up for multiple robots
% goal: each shelf has to be up
% same number of shelfs and robots


%Question would you make all action seperate each possible field change one action or is one action going up, going down

action((pickup, (X,Y),S, R))     :- value(X,Y), shelf(S), robot(R).
action((putdown, (X,Y),S, R))    :- value(X,Y), shelf(S), robot(R).
action((moveup,(X,Y), R,S))      :- value(X,Y), value(X',Y), X<X', robot(R), shelf(S).
action((movedown,(X,Y), R,S))    :- value(X,Y), value(X',Y), X>X', robot(R), shelf(S).
action((moveleft,(X,Y), R,S))    :- value(X,Y), value(X,Y'), Y>Y', robot(R), shelf(S).
action((moveright,(X,Y), R,S))   :- value(X,Y), value(X,Y'), Y<Y', robot(R), shelf(S).
action((up,(X,Y),R))    :- value(X,Y), value(X',Y), X<X', robot(R).
action((down,(X,Y),R))  :- value(X,Y), value(X',Y), X>X', robot(R).
action((left,(X,Y),R))  :- value(X,Y), value(X,Y'), Y>Y', robot(R).
action((right,(X,Y),R)) :- value(X,Y), value(X,Y'), Y<Y', robot(R).


%Pick up and Putdown
prec((pickup, (X,Y),S,R), R, (X,Y))          :- action((pickup, (X,Y),S,R)).
prec((pickup, (X,Y),S,R), S, (X,Y))          :- action((pickup, (X,Y),S,R)).
prec((pickup, (X,Y),S,R), (R,S), down)       :- action((pickup, (X,Y),S,R)).
post((pickup, (X,Y),S,R), S, (X,Y))          :- action((pickup, (X,Y),S,R)).
post((pickup, (X,Y),S,R), R, (X,Y))          :- action((pickup, (X,Y),S,R)).
post((pickup, (X,Y),S,R), (R,S), up)         :- action((pickup, (X,Y),S,R)).


%muss hier nochmal schauen wie drüber
prec((putdown, (X,Y),S,R), R, (X,Y))         :- action((putdown, (X,Y),S,R)).
prec((putdown, (X,Y),S,R), S, (X,Y))         :- action((putdown, (X,Y),S,R)).
prec((putdown, (X,Y),S,R), (R,S), up)        :- action((putdown, (X,Y),S,R)).
post((putdown, (X,Y),S,R), S, (X,Y))         :- action((putdown, (X,Y),S,R)).
post((putdown, (X,Y),S,R), R, (X,Y))         :- action((putdown, (X,Y),S,R)).
post((putdown, (X,Y),S,R), (R,S), down)      :- action((putdown, (X,Y),S,R)).



%Move Robot alone
prec((up,(X,Y),R),R,(X,Y))       :- action((up,(X,Y),R)).       post((up,(X,Y),R),R,(X+1,Y)) :- action((up,(X,Y),R)).
prec((down,(X,Y),R),R,(X,Y))     :- action((down,(X,Y),R)).     post((down,(X,Y),R),R,(X-1,Y)):- action((down,(X,Y),R)).
prec((left,(X,Y),R),R,(X,Y))     :- action((left,(X,Y),R)).     post((left,(X,Y),R),R,(X,Y-1)):- action((left,(X,Y),R)).
prec((right,(X,Y),R),R,(X,Y))    :- action((right,(X,Y),R)).    post((right,(X,Y),R),R,(X,Y+1)):- action((right,(X,Y),R)).

prec((up,(X,Y),R),(R,S),down)       :- action((up,(X,Y),R)), connect((R,S)).
prec((down,(X,Y),R),(R,S),down)     :- action((down,(X,Y),R)), connect((R,S)).
prec((left,(X,Y),R),(R,S),down)     :- action((left,(X,Y),R)), connect((R,S)).
prec((right,(X,Y),R),(R,S),down)    :- action((right,(X,Y),R)), connect((R,S)).


%Move Robot and Shelf together

prec((moveup,   (X,Y), R,S),R,(X,Y)) :- action((moveup,   (X,Y), R,S)).   post((moveup,    (X,Y), R,S),R,(X+1,Y)):- action((moveup,(X,Y),R,S)).
prec((movedown, (X,Y), R,S),R,(X,Y)) :- action((movedown, (X,Y), R,S)).   post((movedown,  (X,Y), R,S),R,(X-1,Y)):- action((movedown,(X,Y),R,S)).
prec((moveleft, (X,Y), R,S),R,(X,Y)) :- action((moveleft, (X,Y), R,S)).   post((moveleft,  (X,Y), R,S),R,(X,Y-1)):- action((moveleft,(X,Y),R,S)).
prec((moveright,(X,Y), R,S),R,(X,Y)) :- action((moveright,(X,Y), R,S)).   post((moveright, (X,Y), R,S),R,(X,Y+1)):- action((moveright,(X,Y),R,S)).

prec((moveup,   (X,Y), R,S),S,(X,Y)) :- action((moveup,   (X,Y), R,S)).   post((moveup,    (X,Y), R,S),S,(X+1,Y)):- action((moveup,(X,Y),R,S)).
prec((movedown, (X,Y), R,S),S,(X,Y)) :- action((movedown, (X,Y), R,S)).   post((movedown,  (X,Y), R,S),S,(X-1,Y)):- action((movedown,(X,Y),R,S)).
prec((moveleft, (X,Y), R,S),S,(X,Y)) :- action((moveleft, (X,Y), R,S)).   post((moveleft,  (X,Y), R,S),S,(X,Y-1)):- action((moveleft,(X,Y),R,S)).
prec((moveright,(X,Y), R,S),S,(X,Y)) :- action((moveright,(X,Y), R,S)).   post((moveright, (X,Y), R,S),S,(X,Y+1)):- action((moveright,(X,Y),R,S)).

prec((moveup,   (X,Y), R,S),(R,S),up) :- action((moveup,   (X,Y), R,S)), connect((R,S)).
prec((movedown, (X,Y), R,S),(R,S),up) :- action((movedown, (X,Y), R,S)), connect((R,S)).
prec((moveleft, (X,Y), R,S),(R,S),up) :- action((moveleft, (X,Y), R,S)), connect((R,S)).
prec((moveright,(X,Y), R,S),(R,S),up) :- action((moveright,(X,Y), R,S)), connect((R,S)).


%prec((moveup,(X,Y),S),S,(X,Y,up)) :- action((moveup,(X,Y),S)), shelf(S).
%prec((movedown,(X,Y),S),S,(X,Y,up)) :- action((movedown,(X,Y),S)), shelf(S).
%prec((moveleft,(X,Y),S),S,(X,Y,up)) :- action((moveleft,(X,Y),S)), shelf(S).
%prec((moveright,(X,Y),S),S,(X,Y,up)) :- action((moveright,(X,Y),S)), shelf(S).

%post((moveup,(X,Y),S),S,(X+1,Y,up)) :- action((moveup,(X,Y),S)), shelf(S).
%post((movedown,(X,Y),S),S,(X-1,Y,up)):- action((movedown,(X,Y),S)), shelf(S).
%post((moveleft,(X,Y),S),S,(X,Y-1,up)):- action((moveleft,(X,Y),S)), shelf(S).
%post((moveright,(X,Y),S),S,(X,Y+1,up)):- action((moveright,(X,Y),S)), shelf(S).

goals(A) :- A = #count{X : goal(X,_)}.

%Check Goal
go(T+1) :- time(T), goal(X,GV), holds(X,AV,T), GV != AV.

yes(1) :- time(T), not go(T), T>0.
:- not yes(1).
%Generate Holds
{holds(R,(X,Y),T) : value(X,Y)} = 1 :- robot(R), go(T).
{holds(S,(X,Y),T) : value(X,Y)} = 1 :- shelf(S), go(T).
{holds(A,V,T) : pick(V) } = 1 :- connect(A), go(T).
%Generate Actions to use
{occurs(A,T)} :- action(A), go(T).

%Throw all out where the post value doesnt fit
:- occurs(A,T), post(A,X,V), not holds(X,V,T).

%Throw all out where the pre value doesnt fit
:- occurs(A,T), prec(A,X,V), not holds(X,V,T-1).

%Throw all out where a fluent is changed but not in an action
:- holds(X,V2,T), V2!=V1 , holds(X,V1,T-1), not occurs(A,T) : post(A,X,V2).


sum(X):-  X = #sum{ T,A: occurs(A,T)}.
#minimize {X:sum(X)}.
%#show prec/3.
%#show post/3.
%#show go/1.
#show occurs/2.
%#show goals/1.
%#show yes/1.
#show holds/3.
%#show action/1.
