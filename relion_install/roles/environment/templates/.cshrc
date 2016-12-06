#!/bin/csh -f

# Setup openMPI if not already done so
if ("" == "`echo $path | grep /public/EM/OpenMPI/openmpi/bin`") then
        set path=(/public/EM/OpenMPI/openmpi/bin $path)
endif
if ("1" == "$?LD_LIBRARY_PATH") then
        if ("$LD_LIBRARY_PATH" !~ */public/EM/OpenMPI/openmpi/lib*) then
                setenv LD_LIBRARY_PATH /public/EM/OpenMPI/openmpi/lib:$LD_LIBRARY_PATH
        endif
else
        setenv LD_LIBRARY_PATH /public/EM/OpenMPI/openmpi/lib
endif

# Setup RELION-2.0 if not already done so
if ("" == "`echo $path | grep /public/EM/RELION/relion-2.0/bin`") then
	set path=(/public/EM/RELION/relion-2.0/bin $path)
endif 
if ("1" == "$?LD_LIBRARY_PATH") then
        if ("$LD_LIBRARY_PATH" !~ */public/EM/RELION/relion-2.0/lib*) then
                setenv LD_LIBRARY_PATH /public/EM/RELION/relion-2.0/lib:$LD_LIBRARY_PATH
        endif
else
        setenv LD_LIBRARY_PATH /public/EM/RELION/relion-2.0/lib
endif

# CUDA for RELION
setenv PATH /public/EM/CUDA/Cuda7.0/bin:$PATH
setenv LD_LIBRARY_PATH /public/EM/CUDA/Cuda7.0/lib64:$LD_LIBRARY_PATH
setenv CUDA_HOME /public/EM/CUDA/Cuda7.0

# Where is qsub template script stored
setenv RELION_QSUB_TEMPLATE /public/EM/RELION/relion-prerelease/bin/qsub.csh

# Default PDF viewer
setenv RELION_PDFVIEWER_EXECUTABLE evince

# Default MOTIONCORR executable
setenv RELION_MOTIONCORR_EXECUTABLE /public/EM/MOTIONCORR/bin/motioncorr

# Default UNBLUR/SUMMOVIE executables
setenv RELION_UNBLUR_EXECUTABLE /public/EM/UNBLUR/unblur.exe
setenv RELION_SUMMOVIE_EXECUTABLE /public/EM/SUMMOVIE/summovie.exe

# Default CTFFIND executable, version 4.0.x
setenv RELION_CTFFIND_EXECUTABLE '"/public/EM/ctffind/ctffind.exe --omp-num-threads 1 --old-school-input"'
# For CTFFIND3 this would be
#setenv RELION_CTFFIND_EXECUTABLE /public/EM/CTFFIND_130307/ctffind3.exe
# For the new CTFFIND 4.1+ this would be
#setenv RELION_CTFFIND_EXECUTABLE /lmb/home/scheres/app/Alexis_16-03-18_5138_ctffind_160404_1358.exe

# Default Gctf executable
setenv RELION_GCTF_EXECUTABLE /public/EM/Gctf/bin/Gctf

# Default ResMap executable
setenv RELION_RESMAP_EXECUTABLE /public/EM/ResMap/ResMap-1.1.4-linux64

# Enforce cluster jobs to occupy entire nodes with 24 hyperthreads
setenv RELION_MINIMUM_DEDICATED 24
# Do not allow the user to change the enforcement of entire nodes
setenv RELION_ALLOW_CHANGE_MINIMUM_DEDICATED 0

# Ask for confirmation if users try to submit local jobs with more than 12 MPI nodes
setenv RELION_WARNING_LOCAL_MPI 12