% Program 5: Search with First Position and Occurrence Count
% First position is found with a loop + break; occurrences are counted
% with a second loop. MATLAB indexing starts at 1.
clc; clear;

arr = [16 4 27 9 27 13 27 5 9];
targets = [27 40];      % one present value and one absent value

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Manual Search Report =====\n");
fprintf(fileID, "Array: "); fprintf(fileID, "%g ", arr); fprintf(fileID, "\n");

for t = 1:length(targets)
    target = targets(t);

    % Find first position and stop searching immediately
    firstPos = -1;
    for i = 1:length(arr)
        if arr(i) == target
            firstPos = i;
            break;
        end
    end

    % Count total occurrences (only needed if value exists)
    occurrences = 0;
    if firstPos ~= -1
        for i = firstPos:length(arr)
            if arr(i) == target
                occurrences = occurrences + 1;
            end
        end
    end

    fprintf(fileID, "\nSearch value : %g\n", target);
    if firstPos == -1
        fprintf(fileID, "Result       : Value %g is not present in the array.\n", target);
    else
        fprintf(fileID, "First position (1-based): %d\n", firstPos);
        fprintf(fileID, "Total occurrences      : %d\n", occurrences);
    end
end
fclose(fileID);

type("output.txt");
