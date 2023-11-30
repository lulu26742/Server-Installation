# Learning to Run a Batch of Jobs on the Server

## Step 1: Create R Script
1) Take the R script that you have written for your analysis and simply wrap the script in a function, taking job iteration as an argument.
2) Adapt your script to run according to the job iteration (example below of a batch with 3 parallel jobs each running a different model)

if (job_Iteration == 1) {
model <- glmer(Choice ~ a * b + (1 | ID), family = "binomial", data=data)
} else if (job_Iteration == 2) {
model <- glmer(Choice ~ a + (1 | ID), family = "binomial", data=data)
} else if (job_Iteration == 3) {
model <- glmer(Choice ~ b + (1 | ID), family = "binomial", data=data)
}

3) Add the following two lines at the very end of the script (after _all_ closing brackets). These lines allow the server to take the script and run it with different job iterations.
   
  myargs = commandArgs(trailingOnly=TRUE)
  export_Fit(as.numeric(myargs[1]))
  
## Step 2: Create an NVISU Folder for all Ressources your Script Needs
1) Open your direct access to the NVISU folder on your file explorer
2) Create a new folder named after your script
3) Place your script in this folder, as well as any other resources it might need to run (e.g., datasets)

## Step 3: Create Batch Script
The batch script is the script that runs your R-script in multiple parallel iterations, each time passing a different job iteration as an argument to the script.

1) Download batch_Template.sh from this GitHub repository
2) Drag and drop it to the "slurm" folder in your master server main folder
3) Double-click on it to open it
4) Edit the batch script to adapt to your purposes:
- rename the batch script to suit the purpose of the batch you want to run
- Lines 2-4 and 17: Replace "job_Name" with whatever you want to name your job
- Line 6: You can change this number to use more CPUs per job iteration if this is necessary
- Line 7: This is where you define the number of jobs you want to run as an array (in this example it is an array from 1 to 5 in increments of 1)
- Line 9: You may need to increase this for difficult models, ask me or Fabien
- Line 10: Depending on the state of the server you may need to exclude some nodes (NB: You can check the state of the server by opening a terminal, logging in, and typing 'sinfo' --> servers that are down will be labeled as such)
- Line 11: replace your@email.com with your email (this is to receive notifications when your batch is finished)
- Line 15: replace "project_name_in_lowercase_letters" with your project name in lowercase letters and /path/to/dedicated/folder with the path to the folder you created in NVISU for this batch
- Line 19: replace "script_Name.R" with the name of your R script
5) Save your edited batch script

## Step 4: Run Batch Script
1) Open a terminal and log in
2) Navigate to the "slurm" folder that contains all your batch scripts by typing 'cd slurm'
3) Run your batch script by typing: 'sbatch batch_Script_Name.sh' (replace batch_Script_Name.sh with whatever you renamed your batch script as)
4) type 'squeue' to ensure that the batch is running in as many iterations as you specified
5) You can monitor progress output by navigating to the NVISU batch folder and checking the txt output files unique to each job iteration
6) If you want to cancel a job: "scancel jobid" (you can find the job id in the 'squeue' output)








