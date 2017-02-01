#!/usr/bin/python
import sys, os, errno

cuda8_path  = "/shared/cuda/cuda-8.0"
cuda75_path = "/shared/cuda/cuda-7.5"
cuda_dest = "/usr/local/cuda"

def print_usage():
	print "usage: ", sys.argv[0], "[switch <8.0 | 7.5>]"
	sys.exit(0)

if len(sys.argv) == 3 and sys.argv[1] == "switch":
	ver = sys.argv[2]
	try:
		if ver == "8" or ver == "8.0":
			os.unlink(cuda_dest)
			os.symlink(cuda8_path, cuda_dest)
			print "Switched CUDA version to 8.0"
		elif ver == "7.5" or ver == "75":
			os.unlink(cuda_dest)
			os.symlink(cuda8_path, cuda_dest)
			print "Switched CUDA version to 7.5"
		else:
			print_usage()
	except OSError as e:
		if e[0] == errno.EPERM:
			print "This command needs to be run as root"
	sys.exit(0)
else:
	print_usage()
