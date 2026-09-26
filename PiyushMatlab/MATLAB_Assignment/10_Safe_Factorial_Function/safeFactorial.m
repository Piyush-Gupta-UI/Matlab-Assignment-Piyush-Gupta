function [result, isValid] = safeFactorial(n)
% safeFactorial  Factorial of a non-negative integer computed with a loop.
%   [result, isValid] = safeFactorial(n)
%   For negative or non-integer n, isValid = false, result = NaN and the
%   function exits early using return.

result = NaN;
isValid = false;

% Validation: reject non-scalar, negative and non-integer input
if ~isscalar(n) || n < 0 || n ~= fix(n)
    return;
end

isValid = true;
result = 1;
for k = 2:n
    result = result * k;
end
end
