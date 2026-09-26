% Program 1: Student Result Analyzer
% Validates a vector of marks (0-100), ignores invalid entries and
% reports total, average, highest, lowest and Pass/Fail counts.
clc; clear;

marks = [84 57 112 33 69 -8 91 26 75 48 150 62];
passMark = 40;          % pass condition: mark >= 40

% Validation: keep only marks lying between 0 and 100
validMarks = [];
invalidMarks = [];
for i = 1:length(marks)
    if marks(i) >= 0 && marks(i) <= 100
        validMarks(end+1) = marks(i);
    else
        invalidMarks(end+1) = marks(i);
    end
end

total = 0; average = 0; highest = 0; lowest = 0;
passCount = 0; failCount = 0;

if ~isempty(validMarks)
    highest = validMarks(1);
    lowest = validMarks(1);
    % Single loop for total, highest/lowest and Pass/Fail classification
    for i = 1:length(validMarks)
        total = total + validMarks(i);
        if validMarks(i) > highest
            highest = validMarks(i);
        end
        if validMarks(i) < lowest
            lowest = validMarks(i);
        end
        if validMarks(i) >= passMark
            passCount = passCount + 1;
        else
            failCount = failCount + 1;
        end
    end
    average = total / length(validMarks);
end

% Save the summary using file handling
fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Student Result Analyzer =====\n");
fprintf(fileID, "Input marks   : "); fprintf(fileID, "%g ", marks);
fprintf(fileID, "\nValid marks   : "); fprintf(fileID, "%g ", validMarks);
fprintf(fileID, "\nIgnored marks : "); fprintf(fileID, "%g ", invalidMarks);
fprintf(fileID, "\nPass condition: mark >= %d\n", passMark);
if isempty(validMarks)
    fprintf(fileID, "No valid marks found.\n");
else
    fprintf(fileID, "Total         : %g\n", total);
    fprintf(fileID, "Average       : %.2f\n", average);
    fprintf(fileID, "Highest       : %g\n", highest);
    fprintf(fileID, "Lowest        : %g\n", lowest);
    fprintf(fileID, "Pass count    : %d\n", passCount);
    fprintf(fileID, "Fail count    : %d\n", failCount);
end
fclose(fileID);

type("output.txt");
