% Program 3: Number Digit Analysis
% Uses a while loop with mod/floor (no string conversion) to analyse digits.
clc; clear;

num = 48284;

% Validate: must be a positive integer
if num <= 0 || num ~= fix(num)
    error("Please enter a positive integer.");
end

original = num;
digitCount = 0; digitSum = 0;
evenCount = 0; oddCount = 0;
reversed = 0;

while num > 0
    digit = mod(num, 10);            % extract last digit
    digitCount = digitCount + 1;
    digitSum = digitSum + digit;
    if mod(digit, 2) == 0
        evenCount = evenCount + 1;
    else
        oddCount = oddCount + 1;
    end
    reversed = reversed * 10 + digit; % build reversed number
    num = floor(num / 10);           % remove last digit
end

if reversed == original
    palindrome = "Yes";
else
    palindrome = "No";
end

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Number Digit Report =====\n");
fprintf(fileID, "Number          : %d\n", original);
fprintf(fileID, "Number of digits: %d\n", digitCount);
fprintf(fileID, "Sum of digits   : %d\n", digitSum);
fprintf(fileID, "Even digits     : %d\n", evenCount);
fprintf(fileID, "Odd digits      : %d\n", oddCount);
fprintf(fileID, "Reversed number : %d\n", reversed);
fprintf(fileID, "Palindrome      : %s\n", palindrome);
fclose(fileID);

type("output.txt");
