#!/usr/bin/env bash

usr_dir=$HOME
lib_dir=$usr_dir/Library
cloud_sg_dir=$lib_dir/CloudStorage

syno_dir=$cloud_sg_dir/SynologyDrive-Sync
cloud_dirs=( $( ls -d $cloud_sg_dir/*/ ) )

for dir in ${cloud_dirs[@]}
do
	cut_dir=$( echo $dir | awk -F- '{print $1}' )

	ln -s $dir $usr_dir/
	ln -s $cut_dir $usr_dir/

done


