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

Step 3:
	Make debian-folder with rules and definitions of the deb-package.
	
	control :
		Defines the deb package files. It has many control fields
		to tweak the package params.
		https://www.debian.org/doc/debian-policy/ch-controlfields.html
		
		It defines both the source package name, dependencies, version,
		description etc.

	changelog :
		Defines the changelog, what version are releasable and to
		what stage they are releasable.
		
		Note that debian has release targets such as stable or unstable
		and Ubuntu use Ubuntu version names such as focal.
		
		Create with: debchange --create or dch --create
	
	rules :
		A makefile describing the rules to build the package.
		When using debhelpers many of it's subprograms will make
		eductated guesses of what to do based on the normal makefile
		(or other build system debhelpers recognize).
		
		The different stages can be overriden and/or modified in the
		rules file.
		
		Examples:
		Stages		Debhelper
		------		---------
		build		dh_auto_build
		install	dh_auto_install
		
		The rules file in this example contain an override to bypass the
		build stage since the corresponding debhelper threw an error.
		
	An unsigned source and binary package can now be built with:
		debuild -us -uc -i -I
	where the -i flag ignores version control files from any diff and -I
	from putting them in the source tar.
	
	Note: Many errors and warnings will be thrown due to missing files such
	as copyright file, wrongly named base folder etc. Fixing all those
	details will be done at a later stage.
	
	The generated files can now be either signed and uploaded to Launchpad
	or installed with dpkg -i.
