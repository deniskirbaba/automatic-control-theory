% 2 task

% plant parameters
A = [-6 19 10 -13; 0 -9 0 6; -4 8 6 -7; 0 -15 0 9];
B = [2 0; 1 0; 3 0; 2 0];

% initial conditions
x0 = [1; -2; -1; 2];

% modal regulator
%K_modal = [286/5 -(2238/5) -(598/5) 334; 286/5 -(2238/5) -(598/5) 334];
K_modal = [6/5 -21/10 -1/10 -7/2; 6/5 -21/10 -1/10 -7/2];

% LMI regulator

alpha = 3;
cvx_begin sdp
variable P_lmi(4,4)
variable Y_lmi(2,4)
P_lmi > 0.00001*eye(4);
P_lmi*A' + A*P_lmi + 2*alpha*P_lmi + Y_lmi'*B' + B*Y_lmi <= 0;
cvx_end
K_lmi = Y_lmi*inv(P_lmi);

% J finding
lqr_j_sum = sum(out.lqr_sum.signals.values);
modal_j_sum = sum(out.modal_sum.signals.values);
lmi_j_sum = sum(out.lmi_sum.signals.values);

lqr_j_qqq = zeros(4001, 1);
modal_j_qqq = zeros(4001, 1);
lmi_j_qqq = zeros(4001, 1);
lqr_j_qqq(1) = out.lqr_sum.signals.values(1);
modal_j_qqq(1) = out.modal_sum.signals.values(1);
lmi_j_qqq(1) = out.lmi_sum.signals.values(1);

for i = 2:4001
    lqr_j_qqq(i) = lqr_j_qqq(i-1) + out.lqr_sum.signals.values(i);
    modal_j_qqq(i) = modal_j_qqq(i-1) + out.modal_sum.signals.values(i);
    lmi_j_qqq(i) = lmi_j_qqq(i-1) + out.lmi_sum.signals.values(i);
end