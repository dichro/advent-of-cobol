identification division.
program-id. day-1.


environment division.
input-output section.
       file-control.
       select module-file assign to 'day-1-input.txt'
           organization is line sequential.


data division.
file section.
fd module-file.
      *> Making this field numeric results in the contents being decimally left-justified for subsequent math!
01 module-mass pic X(8).

working-storage section.
01 state.
       05 eof-ind pic x value "n".
       05 total-mass pic 9(8).
       05 total-fuel pic 9(8).
01 math.
       05 module-fuel pic 9(8).


procedure division.
       main.
           open input module-file.
           perform read-and-process until eof-ind = "Y".
           stop run.

       read-and-process.
           read module-file at end perform wrap-up.
           add function numval(module-mass) to total-mass.
           divide function numval(module-mass) by 3 giving module-fuel.
           subtract 2 from module-fuel.
           add module-fuel to total-fuel.
           
       wrap-up.           
           move "Y" to eof-ind.
           display total-mass.
           display total-fuel.
           close module-file.
