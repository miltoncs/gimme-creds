## Command Syntax

"gimme-creds" [GROUP_NAME]+ [PROFILE_NAME]? [-a ARGS]?

## Overview

Organization: groups of groups (etc.) of profiles

Profile evaluation order: imports, environment variables, and then commands

## Features:

- If profile is not specified in the command but a "default" profile defined in this file, that profile is used
- If profile is not specified in the command and if group has only one profile defined in this file, that profile is
  used
- if {} is present in the script, it will be replaced with whatever is passed via '-a'

## Config file Grammar

### GROUP

NAME: (MAP)
    [GROUP]+ OR [PROFILE]+

### PROFILE
```yaml
NAME: (MAP)
    "import" (LIST):
        [- [GROUP_NAME (NONEMPTY STRING)]+ [PROFILE_NAME (NONEMPTY STRING)] [-a ARGS]?]+
    "env" (MAP):
        [KEY (NONEMPTY STRING): (NONEMPTY STRING)]+
    "script" (LIST):
        [- COMMAND (NONEMPTY STRING)]+
```
