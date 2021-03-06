l0 = 0.1471;
l1 = .1104;
l2 = 0.4251;
l3 = 0.3922;
l4 = 0.1104;
l5 = 0.0948;
l6 = 0.0750;


local_l(:,1) = [0;0;0];
local_l(:,2) = [0;0;l0];
local_l(:,3) = [0;0;l2];
local_l(:,4) = [0;0;l3];
local_l(:,5) = [0;-l4;0];
local_l(:,6) = [0;0;l5];
local_l(:,7) = [0;0;l6];

M_mat(:,:,1) = diag([2.5;2.5;2.5;0.1;0.1;0.1]);
M_mat(:,:,2) = diag([5.7;5.7;5.7;0.3420;0.3420;0.2280]);
M_mat(:,:,3) = diag([3.9;3.9;3.9;0.2145;0.2145;0.1560]);
M_mat(:,:,4) = diag([2.5;2.5;2.5;0.1;0.1;0.1]);
M_mat(:,:,5) = M_mat(:,:,4);
M_mat(:,:,6) = diag([0.7;0.7;0.7;0.007;0.007;0.007]);%Last link a

p_com(:,1) = [-0.00015;-0.0072;0.1514];
p_com(:,2) = [-0.000057;-0.1347;0.3595];
p_com(:,3) = [-0.00038;-0.0128;0.7589];
p_com(:,4) = [-0.00043;-0.1036;0.9568];
p_com(:,5) = [-0.00057;-0.1069;1.0521];
p_com(:,6) = [-0.00053;-0.1727;1.0590];

g_com(:,:,1) = [eye(3,3),p_com(:,1);zeros(1,3),1];
g_com(:,:,2) = [eye(3,3),p_com(:,2);zeros(1,3),1];
g_com(:,:,3) = [eye(3,3),p_com(:,3);zeros(1,3),1];
g_com(:,:,4) = [eye(3,3),p_com(:,4);zeros(1,3),1];
g_com(:,:,5) = [eye(3,3),p_com(:,5);zeros(1,3),1];
g_com(:,:,6) = [[1,0,0;0,0,-1;0,1,0],p_com(:,6);zeros(1,3),1];


om(:,1) = [0;0;1];
om(:,2) = [0;-1;0];
om(:,3) = [0;-1;0];
om(:,4) = [0;-1;0];
om(:,5) = [0;0;1];
om(:,6) = [0;-1;0];

q(:,1) = [0;0;0];
q(:,2) = [0;0;l0];
q(:,3) = [0;0;l0+l2];
q(:,4) = [0;0;l0+l2+l3];
q(:,5) = [0;-l4;l0+l2+l3];
q(:,6) = [0;-l4;l0+l2+l3+l5];

tr = eye(4,4);
%theta = zeros(6,1);
tr = fn_CreateForwardKinExp(theta,om,q);
R_st_0 = [1,0,0;0,0,-1;0,1,0;];
p_st_0 = [-0.00055;-0.1852;1.0590];
g_st_0 = [R_st_0,p_st_0;zeros(1,3),1];
g_st = tr*g_st_0;
