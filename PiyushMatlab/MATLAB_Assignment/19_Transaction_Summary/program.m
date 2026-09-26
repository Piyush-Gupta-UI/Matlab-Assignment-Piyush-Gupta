% Program 19: Mini Transaction Summary
% Input format (transactions.txt): one amount per line.
%   positive = credit, negative = debit, zero = no change.
clc; clear;

inID = fopen("transactions.txt", "r");
if inID == -1
    disp("Error: transactions.txt could not be opened.");
    return;
end
amounts = fscanf(inID, "%f");
fclose(inID);

totalCredit = 0; totalDebit = 0;
creditCount = 0; debitCount = 0; noChangeCount = 0;
largestCredit = 0; largestDebit = 0;    % debit tracked as magnitude

for i = 1:length(amounts)
    amt = amounts(i);
    if amt > 0
        totalCredit = totalCredit + amt;
        creditCount = creditCount + 1;
        if amt > largestCredit
            largestCredit = amt;
        end
    elseif amt < 0
        totalDebit = totalDebit + abs(amt);
        debitCount = debitCount + 1;
        if abs(amt) > largestDebit
            largestDebit = abs(amt);
        end
    else
        noChangeCount = noChangeCount + 1;
    end
end
netBalance = totalCredit - totalDebit;

outID = fopen("output.txt", "w");
if outID == -1
    error("Could not create output.txt");
end
fprintf(outID, "===== Mini Transaction Summary =====\n");
fprintf(outID, "Transactions read       : %d\n", length(amounts));
fprintf(outID, "%s\n", repmat("-", 1, 38));
fprintf(outID, "No.   Amount      Type\n");
for i = 1:length(amounts)
    if amounts(i) > 0
        kind = "Credit";
    elseif amounts(i) < 0
        kind = "Debit";
    else
        kind = "No change";
    end
    fprintf(outID, "%-4d %9.2f   %s\n", i, amounts(i), kind);
end
fprintf(outID, "%s\n", repmat("-", 1, 38));
fprintf(outID, "Total credits           : %.2f\n", totalCredit);
fprintf(outID, "Total debits            : %.2f\n", totalDebit);
fprintf(outID, "Net balance             : %.2f\n", netBalance);
fprintf(outID, "Credit transactions     : %d\n", creditCount);
fprintf(outID, "Debit transactions      : %d\n", debitCount);
fprintf(outID, "No-change transactions  : %d\n", noChangeCount);
fprintf(outID, "Largest credit          : %.2f\n", largestCredit);
fprintf(outID, "Largest debit magnitude : %.2f\n", largestDebit);
fclose(outID);

type("output.txt");
