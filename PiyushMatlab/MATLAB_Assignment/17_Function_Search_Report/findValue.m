function [firstIndex, count] = findValue(arr, target)
% findValue  Returns the first (1-based) index of target in arr and its
%   total number of occurrences. firstIndex = -1 when target is absent.

firstIndex = -1;
count = 0;
for i = 1:length(arr)
    if arr(i) == target
        count = count + 1;
        if firstIndex == -1
            firstIndex = i;     % remember only the first match
        end
    end
end
end
