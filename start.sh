#!/bin/bash

#for file in `find /input -name *.nii.gz`
#do
#    /usr/local/freesurfer/bin/freeview $file &
#done

if [ -d /input/ouput/output/mri ];
then
    #for freesurfer output
    /usr/local/freesurfer/bin/freeview -v \
        /input/output/output/mri/T1.mgz \
        /input/output/output/mri/wm.mgz \
        /input/output/output/mri/brainmask.mgz \
        /input/output/output/mri/aseg.mgz:colormap=lut:opacity=0.2 \
        -f /input/output/output/surf/lh.white:edgecolor=blue \
        /input/output/output/surf/lh.pial:edgecolor=red \
        /input/output/output/surf/rh.white:edgecolor=blue \
        /input/output/output/surf/rh.pial:edgecolor=red
else
    #for non freesurfer output, just find any .nii.gz
    /usr/local/freesurfer/bin/freeview `find /input -name *.nii.gz`
fi