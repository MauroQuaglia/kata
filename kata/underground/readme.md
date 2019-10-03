To begin with, we would like you to solve this simple exercise, you can choose whatever programming language you prefer.
You should provide sufficient evidence that your
solution is complete by, as a minimum, indicating that it works correctly in the most common cases.

We want to create a prototype of a software used for counting the accesses of a of a subway turnstile.
When a user inserts a ticket, the system receives the following input:
* a string with the ticket type: DAILY, WEEKLY, ONEWAY
* a string representing the first ticket swipe's time.  The format of this string is: day/month/year hour:minute:second , ex: "18/12/2014 09:10:57"

Every kind of ticket generates a different sound which is implemented as a string.
* a ONEWAY ticket produces a standard sound (output : BEEP OK). It cannot be used twice and it is valid only for 72 minutes. When someone tries to swipe an expired oneway ticket the output must be: BEEP KO
* a DAILY ticket generates two lines in output. The first line contains the type of the ticket:  DISPLAY DAILY and the second line should be BEEP DAILY OK if it's valid or BEEP DAILY KO otherwise. A DAILY ticket expires at midnight of the first swipe day.
* a WEEKLY ticket is similar to DAILY ticket, expect for the validity time range (it expires on sunday midnight).

Let's see a live example.
Today is 31/10/2014 12:50:00
INPUT:

DAILY 31/10/2014 10:00:00
DAILY 31/10/2013 10:00:00
ONEWAY 31/10/2014 10:00:00
WEEKLY 31/09/2014 10:00:00

OUTPUT:
DISPLAY DAILY
BEEP DAILY OK
DISPLAY DAILY
BEEP DAILY KO
BEEP OK
DISPLAY WEEKLY
BEEP WEEKLY KO