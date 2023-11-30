# Getting your Server Ready for an R Script

The goal of this repository is to walk you through the installation of the ENS server to be able to use it with an R script.

The instructions below are accompanied by [illustrative slides]([url](https://docs.google.com/presentation/d/1-60jJZi6V8T_XxZXX99kDlh_ueFST3E9cQiORR4xsr4/edit#slide=id.g29848d8ab0a_0_10)). 

## Step 1: Create a Server Account

Contact Fabien Cerotti by email to request the creation of your server account. Provide the below information
- Last name
- Name
- Supervisor
- Short Project Name (3 words or less)
- Software(s) you will be running scripts on (e.g., R)

## Step 2: Set up Password

Fabien will come see you to set up your own personal password

## Step 3: Log in for the First Time (see slides for illustration)
1) Open up a terminal
- go to the Windows start menu
- type 'cmd'
- select the first app that appears
2) Log in
- in the terminal type 'ssh username@server.code'
- then type your password when prompted and press enter (NB: you cannot see your password as you type it)

Server codes:
- Master: 129.199.81.23
- NVISU: 129.199.81.42

Repeat as many times as you wish! (you can have multiple sessions open in parallel)

## Step 4: Set up Direct Access from Computer (see slides for illustration)
1) Set up direct access for the master server (see slide 7)
2) Set up direct access for NVISU (see slide 9)

## Step 5: Install all Necessary Software
1) Download the script titled "install.Software.sh" from this GitHub repository
2) Drag and drop it to your Master home page (via your direct access in your File Explorer)
3) Open up a terminal and log in to the master server
4) Type the following command: 'bash install.Software.sh' (NB: This will run for roughly 5-6 hours)

## Step 6: Open R on the Server
1) Open up a terminal and log in
2) Type 'R', this should start R through the server on the command window you're typing in
3) Test that R is working by typing a common R command such as 'systemInfo()' which should generate some information about your current R session
4) Exit R by typing 'q()' and then pressing 'n' followed by enter

## Step 7: Download Packages Necessary for your Script
I like to download all my packages in advance so I can deal with any dependency issues directly, to do so, follow these steps
1) Open up a terminal and log in
2) Start R by typing 'R'
3) type 'install.packages(packagename)'
4) You may have to select your nearest CRAN mirror, ours is number 35 (Paris, France), so type '35'
5) The installation will take place
6) Exit R: 'q()' --> 'n' --> enter

























