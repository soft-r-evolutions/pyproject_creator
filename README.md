# pyproject_creator

## Overview

Project to generate Python project with the correct layout according to 
(Project layout reference guide)[https://realpython.com/python-application-layouts/].

After this script will get an empty project containing the right files and classes
depending the option you set.

### Application layouts

You have 3 differents application layouts:

* simple: Simple application layout (only one script).
* single: Single Package project layout.

### Application environment

Optional. If is_github is specified the project will set up the classic Python project
for github. This will execute non-regression tests, linter for every pull-request.

**is_github option requires project_space argument.**

## Usage

```
./pyproject-creator.sh PROJECT_NAME  "End user ProjectName" [OPTIONS] [Github_projectspace]
With:
PROJECT_NAME: your Python project name
End user ProjectName: Project name for documentation...
OPTIONS can be combined by any seperator except space.
Option list are: 
- [simple|single]: Python project layout.
-   simple: Simple application project layout.
-   single: Single package project layout.
- github your module integrate a github workflow.
- erase: your module integrate a github workflow.
Github_projectspace: if your module integrate a github workflow specify github project space.

The new project will be written to projects folder.
If the output folder already exists the project will exit
in error.
```

### Example Simple layout project

```bash
./pyproject_creator.sh my_project "My Project"
```

### Example Single package layout project

Erase option will overwrite previous project.

```bash
./pyproject_creator.sh my_project "My Project" single,erase
```

### Example Application with internal lib package layout project and github

Erase option will overwrite previous project.

```bash
./pyproject_creator.sh my_project "My project" single,erase,github soft-r-evolution
```

## References

* [Python Application Layout](https://realpython.com/python-application-layouts/)
* [Docs Python Guide - Structuring](https://docs.python-guide.org/writing/structure/)
* [Semantic Versionning](https://semver.org/)
