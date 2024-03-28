The idea of Dynamo Installer was born when I started creating Dynamo scripts to help my colleagues and noticed that most of them had no experience with Dynamo and didnt know how to run, or make my scripts accessible within Dynamo Player.
This was especially true for scripts containing custom packages or nodes where even colleagues that had some experience with dynamo sometimes accedentally installed the wrong version of a package which might breake the script.

Dynamo Installer simplifies the process of getting your scripts and all other supporting files, such as custom packages and nodes into the Revit default folders - making them accessible inside of Dynamo player within just a few mouse clicks.




This is achived by a template folder prepared by you and should include at the very least a dynamo script that is able to run from dynamo player.

Dynamo scripts and custom nodes should be placed at the top level of the folder, alongside the .bat and .ps1.
Custom packages can be copied in their entierty and should be placed in the subfolder named "packageFiles".



The folder can include any number of dynamo scripts, custom nodes and custom packages.

Dynamo scripts and custom nodes can be updated with the installer as it writes over any files in the target folder if a name clashes. This makes it easy to publish further adjustments to your scripts and make sure your colleagues have the same version of the used custom packages and nodes.






Note: This solution of managing dynamo is made extra easy since I know all of my colleagues have had all of the Revit versions installed the same way - meaning the directories of the default folders and dynamo versions dont differ from computer to computer.

You might have to change the directories specified in the .ps1 slightly depending on which version of dynamo your company uses with each Revit version.
