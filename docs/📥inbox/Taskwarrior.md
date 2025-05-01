https://taskwarrior.org/docs/


task
Config => yes
## Commands

task add "Task"
task list 
task "ID" delete 
task "ID" completed
task add "Subtask" depends:on:"MaintaskID"
task "ID" info



task add "Your task description/ID" due:"YYYY-MM-DD"T"HH:MM"
task add "Complete assignment" due:tomorrow
task add "Prepare presentation" due:next Monday
task <task_id> modify due:YYYY-MM-DDTHH:MM


![[task-2.3.0.ref.pdf]]