#!/bin/sh

# Modificado desde el script de instalación para gmt 4.5.14 por Nestor Luna

#--------------------------------------------------------------------------------
#	NETCDF SECTION
#--------------------------------------------------------------------------------
	
# 		Define variables needed in this script
	GMT_cc=gcc
	CC=$GMT_cc
	export CC
	topdir=`pwd`
	NETCDF_VERSION=3.6.3
	suffix="bz2"
	expand="bzip2 -dc"
	GMT_make=make
        passive_ftp=y
	GMT_delete=n

	if [ -f netcdf-${NETCDF_VERSION}.tar.Z ]; then
		zcat netcdf-${NETCDF_VERSION}.tar.Z | tar xvf -
	elif [ -f netcdf-${NETCDF_VERSION}.tar.bz2 ]; then
		$expand netcdf-${NETCDF_VERSION}.tar.$suffix | tar xvf -
	elif [ -f netcdf-${NETCDF_VERSION}.tar.gz ]; then
		gzip -dc netcdf-${NETCDF_VERSION}.tar.gz | tar xvf -
	else
		echo "?? netcdf-${NETCDF_VERSION}.tar.{Z,bz2,gz} not found - must abort !!"
		exit
	fi
	
	cd netcdf-${NETCDF_VERSION}

	if [ "$os" = "Interix" ]; then	# Windows SFU
		CC=${CC=gcc}
	fi
###	netcdf_path=${netcdf_path:-$topdir/netcdf-${NETCDF_VERSION}}
	netcdf_path=$topdir/netcdf-${NETCDF_VERSION}
	rm -f config.{cache,log,status}
	./configure --prefix=$netcdf_path --enable-c-only --enable-shared
	$GMT_make check   || exit
	$GMT_make install || exit
	$GMT_make clean   || exit
	cd $topdir
	if [ "$GMT_delete" = "y" ]; then
		rm -f netcdf*.tar.Z
	fi