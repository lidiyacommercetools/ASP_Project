%--------Instance1----------%

%size:  		4-4
%maxsteps 		8
%number robots:	1
%number shelfs:   1
%number goals:    1


%----Maxsteps----%
maxsteps(6).

%----Robots-----%
robot(r1).
holds(r1,(2,1), 0).




%----Shelfs----%
shelf(s1).
holds(s1,(3,4),0).


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

value(1,4).
value(2,4).
value(3,4).
value(4,4).
value(4,1).
value(4,2).
value(4,3).

