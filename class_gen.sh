#!/bin/bash

for	i in "$@"
do
	echo "#ifndef ${i^^}_HPP" > $i.hpp
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

for	i in "$@"
do
	echo "#include \"$@.hpp\"" > $i.cpp
	echo "$i::$i(void) {}" >> $i.cpp
	echo "$i::$i($i const &copy) {}" >> $i.cpp
	echo "$i &$i::operator=($i const &copy) {}" >> $i.cpp
	echo "$i::~$i(void) {}" >> $i.cpp
done
