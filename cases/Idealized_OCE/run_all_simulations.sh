# Running all the LES configurations

timestep=300

declare -a turbmethod=("KPPLT-EFACTOR" "KPPLT-ENTR" "KPPLT-RWHGK" "EPBL" "EPBL-LT" "KPP-CVMix" "SMCLT" "SMC")
declare -a latitude=("43.289"  "43.289"   "43.289"  "43.289"  "43.289" "0")
declare -a casename=("free_convection" "weak_wind_strong_cooling" "med_wind_med_cooling" "strong_wind_weak_cooling" "strong_wind" "strong_wind_no_rotation")

hours=6
declare -a wind6=("0"      "5.0e-4" "8.0e-4" "1.2e-3" "1.4e-3" "1.1e-3")
declare -a flux6=("9.6e-7" "8.0e-7" "6.4e-7" "4.0e-7" "0"      "0")

hours=12
declare -a wind12=("0"      "4.0e-4" "6.0e-4" "8.0e-4" "9.0e-4" "6.0e-4")
declare -a flux12=("4.8e-7" "4.0e-7" "3.2e-7" "2.0e-7" "0"    "0")

hours=18
declare -a wind18=("0"      "3.5e-4" "5.0e-4" "7.0e-4" "8.0e-4" "4.2e-4")
declare -a flux18=("3.6e-7" "3.0e-7" "2.4e-7" "1.5e-7" "0"      "0")

hours=24
declare -a wind24=("0"      "3.0e-4" "4.5e-4"  "5.9e-4" "6.8e-4" "3.0e-4")
declare -a flux24=("2.4e-7" "2.0e-7" "1.6e-7"  "1.0e-7" "0"      "0")

hours=48
declare -a wind48=("0"      "2.0e-4" "3.4e-4" "3.8e-4" "4.5e-4" "1.6e-4")
declare -a flux48=("1.2e-7" "1.0e-7" "8.0e-8" "5.0e-8" "0"      "0")

hours=72
declare -a wind72=("0"      "1.8e-4" "2.9e-4" "3.4e-4" "4.1e-4" "1.1e-4")
declare -a flux72=("8.7e-8" "7.5e-8" "6.0e-8" "3.8e-8" "0"      "0")

for i in "${!wind6[@]}"; do
for j in ${!turbmethod[@]}; do

free_convection=$i

echo $free_convection

if test ${free_convection} == 0 || test ${free_convection} == 1 || test ${free_convection} == 2 || test ${free_convection} == 3 ; then
	echo "not doing free convection"
else
	
turb=${turbmethod[j]}
lat=${latitude[i]}
case=${casename[i]}

wind=${wind6[i]}
flux=${flux6[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/6/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh

wind=${wind6[i]}
flux=${flux6[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/6/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh

wind=${wind12[i]}
flux=${flux12[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/12/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh


wind=${wind18[i]}
flux=${flux18[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/18/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh

wind=${wind24[i]}
flux=${flux24[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/24/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh

wind=${wind48[i]}
flux=${flux48[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/48/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh

wind=${wind72[i]}
flux=${flux72[i]}

cp prototype_simulation.sh simulation${wind}${flux}.sh
sed -i "s/TIMESTEP/$timestep/g" simulation${wind}${flux}.sh
sed -i "s/CASENAME/$case/g" simulation${wind}${flux}.sh
sed -i "s/LATITUDE/$lat/g" simulation${wind}${flux}.sh
sed -i "s/HOURSRUN/72/g" simulation${wind}${flux}.sh
sed -i "s/WINDSTRESS/$wind/g" simulation${wind}${flux}.sh
sed -i "s/BUOYANCYFLUX/$flux/g" simulation${wind}${flux}.sh
sed -i "s/TURBULENCEMETHOD/$turb/g" simulation${wind}${flux}.sh

./simulation${wind}${flux}.sh

rm simulation${wind}${flux}.sh
fi

done
done
