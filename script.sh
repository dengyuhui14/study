ClamPath=/home/bigdataflow/dyh/clam/build/run/bin/clam.py
ConfigPath=/home/bigdataflow/dyh/yaml-configurations/clam.svcomp19.yaml # use modified version
BenchDirectory=/home/bigdataflow/dyh/POPLBenchmarks
PATH=$PATH:/home/bigdataflow/dyh/clam/build/run/bin
POLYPATH=/home/bigdataflow/dyh/Results

rm -r ${POLYPATH}/*
cd ${BenchDirectory}
for filename in *.c;
do
    echo " Running polyhedra analysis on " ${filename}
    # python ${ClamPath} -y ${ConfigPath} ${filename} --crab-dom=pk > ${POLYPATH}/${filename}
    python ${ClamPath} ${filename} --crab-dom=pk --crab-narrowing-iterations=2 --crab-widening-delay=3 > ${POLYPATH}/${filename}
    echo " Finish polyhedra analysis on " ${filename}
done


