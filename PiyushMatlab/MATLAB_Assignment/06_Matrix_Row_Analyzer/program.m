% Program 6: Row-wise Matrix Analyzer
% For every row: sum, average and maximum (computed with loops/indexing).
% Also identifies the row having the highest row-sum.
clc; clear;

M = [12  5  9  3;
      7 14  2 11;
      6  8 15  4;
     10  1 13  9];

[numRows, numCols] = size(M);
rowSum = zeros(1, numRows);
rowAvg = zeros(1, numRows);
rowMax = zeros(1, numRows);

for i = 1:numRows
    s = 0;
    mx = M(i, 1);
    for j = 1:numCols
        s = s + M(i, j);
        if M(i, j) > mx
            mx = M(i, j);
        end
    end
    rowSum(i) = s;
    rowAvg(i) = s / numCols;
    rowMax(i) = mx;
end

% Row with the highest sum
bestRow = 1;
for i = 2:numRows
    if rowSum(i) > rowSum(bestRow)
        bestRow = i;
    end
end

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Row-wise Matrix Analyzer =====\nMatrix:\n");
for i = 1:numRows
    fprintf(fileID, "%6g", M(i, :)); fprintf(fileID, "\n");
end
fprintf(fileID, "\n%-6s %8s %10s %8s\n", "Row", "Sum", "Average", "Max");
for i = 1:numRows
    fprintf(fileID, "%-6d %8g %10.2f %8g\n", i, rowSum(i), rowAvg(i), rowMax(i));
end
fprintf(fileID, "\nRow with highest sum: Row %d (sum = %g)\n", bestRow, rowSum(bestRow));
fclose(fileID);

type("output.txt");
