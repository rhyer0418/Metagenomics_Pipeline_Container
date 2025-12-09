---

### test_commands.sh

```bash
#!/bin/bash
set -e
echo "Testing container commands..."

apptainer exec metagenome_v6.1.sif metawrap --help
apptainer exec metagenome_v6.1.sif gtdbtk --help
apptainer exec metagenome_v6.1.sif checkm --help
apptainer exec metagenome_v6.1.sif dRep --help
apptainer exec metagenome_v6.1.sif microbeannotator --help
apptainer exec metagenome_v6.1.sif metabat2 --help
apptainer exec metagenome_v6.1.sif run_MaxBin.pl --help
apptainer exec metagenome_v6.1.sif concoct --help
apptainer exec metagenome_v6.1.sif salmon --help
apptainer exec metagenome_v6.1.sif bwa
apptainer exec metagenome_v6.1.sif samtools