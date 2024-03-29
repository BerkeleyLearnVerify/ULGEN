#!/usr/bin/env bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
set -e

pushd ..

echo -e "${ORANGE} ---- Building the PCompiler ----${NOCOLOR}"
# Run the build!

dotnet build -c Release

pushd Src/PRuntimes/RvmRuntime
mvn install
popd

mkdir -p Bld/Drops/RVM
cp Src/PRuntimes/RvmRuntime/target/*.jar Bld/Drops/RVM

echo -e "${GREEN} ----------------------------------${NOCOLOR}"
echo -e "${GREEN} P Compiler located in ${PWD}/Bld/Drops/Release/Binaries/netcoreapp3.1/P.dll${NOCOLOR}"
echo -e "${GREEN} ----------------------------------${NOCOLOR}"


echo -e "${GREEN} Shortcuts:: (add the following lines (aliases) to your bash_profile) ${NOCOLOR}"
echo -e "${GREEN} ----------------------------------${NOCOLOR}"
echo -e "${ORANGE} alias pc='dotnet ${PWD}/Bld/Drops/Release/Binaries/netcoreapp3.1/P.dll'${NOCOLOR}"
echo -e "${ORANGE} alias pmc='dotnet ${PWD}/packages/microsoft.coyote/1.0.5/lib/netcoreapp3.1/coyote.dll test'${NOCOLOR}"
echo -e "${GREEN} ----------------------------------${NOCOLOR}"
popd

