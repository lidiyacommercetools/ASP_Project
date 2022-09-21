%--------Instance1----------%

%size:  		1-2
%maxsteps 		4
%number robots:	1
%number shelfs:   1
%number goals:    1


%----Maxsteps----%
maxsteps(4).

%----Robots-----%
robot(r1).
holds(r1,(1,2), 0).


%----Shelfs----%
shelf(s1).
holds(s1,(2,1),0).



%----Connections----%
connect((R,S)) :-robot(R), shelf(S).
holds(A,down,0) :- connect(A).


%----Goals----%
goal(A,up) :- connect(A).



%----Grid------%
value(1,1).
value(1,2).
value(2,1).
value(2,2).
