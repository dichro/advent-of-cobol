identification division.
program-id. day-1.


environment division.
input-output section.
       file-control.
       select module-file assign to 'day-1-input.txt'
           organization is line sequential.


data division.
file section.
fd module-file record varying from 1 to 8 characters depending on line-length.
01 module-mass pic X(8).

working-storage section.
01 state.
       05 eof-ind pic x value "n".
       05 total-mass pic 9(8).
       05 total-modules pic 9(5).
       05 line-length pic 99.
       05 module-mass-num pic 9(6).


procedure division.
       main.
           display total-mass.
           open input module-file.
           perform read-and-process until eof-ind = "Y".

       read-and-process.
           read module-file at end perform wrap-up.
           display total-mass.
           display module-mass.
           display line-length.
           compute module-mass-num = function numval(module-mass)
           add function numval(module-mass) to total-mass.
           display "TOTAL: "total-mass.
           add 1 to total-modules.
           
       wrap-up.           
           move "Y" to eof-ind.
           display total-modules.
           display total-mass.
