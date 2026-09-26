function [average, highest, passCount, failCount, validMarks, invalidMarks] = analyzeMarks(marks)
% analyzeMarks  Validates marks (0-100) and analyses only the valid ones.
%   Returns average, highest valid mark and Pass/Fail counts (pass >= 40).
%   Invalid marks are returned separately and never affect calculations.

passMark = 40;
validMarks = [];
invalidMarks = [];
for i = 1:length(marks)
    if marks(i) >= 0 && marks(i) <= 100
        validMarks(end+1) = marks(i);
    else
        invalidMarks(end+1) = marks(i);
    end
end

average = 0; highest = 0; passCount = 0; failCount = 0;
if isempty(validMarks)
    return;
end

total = 0;
highest = validMarks(1);
for i = 1:length(validMarks)
    total = total + validMarks(i);
    if validMarks(i) > highest
        highest = validMarks(i);
    end
    if validMarks(i) >= passMark
        passCount = passCount + 1;
    else
        failCount = failCount + 1;
    end
end
average = total / length(validMarks);
end
