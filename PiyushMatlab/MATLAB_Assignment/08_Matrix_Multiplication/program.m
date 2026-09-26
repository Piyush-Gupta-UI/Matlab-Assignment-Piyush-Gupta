% Program 8: Validated Manual Matrix Multiplication
% Checks dimensions first; if valid, multiplies with nested loops and
% compares against MATLAB's built-in A*B.
clc; clear;

% Case 1: valid (2x3 * 3x2)   Case 2: invalid (2x3 * 2x2)
pairsA = {[2 -1 4; 3 0 5], [2 -1 4; 3 0 5]};
pairsB = {[1 6; -2 3; 4 1], [1 2; 3 4]};

fileID = fopen("output.txt", "w");
if fileID == -1
    error("Could not create output.txt");
end
fprintf(fileID, "===== Validated Matrix Multiplication =====\n");

for p = 1:length(pairsA)
    A = pairsA{p}; B = pairsB{p};
    [rA, cA] = size(A);
    [rB, cB] = size(B);
    fprintf(fileID, "\nCase %d: A is %dx%d, B is %dx%d\n", p, rA, cA, rB, cB);

    % Dimensional check: columns of A must equal rows of B
    if cA ~= rB
        fprintf(fileID, "Multiplication NOT possible: columns of A (%d) ~= rows of B (%d).\n", cA, rB);
        continue;
    end

    C = zeros(rA, cB);
    for i = 1:rA
        for j = 1:cB
            for k = 1:cA
                C(i, j) = C(i, j) + A(i, k) * B(k, j);
            end
        end
    end

    builtinC = A * B;
    fprintf(fileID, "Manual product (%dx%d):\n", rA, cB);
    for i = 1:rA
        fprintf(fileID, "%6g", C(i, :)); fprintf(fileID, "\n");
    end
    if isequal(C, builtinC)
        fprintf(fileID, "Manual result matches built-in A*B: YES\n");
    else
        fprintf(fileID, "Manual result matches built-in A*B: NO\n");
    end
end
fclose(fileID);

type("output.txt");
