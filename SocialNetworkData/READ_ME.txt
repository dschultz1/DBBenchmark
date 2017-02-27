Open the folder : 'large'.
Unzip all files into 'large' folder.

Locate your mySql initialization/config file. On Windows the default is C:\ProgramData\MySQL\MySQL Server 5.7\my.ini
Add : 'secure-file-priv=""' to the end of the file. this will allow for the use of the LOAD DATA command.

Add C:\Program Files\MySQL\MySQL Utilities 1.6\ to PATH     \\I genuinely dont remember why I needed this.

In MySQL Workbench open all the files in the 'scripts' folder.
Change the path to the .csv files where applicable in each script.
Run each script.

Note that the 'med' script took over 10 min to run, and at this time I have not run the large.

Your MySQL databases are now set up.

