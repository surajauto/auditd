#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with auditd](#setup)
    * [What auditd affects](#what-auditd-affects)
    * [Beginning with auditd](#beginning-with-auditd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
8. [Acknowledgements](#acknowledgements)

## Overview

This module will install a basic template for auditd rules.

## Module Description

This module edits the default /etc/audit/auditd.conf, adds a /etc/audit/rules.d/audit.rules file to the server and restarts auditd.

## Setup

If you wish to use your own ruleset, it must be passed to the `auditd` classes $auditd_rules parameter as an array of rules.
This ruleset will over-write the default rules, so must be the full ruleset you intend to implement. E.g.:

```puppet
class {'auditd':
  auditd_rules => [
    '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -k time-change',
    '-w /etc/passwd -p wa -k identity',
  ],
}
```

Config values for the `auditd.conf` file can be passed in as a hash to the $auditd_conf parameter, where the key is the setting name and the value is the value.
This will not completely over-write the default ruleset, only add new settings to the default list, or override values for existing settings.
The default list can be found in the in-module Hiera data.
E.g.

```puppet
class {'auditd':
  auditd_conf => {
    'log_file' => '/var/log/some-other-auditd.log',
  }
}
```

### What auditd affects

* /etc/audit/auditd.conf
* /etc/audit/rules.d/audit.rules
* RPM Package audit will be installed
* Service auditd will be turned on and started

### Beginning with auditd

Install module with `sudo puppet module install auditd` or use r10k.

## Usage

Use the following syntax to get this module working:

```puppet
include auditd
```

or

```puppet
class { 'auditd': }
```

## Reference

### Classes

#### Public Classes

* `auditd`: Installs and configures auditd on your server.

#### Private Classes

* [`auditd::config`](#auditdconfig): Configures the module.
* [`auditd::install`](#auditdinstall): Installs auditd package on your server.
* [`auditd::service`](#auditdservice): Configures auditd service.

## Limitations

This module has only been tested on RedHat,CentOS and it derivatives.
All other distributions are not supported.

## Development

This module is public and can be found on github[here](https://github.com/ubeek/auditd)

## Acknowledgements

This module is based upon the auditd module by Luther Barnum, which can be found at <https://github.com/lgbarn/auditd>.
