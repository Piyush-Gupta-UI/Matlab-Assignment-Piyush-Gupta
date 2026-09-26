% Program 20: Integrated Student Record Processor (Capstone)
% Input format (student_marks.txt): one mark per line (out of 100).
% Reads marks, validates them, calls resultSummary() and writes a complete
% report to final_report.txt. Handles file-open failure and invalid marks.
clc; clear;

inputFile = "student_marks.txt";
reportFile = "final_report.txt";
passMark = 40;

% ---- Read input file safely ----
inID = fopen(inputFile, "r");
if inID == -1
    outID = fopen(reportFile, "w");
    if outID ~= -1
        fprintf(outID, "Error: %s could not be opened. No report generated.\n", inputFile);
        fclose(outID);
    end
    fprintf("Error: %s could not be opened.\n", inputFile);
    return;
end
marks = fscanf(inID, "%f");
fclose(inID);

% ---- Process using the user-defined function ----
s = resultSummary(marks, passMark);

% ---- Write the complete report ----
outID = fopen(reportFile, "w");
if outID == -1
    error("Could not create %s", reportFile);
end
fprintf(outID, "==========================================\n");
fprintf(outID, "   INTEGRATED STUDENT RECORD - REPORT\n");
fprintf(outID, "==========================================\n");
fprintf(outID, "Source file       : %s\n", inputFile);
fprintf(outID, "Marks read        : %d\n", length(marks));
fprintf(outID, "Valid marks (%d)   : ", length(s.valid)); fprintf(outID, "%g ", s.valid);
fprintf(outID, "\nInvalid marks (%d) : ", length(s.invalid)); fprintf(outID, "%g ", s.invalid);
fprintf(outID, "\n(Valid range is 0-100; invalid marks are excluded from all calculations.)\n\n");

fprintf(outID, "Student-wise status:\n");
for i = 1:length(s.valid)
    if s.valid(i) >= passMark
        status = "Pass";
    else
        status = "Fail";
    end
    fprintf(outID, "  Student %2d : %5g  %s\n", i, s.valid(i), status);
end

fprintf(outID, "\n------------- Summary -------------\n");
fprintf(outID, "Total          : %g\n", s.total);
fprintf(outID, "Average        : %.2f\n", s.average);
fprintf(outID, "Highest        : %g\n", s.highest);
fprintf(outID, "Lowest         : %g\n", s.lowest);
fprintf(outID, "Pass count     : %d (pass mark %d)\n", s.passCount, passMark);
fprintf(outID, "Fail count     : %d\n", s.failCount);
fprintf(outID, "Pass percentage: %.2f%%\n", s.passPercent);
fprintf(outID, "Overall result : %s\n", s.overall);
fclose(outID);

type(reportFile);
