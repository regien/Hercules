#!/bin/sh

make_gitignore()
{
	touch $2/.gitignore
	echo "# Prerequisites" >> $2/.gitignore
	echo "*.d" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Object files" >> $2/.gitignore
	echo "*.o" >> $2/.gitignore
	echo "*.ko" >> $2/.gitignore
	echo "*.obj" >> $2/.gitignore
	echo "*.elf" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Linker output" >> $2/.gitignore
	echo "*.ilk" >> $2/.gitignore
	echo "*.map" >> $2/.gitignore
	echo "*.exp" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Precompiled Headers" >> $2/.gitignore
	echo "*.gch" >> $2/.gitignore
	echo "*.pch" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Libraries" >> $2/.gitignore
	echo "*.lib" >> $2/.gitignore
	echo "*.a" >> $2/.gitignore
	echo "*.la" >> $2/.gitignore
	echo "*.lo" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Shared objects (inc. Windows DLLs)" >> $2/.gitignore
	echo "*.dll" >> $2/.gitignore
	echo "*.so" >> $2/.gitignore
	echo "*.so.*" >> $2/.gitignore
	echo "*.dylib" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Executables" >> $2/.gitignore
	echo "*.exe" >> $2/.gitignore
	echo "*.out" >> $2/.gitignore
	echo "*.app" >> $2/.gitignore
	echo "*.i*86" >> $2/.gitignore
	echo "*.x86_64" >> $2/.gitignore
	echo "*.hex" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Debug files" >> $2/.gitignore
	echo "*.dSYM/" >> $2/.gitignore
	echo "*.su" >> $2/.gitignore
	echo "*.idb" >> $2/.gitignore
	echo "*.pdb" >> $2/.gitignore
	echo "" >> $2/.gitignore
	echo "# Kernel Module Compile Results" >> $2/.gitignore
	echo "*.mod*" >> $2/.gitignore
	echo "*.cmd" >> $2/.gitignore
	echo ".tmp_versions/" >> $2/.gitignore
	echo "modules.order" >> $2/.gitignore
	echo "Module.symvers" >> $2/.gitignore
	echo "Mkfile.old" >> $2/.gitignore
	echo "dkms.conf" >> $2/.gitignore
}

make_header()
{
	touch includes/header.h
	echo "#ifndef HEADER_H" >> includes/header.h
	echo "# define HEADER_H" >> includes/header.h
	echo "# include <stdio.h>" >> includes/header.h
	echo "" >> includes/header.h
	echo "" >> includes/header.h
	echo "#endif" >> includes/header.h

}


make_libftmakefile()
{
	touch Makefile
	echo "MAKE = make -C" >> Makefile
	echo "NAME = test" >> Makefile
	echo "LIB = libft/" >> Makefile
	echo "CFLAGS = -Wall -Wextra -Werror" >> Makefile
	echo "CC = gcc" >> Makefile
	echo "INCLUDES = -I includes/" >> Makefile
	echo "" >> Makefile
	echo "#When compiling. you need to add your .a lib" >> Makefile
	echo "CFILES = \$(LIB)/libft.a \"" >> Makefile
	echo "         main.c " >> Makefile
	echo "" >> Makefile
	echo "#These options are here in case the lib needs to be recompiled." >> Makefile
	echo "#LIBM, LIBC, LIBF will run rules re, clean and fclean inside the libft folder" >> Makefile
	echo "LIBM = \$(MAKE) \$(LIB) re" >> Makefile
	echo "LIBC = \$(MAKE) \$(LIB) clean" >> Makefile
	echo "LIBF = \$(MAKE) \$(LIB) fclean" >> Makefile
	echo "OBJECTS = \$(CFILES:.c=.o)" >> Makefile
	echo "" >> Makefile
	echo "all: \$(NAME)" >> Makefile
	echo "" >> Makefile
	echo "\$(NAME):" >> Makefile
	echo "	@\$(LIBM)" >> Makefile
	echo "	@\$(CC) \$(CFLAGS) \$(INCLUDES) -o \$(NAME) \$(CFILES)" >> Makefile
	echo "" >> Makefile
	echo "clean:" >> Makefile
	echo "	@\$(LIBC)" >> Makefile
	echo "	@/bin/rm -f \$(OBJECTS)" >> Makefile
	echo "" >> Makefile
	echo "fclean:" >> Makefile
	echo "	@\$(LIBF)" >> Makefile
	echo "	@/bin/rm -f \$(OBJECTS) \$(NAME)" >> Makefile
	echo "" >> Makefile
	echo "re: fclean all" >> Makefile
	echo "" >> Makefile
	echo ".PHONY: all, clean, fclean, re" >> Makefile
}

make_Makefile()
{
	touch Makefile
	echo "NAME = test" >> Makefile
	echo "CFLAGS = -Wall -Wextra -Werror" >> Makefile
	echo "CC = gcc" >> Makefile
	echo "INCLUDES = -Iincludes/" >> Makefile
	echo "" >> Makefile
	echo "CFILES = main.c" >> Makefile
	echo "OBJECTS = \$(CFILES:.c=.o)" >> Makefile
	echo "" >> Makefile
	echo "all: \$(NAME)" >> Makefile
	echo "" >> Makefile
	echo "\$(NAME):" >> Makefile
	echo "	@\$(CC) \$(CFLAGS) \$(INCLUDES) -o \$(NAME) \$(CFILES)" >> Makefile
	echo "" >> Makefile
	echo "clean:" >> Makefile
	echo "	@/bin/rm -f \$(OBJECTS)" >> Makefile
	echo "" >> Makefile
	echo "fclean:" >> Makefile
	echo "	@/bin/rm -f \$(OBJECTS) \$(NAME)" >> Makefile
	echo "" >> Makefile
	echo "re: fclean all" >> Makefile
	echo "" >> Makefile
	echo ".PHONY: all, clean, fclean, re" >> Makefile
}

display_usage()
{
	echo ""
	echo "---------------------"
	echo "simple maker"
	echo "---------------------"
	echo "available languages: C"
	echo ""
	echo "usage : sh $0 C FOLDER FLAG"
	echo "FOLDER : you select the destination folder where you want"
	echo "FLAG : --libft or -li if you want to include a default libft"
	echo ""
}

make_main()
{
	touch main.c
	echo "#include \"header.h\"" >> main.c
	echo "" >> main.c
	echo "int		main(void)" >> main.c
	echo "{" >> main.c
	echo "	printf(\"BUM NOW YOU CAN START WORKING\");" >> main.c
	echo "}" >> main.c
}

make_author()
{
	echo $USER > author
}

if [ "$1" == "C" -a -d "$2" ] ; then
	echo "well done";
	cd $2
	mkdir includes
	make_header
	make_author
	make_main
	if [ "$3" == "--libft" -a "$3" == "-li" ]
	then
		mkdir libft
		git clone https://github.com/regien/new_test.git libft
		rm -rf libft/.git
		make_libftmakefile
	else
		make_Makefile
	fi	
	#	docker build --build-arg DEB_TESTCASE=$1  -t minivalgrind .
	#	docker run -it minivalgrind
	make re
	./test
elif [ -z "$1" ] ; then
	display_usage
elif [ "$1" == "-h" -o "$1" == "--help" ] ; then
	display_usage
else
	echo "invalid file, must be a directory file"
fi
