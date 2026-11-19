# Xojo Source code library assistant

## Description
The purpose to this tool is to help managing source code libraries used in Xojo projects.

The intended purpose is 

- to let the user pick a source code library and automate its inclusion in an existing Xojo project
- to manage a local library repository
- to keep track which project is using which library
- to keep track of different versions of the library


## Limitations of this first version

There are no support for remote source code repository, mainly because such repository does not exist for Xojo. 

Users must be carefull when adding or updating a source code library to a project that is already opened in the IDE and manually reload the project once the update is completed. This is a limitation coming from the IDE itself, although it might be possible to address this (partially) with IDE scripting (not investigated)

Not tested with encrypted modules or classes, and likely does not work with those.

The source code repository managed by the assistant is a folder structure in 'Application data' folder where all files are stored as they appear in the source project.


## Next steps
Add option to pull a tagged version of a project containing one or more libraries from Github.

Compress the libraries stored in the repository to save disk space.

## Requirements

The Xojo projects containing the library and the Xojo project where the library must be installed must be saved in version control format, where each file is stored as plain text.

### Requirements for the Xojo project containing the library/libraries

The project must contain 
- a top level folder named 'Shareable' where the library or libraries are stored.
- a subfolder per library directly under 'Shareable' (for example my_nice_library)
- each subfolder contains a module named  starts with 'LibraryInfo' followed by the name of the library (for example libraryInfo_My_nice_library), the name does not need to match the name of the library, a suffix after 'LibraryInfo' is required to make the name of the module unique so it is easier to adhere to the proposed rule.
- The module should contain constants describing the library:
    - LibraryAuthor (string)
    - LibraryName (string)
    - LibraryVersion (string)
   
   Those constants are presented to the user by the Assistant,and the following default values are used:
    - LibraryAuthor defaults to 'Unknown'
    - LibraryName defaults to the name of the folder
    - LibraryVersion defaults to 'Unspecified'


### Requirements for the Xojo project using the library/libraries

After integration of at least one library, the project will contain
- a top level folder named 'UsedSourceLibraries' where the library or libraries are added.

- the library or libraries structured as in the library source:
    - a folder named after the library
    - a library information module under that folder
    - all project items related to each library

    
### Integration with libraries using Git locally

The process to add a library to the repository is as follow:

- checkout the relevant version of the library
- use the assistant to include the library in the local repository

