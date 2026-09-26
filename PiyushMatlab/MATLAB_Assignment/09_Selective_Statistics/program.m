% Program 9: Selective Processing with continue
% Skips every non-positive value with 'continue' and computes count, sum
% and average of positives only. Handles the "no positive value" case.
clc; clear;

datasets = {[8 -3 0 12 -6 4 0 15 -1 9], ...   % has positive values
            [-4 0 -9 -2 0]};                  % no positive values

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Selective Statistics (positives only) =====\n");

for d = 1:length(datasets)
    arr = datasets{d};
    posCount = 0; posSum = 0;
    for i = 1:length(arr)
        if arr(i) <= 0
            continue;       % skip zeros and negatives
        end
        posCount = posCount + 1;
        posSum = posSum + arr(i);
    end

    fprintf(fileID, "\nArray %d: ", d); fprintf(fileID, "%g ", arr);
    fprintf(fileID, "\nPositive count  : %d\n", posCount);
    if posCount > 0
        fprintf(fileID, "Positive sum    : %g\n", posSum);
        fprintf(fileID, "Positive average: %.2f\n", posSum / posCount);
    else
        fprintf(fileID, "No positive value exists - sum/average not computed.\n");
    end
end
fclose(fileID);

type("output.txt");
