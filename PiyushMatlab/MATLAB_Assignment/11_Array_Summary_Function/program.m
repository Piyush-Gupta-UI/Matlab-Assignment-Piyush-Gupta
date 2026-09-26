% Program 11: Multi-output Array Summary Function
% Calls arraySummary() on several arrays, including an all-negative one.
clc; clear;

arrays = {[17 4 26 9 13], ...          % positive values
          [-12 -5 -30 -8 -19], ...     % all negative values
          [7 -3 0 15 -11 6]};          % mixed values
labels = {"Positive array", "All-negative array", "Mixed array"};

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Array Summary Function =====\n");

for k = 1:length(arrays)
    [total, average, minimum, maximum] = arraySummary(arrays{k});
    fprintf(fileID, "\n%s: ", labels{k}); fprintf(fileID, "%g ", arrays{k});
    fprintf(fileID, "\n  Total   = %g\n  Average = %.2f\n  Minimum = %g\n  Maximum = %g\n", ...
            total, average, minimum, maximum);
end
fclose(fileID);

type("output.txt");
