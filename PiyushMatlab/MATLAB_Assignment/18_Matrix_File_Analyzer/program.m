% Program 18: Matrix File Analyzer
% Input format (matrix.txt): one matrix row per line, values separated by
% spaces; every line must have the same number of values.
% Finds overall max/min with positions (nested loops), each row sum and the
% row with the highest sum.
clc; clear;

inID = fopen("matrix.txt", "r");
if inID == -1
    disp("Error: matrix.txt could not be opened.");
    return;
end

% Read the file line by line so any matrix size works
M = [];
line = fgetl(inID);
while ischar(line)
    rowValues = sscanf(line, "%f")';
    if ~isempty(rowValues)
        M(end+1, :) = rowValues;
    end
    line = fgetl(inID);
end
fclose(inID);

[numRows, numCols] = size(M);

% Nested-loop search for max/min and row sums
maxVal = M(1, 1); maxR = 1; maxC = 1;
minVal = M(1, 1); minR = 1; minC = 1;
rowSum = zeros(1, numRows);
for i = 1:numRows
    for j = 1:numCols
        rowSum(i) = rowSum(i) + M(i, j);
        if M(i, j) > maxVal
            maxVal = M(i, j); maxR = i; maxC = j;
        end
        if M(i, j) < minVal
            minVal = M(i, j); minR = i; minC = j;
        end
    end
end

bestRow = 1;
for i = 2:numRows
    if rowSum(i) > rowSum(bestRow)
        bestRow = i;
    end
end

outID = fopen("output.txt", "w");
if outID == -1
    error("Could not create output.txt");
end
fprintf(outID, "===== Matrix File Analysis =====\n");
fprintf(outID, "Matrix read from matrix.txt (%dx%d):\n", numRows, numCols);
for i = 1:numRows
    fprintf(outID, "%6g", M(i, :)); fprintf(outID, "\n");
end
fprintf(outID, "\nOverall maximum: %g at Row %d, Column %d\n", maxVal, maxR, maxC);
fprintf(outID, "Overall minimum: %g at Row %d, Column %d\n\n", minVal, minR, minC);
for i = 1:numRows
    fprintf(outID, "Row %d sum: %g\n", i, rowSum(i));
end
fprintf(outID, "\nRow with highest sum: Row %d (sum = %g)\n", bestRow, rowSum(bestRow));
fclose(outID);

type("output.txt");
