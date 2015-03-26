#!/bin/sh
# $FreeBSD: head/tools/regression/pjdfstest/tests/open/24.t 211352 2010-08-15 21:24:17Z pjd $

desc="open returns EOPNOTSUPP when trying to open UNIX domain socket"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..5"

n0=`namegen`

case "${os}" in
	FreeBSD)
		result=EOPNOTSUPP
		;;
	SunOS)
		result=EOPNOTSUPP
		;;
	Linux)
		result=ENXIO
		;;
esac

expect 0 bind ${n0}
expect "${result}" open ${n0} O_RDONLY
expect "${result}" open ${n0} O_WRONLY
expect "${result}" open ${n0} O_RDWR
expect 0 unlink ${n0}
