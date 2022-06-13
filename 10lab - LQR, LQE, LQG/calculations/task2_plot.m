% J plot
hold on;
grid on;
plot(out.lmi_sum.time, lmi_j_qqq)
plot(out.lmi_sum.time, modal_j_qqq)
plot(out.lmi_sum.time, lqr_j_qqq)