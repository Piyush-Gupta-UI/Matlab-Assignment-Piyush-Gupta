% Program 14: Persistent Attendance Log
% Asks for student name and attendance status and APPENDS each record to
% attendance.txt (mode "a"), so previous records are never deleted.
% Accepted status values: P (Present), A (Absent), L (Leave).
clc; clear;

acceptedCodes = {"P", "A", "L"};
statusNames   = {"Present", "Absent", "Leave"};

numRecords = input("How many records do you want to enter? ");

fileID = fopen("attendance.txt", "a");
if fileID == -1
    error("Could not open attendance.txt");
end

saved = 0;
for r = 1:numRecords
    name = strtrim(input(sprintf("Record %d - Student name: ", r), "s"));
    if isempty(name)
        fprintf("Empty name - record skipped.\n");
        continue;
    end

    code = upper(strtrim(input("Status (P/A/L): ", "s")));

    % Validate status before writing
    idx = 0;
    for k = 1:length(acceptedCodes)
        if strcmp(code, acceptedCodes{k})
            idx = k;
            break;
        end
    end

    if idx == 0
        fprintf("Invalid status '%s' for %s - record NOT saved.\n", code, name);
    else
        fprintf(fileID, "%-12s | %s\n", name, statusNames{idx});
        saved = saved + 1;
        fprintf("Saved: %s - %s\n", name, statusNames{idx});
    end
end
fclose(fileID);

fprintf("\n%d record(s) appended. Current attendance.txt:\n", saved);
type("attendance.txt");
