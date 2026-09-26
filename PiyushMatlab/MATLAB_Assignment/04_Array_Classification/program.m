% Program 4: Array Classification and Summary
% Classifies elements as positive/negative/zero and even/odd (integers only),
% sums positives and negatives, and reports the category with highest count.
clc; clear;

arr = [14 -6 0 9 -11 3.5 0 22 -7 5 -2 17];

positiveCount = 0; negativeCount = 0; zeroCount = 0;
evenCount = 0; oddCount = 0; nonIntegerCount = 0;
positiveSum = 0; negativeSum = 0;

for i = 1:length(arr)
    x = arr(i);
    % Sign classification
    if x > 0
        positiveCount = positiveCount + 1;
        positiveSum = positiveSum + x;
    elseif x < 0
        negativeCount = negativeCount + 1;
        negativeSum = negativeSum + x;
    else
        zeroCount = zeroCount + 1;
    end
    % Even/odd applies only to integer values
    if x == fix(x)
        if mod(x, 2) == 0
            evenCount = evenCount + 1;
        else
            oddCount = oddCount + 1;
        end
    else
        nonIntegerCount = nonIntegerCount + 1;
    end
end

% Category having the highest count (among positive, negative, zero)
categoryNames = {"Positive", "Negative", "Zero"};
categoryCounts = [positiveCount negativeCount zeroCount];
best = 1;
for k = 2:3
    if categoryCounts(k) > categoryCounts(best)
        best = k;
    end
end

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Array Classification =====\n");
fprintf(fileID, "Array            : "); fprintf(fileID, "%g ", arr);
fprintf(fileID, "\nPositive count   : %d\n", positiveCount);
fprintf(fileID, "Negative count   : %d\n", negativeCount);
fprintf(fileID, "Zero count       : %d\n", zeroCount);
fprintf(fileID, "Even integers    : %d\n", evenCount);
fprintf(fileID, "Odd integers     : %d\n", oddCount);
fprintf(fileID, "Non-integers     : %d (not classified as even/odd)\n", nonIntegerCount);
fprintf(fileID, "Sum of positives : %g\n", positiveSum);
fprintf(fileID, "Sum of negatives : %g\n", negativeSum);
fprintf(fileID, "Highest category : %s (%d values)\n", categoryNames{best}, categoryCounts(best));
fclose(fileID);

type("output.txt");
