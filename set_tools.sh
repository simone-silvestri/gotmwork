# This script set up paths and tools used by case_run

# gotmwork environment file
gotmwork_env_file="${HOME}/.gotmwork_env.sh"
if [ -f ${gotmwork_env_file} ]; then
    source ${gotmwork_env_file}
else
    echo "GOTMWORK environment not set. Use setup_gotmwork.sh to set it up."
    exit 1
fi

# gotm executable
cmd_gotm="${GOTMEXE_ROOT}/bin/gotm"

# paths
tooldir="${GOTMWORK_ROOT}/tools"
nmldir="${GOTMWORK_ROOT}/namelist"
xmldir="${GOTMWORK_ROOT}/data"

# tools
cmd_nmlchange="${tooldir}/nmlchange"
cmd_case_preproc="${tooldir}/case_preproc"
cmd_nc2dat="${tooldir}/nc2dat"
cmd_nc2dat_argo="${tooldir}/nc2dat_argo"
cmd_nc2dat_cdip="${tooldir}/nc2dat_cdip_spec"
cmd_nc2dat_core2ww3="${tooldir}/nc2dat_core2ww3"
cmd_nc2dat_latlon="${tooldir}/nc2dat_latlon"
cmd_plotpfl="${tooldir}/plotpfl"
cmd_plotts="${tooldir}/plotts"
cmd_is_sea="${tooldir}/is_sea"
cmd_gotm_analysis="${tooldir}/gotm_analysis"

# bash script
scpt_case_postproc="${tooldir}/case_postproc.sh"
scpt_case_turbmethod="${tooldir}/case_turbmethod.sh"
