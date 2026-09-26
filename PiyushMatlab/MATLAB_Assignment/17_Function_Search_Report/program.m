% Program 17: Function-based Search + Report File
% Reads an array from numbers.txt (one value per line), searches defined
% targets with findValue() and saves the results to output.txt.
clc; clear;

inID = fopen("numbers.txt", "r");
if inID == -1
    disp("Error: numbers.txt could not be opened.");
    return;
end
arr = fscanf(inID, "%f")';
fclose(inID);

targets = [5 21 50];    % present (repeated), present (once), absent

outID = fopen("output.txt", "w");
if outID == -1
    error("Could not create output.txt");
end
fprintf(outID, "===== Function-based Search Report =====\n");
fprintf(outID, "Array from numbers.txt: "); fprintf(outID, "%g ", arr);
fprintf(outID, "\n\n%-8s %-12s %-12s %s\n", "Target", "First index", "Occurrences", "Remark");

for t = 1:length(targets)
    [firstIndex, count] = findValue(arr, targets(t));
    if firstIndex == -1
        remark = "Not found";
    else
        remark = "Found";
    end
    fprintf(outID, "%-8g %-12d %-12d %s\n", targets(t), firstIndex, count, remark);
end
fclose(outID);

type("output.txt");
