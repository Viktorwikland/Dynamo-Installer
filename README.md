# Dynamo Installer

The idea of Dynamo Installer was born when I started creating Dynamo scripts to help my colleagues and noticed that most of them had no experience with Dynamo and didnt know how to run, or make scripts accessible within Dynamo Player.
This was especially true for scripts containing custom nodes and packages where even colleagues that had some experience with dynamo sometimes accedentally installed the wrong version of a package which might break the script.


The Dynamo Installer simplifies the process of getting your scripts and all other supporting files, into the Revit default folders - making them accessible inside of Dynamo player within just a few mouse clicks.

## How to run
1. Run RunMe.bat
2. A powershell script launches, presenting a small ui prompting user to specify which revit version the files are compatible with.
  ![image](https://github.com/Viktorwikland/Dynamo-Installer/assets/164318861/51411a40-2ee0-4385-ae42-87637c1ba8b7)
3. Choose version and press "OK"
4. The files are now copied into the corresponding folders depending on file type.
5. Installation result presented in a dialog box
   
   ![image](https://github.com/Viktorwikland/Dynamo-Installer/assets/164318861/9563b288-a058-4b9f-ab12-acc663657a34)

## How it works

The Dynamo Installer itself requires no installation, making it easy to place in a shared folder allowing colleagues to solely install the dynamo related files.

The folder itself can be renamed to whatever, preferebly to something descriptive of its contents.

Dynamo scripts and custom nodes should be placed at the top level of the folder, alongside the .bat and .ps1.
Custom packages can be copied in their entierty and should be placed in the subfolder named "packageFiles".

![image](https://github.com/Viktorwikland/Dynamo-Installer/assets/164318861/623826d7-61d9-4221-9305-f12f4fa787ab)


The folder can include any number of dynamo scripts, custom nodes and custom packages.

Dynamo scripts and custom nodes can be updated with the installer as it writes over any files in the target folder if a name clashes. This makes it easy to publish further adjustments to your scripts and make sure your colleagues have the same version of the used custom packages and nodes.





### Notes:
This solution of managing dynamo is made extra easy since I know all of my colleagues have had all of the Revit versions installed the same way - meaning the directories of the default folders and dynamo versions dont differ from computer to computer.

You might have to change the directories specified in the .ps1 slightly depending on which version of dynamo your company uses with each Revit version.

Current folders:

![image](https://github.com/Viktorwikland/Dynamo-Installer/assets/164318861/0d97985c-2f19-4005-b7bd-54ed4313b730)

