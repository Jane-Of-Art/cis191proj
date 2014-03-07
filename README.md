cis191proj
==========
Authors: Jane Minghui Guo, Loh Lianhan

This suite of tools consists of scripts that prompts the user for all information necessary. The invariant in the csv file is that there are no spaces between items in each line, only a comma.

./addstudent.sh
==========
Calling the above command adds a new student to the student list. the default graes for the student are all zeroes. The user will be prompted for penkey, last name, and first name.

./removestudent.sh
==========
Calling the above command removes a student from the student list. The user will be notified if the student entered does not exist. The user will be prompted for the pennkey of the student to be removed.

./addassignment.sh
==========
Calling the above command adds a new assignment to the file. The user will be prompted for the assignment name and max score, then the score of each individual student.

./addstudentgrade.sh
==========
Calling the above command adds one specific student grade to the file. The user will be prompted for the student pennkey and assignment name, then the grade obtained. The user will be warned if the assignment entered is invalid. 

./getstudentgrade.sh
==========
Calling the above command generates a list of a student's grades as well as the total grade out of points posible. The user will be prompted for the pennkey of the student.

./getallstudentgrades.sh
==========
Calling the above command generates a list of all students and their grades out of points possible. The user does not need to input further information. 

==========
==========
Han's Scripts
==========
==========

./archive.sh
==========
Calling the above command creates a tar file of the current grade file. The user will be prompted for the current year and semester to name the file.
