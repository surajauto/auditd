### Changelog

## [Unreleased]

* Changes from executing pdk update
* Added entries to .gitignore
* Updated metadata.json to remove support for Oracle Linux, Redhat 5,6 and CentOS 5,6
* Updated metadata.json to add support for Redhat 8
* Updated metadata.json to change puppetlabs-stdlib version_requirement from: >= 3.2.0 < 7.0.0 to: ">= 9.0.0 <= 9.6.0"
* Updated metadata.json to change puppet version_requirement from: >= 6.21.0 < 8.0.0 to: >= 7.24 < 9.0.0
* Updated test and manifest files to correct conventions, errors and warnings reported by pdk validate
* Updated data/common.yaml to remove deprecated values preventing auditd starting with test values on RHEL 8
* Updated data/common.yaml to include single quotes for enable_krb5 = no as puppet treats that no as a boolean and auditd fails to start with these test values on RHEL 8

#### 1.0.3

* Fixed Exec['augenrules'] to be a string command

#### 1.0.2

* Changed functionality to use augenrules binary and place configs in /etc/audit/rules.d/ instead of /etc/audit/audit.rules

#### 1.0.1

* Changed name of some parameters to be consistent with others.
* Added further class documentation

#### 1.0.0

* Initial release
