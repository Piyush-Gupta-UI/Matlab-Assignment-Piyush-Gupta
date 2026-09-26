% Program 7: Manual Matrix Maximum with Position
% Nested-loop search (no max()). Starting from the first element (not 0)
% makes the search correct even when every element is negative.
clc; clear;

matrices = {[3 18 -4; 11 7 25; -9 16 2], ...        % mixed values
            [-15 -6 -22; -3 -19 -8; -11 -27 -5]};    % all negative

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Manual Matrix Maximum =====\n");

for m = 1:length(matrices)
    A = matrices{m};
    maxVal = A(1, 1); maxRow = 1; maxCol = 1;
    for i = 1:size(A, 1)
        for j = 1:size(A, 2)
            if A(i, j) > maxVal
                maxVal = A(i, j);
                maxRow = i;
                maxCol = j;
            end
        end
    end

    fprintf(fileID, "\nMatrix %d:\n", m);
    for i = 1:size(A, 1)
        fprintf(fileID, "%6g", A(i, :)); fprintf(fileID, "\n");
    end
    fprintf(fileID, "Maximum value : %g\n", maxVal);
    fprintf(fileID, "Position      : Row %d, Column %d (1-based)\n", maxRow, maxCol);
end
fclose(fileID);

type("output.txt");
