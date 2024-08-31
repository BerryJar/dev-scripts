
### Dev Scripts

This is a collection of useful scripts I have written to streamline my development process. They are available to download and are free to be edited.

If you use these scripts and run into an error which tells you the environment variable is not set, it is because you have not yet set the environment variable.

#### Defining environment variables 

To begin, you can print a list of all currently defined environment variables by running command `printenv` in your command line. This will print a list with the syntax `VARIABLE=definition`. To define an environment variable, 
you can run command `export VARIABLE=definition`. You can check to see if it's properly defined by running `printenv VARIABLE`, which will print the definition to the command line. 

#### Persistent environment variables

For the environment variable to persist between sessions (user logoff/login, shutdowns), you must add it to your ~/.bashrc file. To achieve this, I will list two methods. First begin by running `cd ~/`

##### GUI method

You can use your favorite editor to append the line to the file. In this example, I will use nano.

First run `nano ~/.bashrc`. You can then add the same command that you ran to define the environment variable, to the end of the file. For example, if you ran `export VARIABLE=definiton` earlier and want it to persist, you would add `export VARIABLE=definition` to the end of the file.

You must then run `source .bashrc` to apply the changes made to the file.

##### Command method

You can append the line to the file with a single command. For example, if you ran `export VARIABLE=definiton` earlier and want it to persist, you would run command `echo "export VARIABLE=definition" | sudo tee -a ~/.bashrc`. Once the command is run, it will be added to the file.

You must then run `source .bashrc` to apply the changes made to the file.

#### Checking your work

You should now be able to restart your computer, then run the `printenv` command when you log in. If everything was performed correctly, somewhere in the list you will find the environment variables you defined. You can also run `printenv VARIABLE` to print the definition directly to your command line.






