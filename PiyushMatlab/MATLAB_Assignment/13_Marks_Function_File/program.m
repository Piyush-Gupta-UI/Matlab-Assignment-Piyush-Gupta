% Program 13: Marks Analysis Function + File Output
% Calls analyzeMarks() and writes the complete analysis to result.txt.
clc; clear;

marks = [67 92 -12 38 74 120 55 29 81 101 46];

[average, highest, passCount, failCount, validMarks, invalidMarks] = analyzeMarks(marks);

fileID = fopen("result.txt", "w");
if fileID == -1
    error("Could not create result.txt");
end
fprintf(fileID, "===== Marks Analysis Report =====\n");
fprintf(fileID, "All input marks : "); fprintf(fileID, "%g ", marks);
fprintf(fileID, "\nValid marks     : "); fprintf(fileID, "%g ", validMarks);
fprintf(fileID, "\nInvalid (ignored): "); fprintf(fileID, "%g ", invalidMarks);
fprintf(fileID, "\nValid count     : %d\n", length(validMarks));
fprintf(fileID, "Average         : %.2f\n", average);
fprintf(fileID, "Highest         : %g\n", highest);
fprintf(fileID, "Pass count (>=40): %d\n", passCount);
fprintf(fileID, "Fail count      : %d\n", failCount);
fclose(fileID);

type("result.txt");
