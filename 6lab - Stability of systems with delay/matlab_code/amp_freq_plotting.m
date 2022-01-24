w_start = 0;
w_stop = 100;
w_step = 0.001;

w = linspace(w_start, w_stop, (w_stop - w_start) ./ w_step);

amp_fr = amplitude_k_10(w);

plot(w,amp_fr);
xlabel("w");
ylabel("A");
legend("A(w)");
grid on;
%ylim([0 30]);

value = amplitude_k_1(0.636701)

function a = amplitude_k_1(w)
    a = (((w .^ 6) + 23 .* (w .^ 4) + 71 .* (w .^ 2) + 49) .^ 0.5) ./ ((w .^ 4) + 22 .* (w .^ 2) + 49);
end

function a = amplitude_k_5(w)
    a = (5 .* ((w .^ 6) + 23 .* (w .^ 4) + 71 .* (w .^ 2) + 49) .^ 0.5) ./ ((w .^ 4) + 22 .* (w .^ 2) + 49);
end

function a = amplitude_k_10(w)
    a = (10 .* ((w .^ 6) + 23 .* (w .^ 4) + 71 .* (w .^ 2) + 49) .^ 0.5) ./ ((w .^ 4) + 22 .* (w .^ 2) + 49);
end