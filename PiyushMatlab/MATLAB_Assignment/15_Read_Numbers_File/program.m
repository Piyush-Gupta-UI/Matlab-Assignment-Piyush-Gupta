% Program 15: Read and Analyze Numbers from File
% Input format (input.txt): one numeric value per line.
% Reads values, classifies them and writes sum/average/min/max to output.txt.
clc; clear;

inID = fopen("input.txt", "r");
if inID == -1
    % File-open check: report failure and stop safely
    outID = fopen("output.txt", "w");
    fprintf(outID, "Error: input.txt could not be opened.\n");
    fclose(outID);
    disp("Error: input.txt could not be opened.");
    return;
end
data = fscanf(inID, "%f");
fclose(inID);

if isempty(data)
    disp("input.txt contains no numeric values.");
    return;
end

% Classification + statistics in one loop
positives = []; negatives = []; zeroCount = 0;
total = 0; minVal = data(1); maxVal = data(1);
for i = 1:length(data)
    x = data(i);
    total = total + x;
    if x > 0
        positives(end+1) = x;
    elseif x < 0
        negatives(end+1) = x;
    else
        zeroCount = zeroCount + 1;
    end
    if x < minVal
        minVal = x;
    end
    if x > maxVal
        maxVal = x;
    end
end
average = total / length(data);

outID = fopen("output.txt", "w");
if outID == -1
    error("Could not create output.txt");
end
fprintf(outID, "===== Number File Analysis =====\n");
fprintf(outID, "Values read     : "); fprintf(outID, "%g ", data);
fprintf(outID, "\nTotal values    : %d\n", length(data));
fprintf(outID, "Positive (%d)    : ", length(positives)); fprintf(outID, "%g ", positives);
fprintf(outID, "\nNegative (%d)    : ", length(negatives)); fprintf(outID, "%g ", negatives);
fprintf(outID, "\nZero count      : %d\n", zeroCount);
fprintf(outID, "Sum             : %g\n", total);
fprintf(outID, "Average         : %.2f\n", average);
fprintf(outID, "Minimum         : %g\n", minVal);
fprintf(outID, "Maximum         : %g\n", maxVal);
fclose(outID);

type("output.txt");
