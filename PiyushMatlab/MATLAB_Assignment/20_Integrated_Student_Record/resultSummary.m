function s = resultSummary(marks, passMark)
% resultSummary  Validates marks and summarises the valid ones.
%   s = resultSummary(marks, passMark) returns a struct with fields:
%   valid, invalid, total, average, highest, lowest, passCount, failCount,
%   passPercent, overall.
%   A mark is valid only if it is numeric, finite and within 0..100.

if nargin < 2
    passMark = 40;
end

s.valid = []; s.invalid = [];
for i = 1:length(marks)
    m = marks(i);
    if isfinite(m) && m >= 0 && m <= 100
        s.valid(end+1) = m;
    else
        s.invalid(end+1) = m;
    end
end

s.total = 0; s.average = 0; s.highest = 0; s.lowest = 0;
s.passCount = 0; s.failCount = 0; s.passPercent = 0;

if isempty(s.valid)
    s.overall = "No valid marks - result cannot be computed";
    return;
end

s.highest = s.valid(1);
s.lowest = s.valid(1);
for i = 1:length(s.valid)
    m = s.valid(i);
    s.total = s.total + m;
    if m > s.highest
        s.highest = m;
    end
    if m < s.lowest
        s.lowest = m;
    end
    if m >= passMark
        s.passCount = s.passCount + 1;
    else
        s.failCount = s.failCount + 1;
    end
end
s.average = s.total / length(s.valid);
s.passPercent = 100 * s.passCount / length(s.valid);

% Overall result of the class based on the pass percentage
if s.passPercent >= 75
    s.overall = "Good (at least 75% passed)";
elseif s.passPercent >= 50
    s.overall = "Average (50-75% passed)";
else
    s.overall = "Poor (less than 50% passed)";
end
end
