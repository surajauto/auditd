### Changelog
#### 1.0.0
- Deleted Gemfile.lock because it is not needed
- Added several directories that need to be ignored and should not be tracked
- Modified Gemfile and spec requirements to rewrite spec tests
- Modified spec tests and module to new format for puppet 4 specifications
- Added Gemfile.lock file
- Added support for Puppet versions 3.8, 4.0, 4.1 and 4.2 for travis-ci testing
- Removed FUTURE_PARSER from .travis file because future is now
- Removed extra class check
- Added space for proper markdown formatting
- Added module install specifics
- Removed testing code for server temporarily
- Added vagrant-wrapper dependency
- Cleaned up code to conform to best practice
- Modified .travis.yml so CI is only automated to master and production branches


#### 0.8.0
- converted anchors to contain statements
- re-added spec testing


#### 0.7.3
- corrected url


#### 0.7.2
- Added travis testing url

#### 0.7.1
-  corrected links in metadata

#### 0.7.0
- added Linux Support metadata
- changed module name in README.md
- Added code for Code Climate checks in Travis
- Removed spec/classes and included spec check by default
- cleaned up errors
- corrected scope and lint errors
- added metadata-json-lint for travis site
- copied Rakefile
- renamed travis file
- adding travis.yml file for testing


#### 0.6.0
- changed description and license
- properly formatted and encapsulated describe statements
- added the proper serverspec tests
- added .vagrant directory to .gitignore
- changed class definition and changed apply_manifest options
- corrected errors that prevented module install to correct paths
- added .gitignore file
- removed stdlib since it was only needed for rspec testing
- added acceptance testing
- Cleaned up syntax and added chaining
- added spec files for testing module
- added rspec_helper.rb to puppet skeleton
- added rspec puppet skeleton
- exclude direct root since this is not allowed
- add auditing of users executing root commands
- add userdel to list of programs to monitor
- changed audit.rules name
- changed audit.rules location
- corrected audit.rules source file
- corrected package name
- corrected syntax error
- added default rules
- added default chaining
- changed module class name to a more standard convention
- removed commas from end of lines
- Corrected spelling


#### 0.5.0
- modified init.pp to use params.pp
- added params.pp file
- added config.pp file
- Converted lines to parameters fro params.pp
- added service.pp
- added install.pp
- changed resource to file


#### 0.4.0
- added project file
- modified source metadata
- modified version_requirement keyword
- corrected module name to match class in init.pp
- added author
- commented include line
- Added TODO list
