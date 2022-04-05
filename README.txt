################################################################################
#                                                                              #
#   Deb-package demo                                                           #
#                                                                              #
################################################################################

Simple deb-package demo.

Contain one bash-script (doesn't need to be built like a C-file.).

Step 1:
	Representation of initial project.

Step 2:
	Make the program installable with a simple makefile.
	
	Some programs will need to have rules for building the program before it
	can be installed.
	
	Other more advanced build systems might or cmake to generate makefiles
	can be used too.
	
	Make has some conventions that are used by debhelpers to build the
	package: 
		https://www.gnu.org/software/make/manual/html_node/Makefile-Conventions.html#Makefile-Conventions
	
