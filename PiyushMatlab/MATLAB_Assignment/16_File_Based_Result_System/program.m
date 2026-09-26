% Program 16: File-based Student Result System
%
% INPUT FORMAT of marks.txt (purely numeric, space separated):
%   Each line = one student:  RollNo  Sub1  Sub2  Sub3  Sub4
%   Example line:  101 72 65 80 58
%   All 4 subject marks are out of 100.
%
% Pass rule: student passes only if EVERY subject mark is >= 40.
clc; clear;

numSubjects = 4;
passMark = 40;

inID = fopen("marks.txt", "r");
if inID == -1
    disp("Error: marks.txt could not be opened.");
    return;
end
% Read 5 values per row (roll + 4 subjects); transpose to get one row per student
data = fscanf(inID, "%f", [numSubjects + 1, Inf])';
fclose(inID);

outID = fopen("result.txt", "w");
if outID == -1
    error("Could not create result.txt");
end
fprintf(outID, "===== Student Result Report =====\n");
fprintf(outID, "Pass rule: every subject >= %d\n\n", passMark);
fprintf(outID, "%-6s %5s %5s %5s %5s %7s %8s  %s\n", "Roll", "S1", "S2", "S3", "S4", "Total", "Average", "Status");
fprintf(outID, "%s\n", repmat("-", 1, 58));

passCount = 0; failCount = 0;
for s = 1:size(data, 1)
    roll = data(s, 1);
    total = 0;
    failedSubject = false;
    for j = 2:numSubjects + 1
        total = total + data(s, j);
        if data(s, j) < passMark
            failedSubject = true;
        end
    end
    average = total / numSubjects;

    if failedSubject
        status = "Fail";
        failCount = failCount + 1;
    else
        status = "Pass";
        passCount = passCount + 1;
    end
    fprintf(outID, "%-6d %5g %5g %5g %5g %7g %8.2f  %s\n", roll, data(s, 2:end), total, average, status);
end

fprintf(outID, "\nStudents: %d   Passed: %d   Failed: %d\n", size(data, 1), passCount, failCount);
fclose(outID);

type("result.txt");
