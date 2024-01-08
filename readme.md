# Gimme Creds

Gimme creds is inspired by gimme-aws-creds and syntax inspired by gitlab ci.

Run a simple command like this:
`gimme-creds env devops`
and with a readable config file like this:
```yaml
env:
  devops:
    import:
      - aws devops
      - vault devops
      - keycloak devops

aws:
  devops:
    script:
      - gimme-aws-creds -p devops

vault:
  devops:
    env:
      VAULT_ADDR: "https://vault.mydomain.com"
    script:
      - vault login -method oidc -path keycloak

keycloak:
  devops:
    env:
      KEYCLOAK_USER: username
      KEYCLOAK_PASSWORD: "my-password"
```
to have three sets of credentials setup for you when working on a project.

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
