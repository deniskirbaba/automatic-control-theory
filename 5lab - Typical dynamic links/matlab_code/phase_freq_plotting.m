w_start = 0;
w_stop = 100;
w_step = 0.001;

w = linspace(w_start, w_stop, (w_stop - w_start) ./ w_step);

real = real_freq_trans_func_conservative_link(w);
im = im_freq_trans_func_conservative_link(w);

phase_freq = atan2(im, real);

plot(w,phase_freq);
xlabel("w");
ylabel("Phase");
legend("Phase(w)");
grid on;

function y = real_freq_trans_func_frequency_oscillating_link(w)
    y = (15 - 0.6 .* (w .^ 2)) ./ (0.0016 .* (w .^ 4) - 0.0736 .* (w .^ 2) + 1);
end

function y = im_freq_trans_func_frequency_oscillating_link(w)
    y = (1.2 .* w) ./ (0.0016 .* (w .^ 4) - 0.0736 .* (w .^ 2) + 1);
end

function y = real_freq_trans_func_deceleration_differential_link(w)
    y = 15 ./ (0.04 .* (w .^ 2) + 1);
end

function y = im_freq_trans_func_deceleration_differential_link(w)
    y = (-3 .* w) ./ (0.04 .* (w .^ 2) + 1);
end

function y = real_freq_trans_func_conservative_link(w)
    y = 15 ./ (- 0.04 .* (w .^ 2) + 1);
end

function y = im_freq_trans_func_conservative_link(w)
    y = 0;
end