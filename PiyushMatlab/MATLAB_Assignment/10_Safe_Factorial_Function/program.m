% Program 10: Validated Factorial Function
% Calls safeFactorial() with valid and invalid test cases.
clc; clear;

testValues = [6 0 9 -4 3.7];   % includes a negative and a non-integer case

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Safe Factorial Test Cases =====\n");

for i = 1:length(testValues)
    n = testValues(i);
    [result, isValid] = safeFactorial(n);
    if isValid
        fprintf(fileID, "Test %d: n = %g  ->  %g! = %g\n", i, n, n, result);
    else
        fprintf(fileID, "Test %d: n = %g  ->  Invalid input (must be a non-negative integer)\n", i, n);
    end
end
fclose(fileID);

type("output.txt");
