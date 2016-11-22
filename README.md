Appointment Booker Tech Test
========

This is a simple ruby script to book appointments based on a provided JSON file with available booking times and doctors.

To run the app simply run:
```shell
$ ruby appointment.rb 12:50
```
The app will book and return the nearest available time to the time provided, if the time requested is available it will book that time slot. Once an appointment is booked, the availability will be added to JSON file so the same time slot cannot be booked again.

Solving the problem
----
- Take a time passed in as an argument to the script
- Format the time to match the times in the JSON file
- Parse the JSON file to extract the information
- Check the time provided is between the available appointment slots
- Check the appointment time is available to be booked
- Return the booked time slot, or the nearest available, formatted to match the time provided
- Write the availability to the JSON file so the appointment slot cannot be booked again
- Create a file to run the script and ensure an argument is passed to the script


How to use:
----

Clone the repository:
```shell
$ git clone https://github.com/alexfakhri/appointment-booker-tech-test.git
```

Change into the directory:
```shell
$ cd appointment-booker-tech-test
```

To run tests:
```shell
$ rspec
```

To book an appointment:
```shell
$ ruby appointment.rb 12:50
```
Change the time to any time you want between 8:00am and 15:00.

Task
----

Your task is to create an app that will allow patients to book appointments with a doctor, using the dataset provided.

Requirements
----
You should create a command line app that accepts a single argument, which is the time that the patient would like to book to see a doctor. Eg:

$ ./availability.rb 12:40

The app should check which is the next available slot and book it. It should print the time of the appointment that was booked

Additional Requirements
----------
Patients cannot book appointments before 8am and after 3pm. Once an availability has been used up for an appointment it cannot be booked again.

In the dataset there are multiple doctors (id: 1 & 2) and each doctor can only have 1 appointment per slot. For example, you could potentially book 12:20 once for doctor 1 and again for doctor 2.

Constraints
-------
Please use the JSON file provided to load availability into your app.
Your app should be an executable ruby script (command line).
Your app should accept a time (eg: 12:40)
Your app should print the time that was booked (eg: 1:10)
