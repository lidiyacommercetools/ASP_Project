%--------Instance1----------%

%size:  		3-3
%maxsteps 		6
%number robots:	2
%number shelfs:   2
%number goals:    1


%----Maxsteps----%
maxsteps(6).

%----Robots-----%
robot(r1).
holds(r1,(1,1), 0).


robot(r2).
holds(r2,(3,1), 0).


%----Shelfs----%
shelf(s1).
holds(s1,(2,2),0).

shelf(s2).
holds(s2,(1,3),0).

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
value(1,3).
value(2,3).
value(3,3).
value(3,1).
value(3,2).

