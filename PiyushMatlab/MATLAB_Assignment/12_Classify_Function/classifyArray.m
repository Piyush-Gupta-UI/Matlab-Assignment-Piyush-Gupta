function [positive, negative, zero, even, odd] = classifyArray(arr)
% classifyArray  Counts positive, negative, zero, even and odd elements.
%   Even/odd counts include only integer-valued elements.

positive = 0; negative = 0; zero = 0; even = 0; odd = 0;
for i = 1:length(arr)
    x = arr(i);
    if x > 0
        positive = positive + 1;
    elseif x < 0
        negative = negative + 1;
    else
        zero = zero + 1;
    end
    if x == fix(x)              % integer check
        if mod(x, 2) == 0
            even = even + 1;
        else
            odd = odd + 1;
        end
    end
end
end
