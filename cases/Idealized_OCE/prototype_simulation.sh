#!/bin/bash
# Run GOTM using with idealized forcing and initial conditions
#
# Brandon Reichl

#######################################################################
#                              Set paths                              #
#######################################################################

# setup paths and tools
source "../../set_tools.sh"

# directory of base case
basecase="${GOTMWORK_ROOT}/data/Idealized_OCE"

# current path
curdir=$(pwd)

#######################################################################
#                           Set parameters                            #
#######################################################################

# name of the dataset
title="CASENAME_HOURSRUNhours_model_TURBULENCEMETHOD"

# set levels, grid zooming at surface
nlev=128 # Maybe less levels?
depth=256
ddu=0
ddl=0

# set Coriolis
# set Heat Flux
# set Wind Stress
Latitude=LATITUDE   # f = 1e-4
taux=$(echo 'print $((WINDSTRESS * 1027))' | zsh)  # 5.6e-4 * 1027 (ref density)
tauy=0.00
heatflux=-$(echo 'print $((BUOYANCYFLUX / 2e-4 / 9.80655 * 1027 * 3985.0))' | zsh)

# run parameters
dt=20 #TIMESTEP
nsave=1 # save data every 1 timestep

# starting and ending date - in the format of YYYYMMDD
hours=HOURSRUN
time_step_number=$((hours * 3600 / dt))

# name of the turbulence model
turbmethod=TURBULENCEMETHOD

# output file name
outname="gotm_output_file"

# case name
casename="${title}"

export momentum_flux=${taux}

#######################################################################
#                        Preprocess input data                        #
#######################################################################

# create run directory
rundir="${GOTMRUN_ROOT}/Idealized_OCE/${casename}"
echo ${rundir}

mkdir -p ${rundir}
cd ${rundir}

# copy base case
cp ${basecase}/* ./

# write the stokes drift file
julia write_stokes_drift.jl

# set run parameters
start_time="${datestart:0:4}-${datestart:4:2}-${datestart:6:2} 00:00:00"
stop_time="${dateend:0:4}-${dateend:4:2}-${dateend:6:2} 00:00:00"
${cmd_nmlchange} -f gotmrun.nml -e MaxN -v "${time_step_number}"
${cmd_nmlchange} -f gotmrun.nml -e timefmt -v "1" 
${cmd_nmlchange} -f gotmrun.nml -e title -v ${title}
${cmd_nmlchange} -f gotmrun.nml -e out_fn -v ${outname}
${cmd_nmlchange} -f gotmrun.nml -e dt -v ${dt}
${cmd_nmlchange} -f gotmrun.nml -e nsave -v ${nsave}
${cmd_nmlchange} -f gotmrun.nml -e nlev -v ${nlev}
${cmd_nmlchange} -f gotmrun.nml -e depth -v ${depth}
${cmd_nmlchange} -f gotmrun.nml -e latitude -v ${Latitude}
${cmd_nmlchange} -f gotmmean.nml -e ddu -v ${ddu}
${cmd_nmlchange} -f gotmmean.nml -e ddl -v ${ddl}
${cmd_nmlchange} -f airsea.nml -e const_tx -v ${taux}
${cmd_nmlchange} -f airsea.nml -e const_ty -v ${tauy}
${cmd_nmlchange} -f airsea.nml -e const_heat -v ${heatflux}

# set turbulence method
source ${scpt_case_turbmethod}

stokes=.true.

${cmd_nmlchange} -f gotmmean.nml -e stokes_coriolis -v ${stokes}

lagrangian_mixing=.true.
${cmd_nmlchange} -f gotmmean.nml -e lagrangian_mixing -v ${lagrangian_mixing}

#######################################################################
#                              Run GOTM                               #
#######################################################################
${cmd_gotm} 2> log.${outname}

#######################################################################
#                           Postprocessing                            #
#######################################################################

# plot surface forcing and profiles
source ${curdir}/case_postproc.sh
