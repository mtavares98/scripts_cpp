#!/bin/bash

for	i in "$@"
do
	echo "#ifndef ${i^^}" > $i.hpp
	echo "#define ${i^^}_HPP" >> $i.hpp
	echo "" >> $i.hpp
	echo "class $i" >> $i.hpp
	echo "{" >> $i.hpp
	echo "" >> $i.hpp
	echo "	public:" >> $i.hpp
	echo "		$i(void);" >> $i.hpp
	echo "		$i($i const &copy);" >> $i.hpp
	echo "		$i &operator=($i const &copy);" >> $i.hpp
	echo "		~$i(void);" >> $i.hpp
	echo "};" >> $i.hpp
	echo "#endif" >> $i.hpp
done

/bin/bash ~/scripts_cpp/makefile_gen.sh $@
