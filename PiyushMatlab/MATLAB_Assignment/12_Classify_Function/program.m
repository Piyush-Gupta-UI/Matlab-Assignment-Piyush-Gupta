% Program 12: Reusable Array Classification Function
% Calls classifyArray() for two arrays and prints a side-by-side comparison.
clc; clear;

arrayA = [3 -8 0 12 -5 7 20 0];
arrayB = [-14 9 -1 0 6 -22 11 2.5];

[pA, nA, zA, eA, oA] = classifyArray(arrayA);
[pB, nB, zB, eB, oB] = classifyArray(arrayB);

categories = {"Positive", "Negative", "Zero", "Even", "Odd"};
countsA = [pA nA zA eA oA];
countsB = [pB nB zB eB oB];

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Array Classification Comparison =====\n");
fprintf(fileID, "Array A: "); fprintf(fileID, "%g ", arrayA);
fprintf(fileID, "\nArray B: "); fprintf(fileID, "%g ", arrayB);
fprintf(fileID, "\n\n%-10s %8s %8s   %s\n", "Category", "Array A", "Array B", "Comparison");
fprintf(fileID, "%s\n", repmat("-", 1, 44));
for k = 1:length(categories)
    if countsA(k) > countsB(k)
        remark = "A has more";
    elseif countsA(k) < countsB(k)
        remark = "B has more";
    else
        remark = "Equal";
    end
    fprintf(fileID, "%-10s %8d %8d   %s\n", categories{k}, countsA(k), countsB(k), remark);
end
fclose(fileID);

type("output.txt");
