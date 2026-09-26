% Program 2: Second Largest Distinct Value with Report
% Finds the second largest DISTINCT value without using sort().
% Repeated maximum values are handled correctly.
clc; clear;

arr = [23 67 14 67 51 23 88 88 39 51];

% Pass 1: find the largest value
largest = arr(1);
for i = 2:length(arr)
    if arr(i) > largest
        largest = arr(i);
    end
end

% Pass 2: find the largest value that is strictly smaller than 'largest'
found = false;
secondLargest = 0;
for i = 1:length(arr)
    if arr(i) < largest
        if ~found || arr(i) > secondLargest
            secondLargest = arr(i);
            found = true;
        end
    end
end

% Save input array and result
fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Second Largest Distinct Value =====\n");
fprintf(fileID, "Input array    : "); fprintf(fileID, "%g ", arr);
fprintf(fileID, "\nLargest value  : %g\n", largest);
if found
    fprintf(fileID, "Second largest distinct value: %g\n", secondLargest);
else
    fprintf(fileID, "No second distinct value exists (all elements are equal).\n");
end
fclose(fileID);

type("output.txt");
