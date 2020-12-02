identification division.
program-id. day-1.


environment division.
input-output section.
       file-control.
       select input-file assign to 'day-1-input.txt'
           organization is line sequential.


data division.
file section.
fd input-file.
      *> Making this field numeric results in the contents being decimally left-justified for subsequent math!
01 input-string pic X(8).

working-storage section.
01 state.
       05 eof-ind pic x value "n".
       05 input-value pic 9(8).
       05 product pic 9(8).
       05 seen occurs 2020 times pic 9.
01 locals.
       05 complement pic 9(4).

procedure division.
       main.
           open input input-file.
           perform read-and-process until eof-ind = "Y".
           stop run.

       read-and-process.
           read input-file at end perform wrap-up.
           move function numval(input-string) to input-value.
           move 2020 to complement.
           subtract input-value from complement.
           if seen(complement) = 1 then
               multiply input-value by complement giving product
           end-if.
           move 1 to seen(input-value).
           
       wrap-up.           
           move "Y" to eof-ind.
           display product.
           close input-file.
