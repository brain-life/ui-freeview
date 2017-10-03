#!/bin/bash

source $FREESURFER_HOME/SetUpFreeSurfer.sh

#for single output (like from process view)
if [ -d /input/output/mri ];
then
    #for single freesurfer output
    /usr/local/freesurfer/bin/freeview -v \
    /input/output/mri/T1.mgz \
    /input/output/mri/wm.mgz \
    /input/output/mri/brainmask.mgz \
    /input/output/mri/aseg.mgz:colormap=lut:opacity=0.2 \
    -f /input/output/surf/lh.white:edgecolor=blue \
    /input/output/surf/lh.pial:edgecolor=red \
    /input/output/surf/rh.white:edgecolor=blue \
    /input/output/surf/rh.pial:edgecolor=red
else

    #for multiple datasets downloaded
    if [ -d /input/download ];
    then
        /usr/local/freesurfer/bin/freeview `find /input -name T1.mgz`
    else
        #for non freesurfer output, just find any nifti
        /usr/local/freesurfer/bin/freeview `find /input -name *.nii.gz`
    fi
fi
