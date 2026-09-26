function [total, average, minimum, maximum] = arraySummary(arr)
% arraySummary  Returns total, average, minimum and maximum of an array.
%   Minimum and maximum are found manually with a loop (no min()/max()).

total = 0; average = 0; minimum = NaN; maximum = NaN;
if isempty(arr)
    return;
end

minimum = arr(1);
maximum = arr(1);
for i = 1:length(arr)
    total = total + arr(i);
    if arr(i) < minimum
        minimum = arr(i);
    end
    if arr(i) > maximum
        maximum = arr(i);
    end
end
average = total / length(arr);
end
