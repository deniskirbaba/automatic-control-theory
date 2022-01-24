w_start = 0;
w_stop = 100;
w_step = 0.0001;

delay = 5;

w = linspace(w_start, w_stop, (w_stop - w_start) ./ w_step);

real = real_freq_trans_func_t_1(w);
im = im_freq_trans_func_t_1(w);

phase_freq = atan2(im, real);

phase = phase_freq_with_delay(w, delay);

plot(w,phase);
xlabel("w");
ylabel("Phase");
legend("Phase(w)");
grid on;
ylim([-3.15 -3.14]);

function p = phase_freq_with_delay(w, delay)
    p = atan2(im_freq_trans_func_t_1(w),real_freq_trans_func_t_1(w)) - delay .* w;
end

function y = real_freq_trans_func_t_1(w)
    y = (5 .* (w .^ 2) + 7) ./ ((w .^ 4) + 22 .* (w .^ 2) + 49);
end

function y = im_freq_trans_func_t_1(w)
    y = (-1 .* (w .^ 3) + w) ./ ((w .^ 4) + 22 .* (w .^ 2) + 49);
end