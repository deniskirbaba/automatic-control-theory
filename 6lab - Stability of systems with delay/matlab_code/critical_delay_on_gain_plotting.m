k_start = 0;
k_stop = 10;
k_step = 0.001;

k = linspace(k_start, k_stop, (k_stop - k_start) ./ k_step);

cr_delay = critical_delay_on_gain(k);


plot(k,cr_delay);
xlabel("k");
ylabel("Critical delay");
legend("Critical delay(k)");
grid on;
%xlim([0 10]);
ylim([0.2 1.3755])

function d = critical_delay_on_gain(k)
    d = (pi + atan2((-freq_on_gain(k) .^ 3 + freq_on_gain(k)),(5 .* freq_on_gain(k) .^ 2 + 7))) ./ (freq_on_gain(k));
end

function w = freq_on_gain(k)
    w = (sqrt(k .^ 2 + sqrt(k .^ 4 - 40 .* k .^ 2 + 288) - 22) ./ sqrt(2));
    w = change_im_to_inf(w);
end

function x = change_im_to_inf(x)
    for i = 1:10000
        if ~isreal(x(1, i))
            x(1, i) = Inf;
        end
    end
end