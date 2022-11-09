%--------Instance1----------%

%size:  		2-2
%maxsteps 		4
%number robots:	2
%number shelfs:   2
%number goals:    1


%----Maxsteps----%
maxsteps(10).

%----Robots-----%
robot(r1).
holds(r1,(1,1), 0).

robot(r2).
holds(r2,(1,2), 0).

%----Shelfs----%
shelf(s1).
holds(s1,(2,1),0).

shelf(s2).
holds(s2,(2,2),0).

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
