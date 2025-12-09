# Metagenome v1 Usage Guide

## 1. Database Mounting
You **MUST** mount your host database directory to `/ref_db` inside the container.

**Flag:** `--bind /your/local/db:/ref_db`

**Recommended Structure:**
```text
/ref_db/
├── gtdb/              # GTDB-Tk data
├── checkm/            # CheckM v1 data
├── microbeannotator/  # MicrobeAnnotator data
└── metawrap/          # MetaWRAP data (BMTAGGER_DB, NCBI_nt, NCBI_tax)
```
## 2. Example Commands
MetaWRAP (Assembly Module)
Note: Ensure output directories are writable (usually the current directory).
```bash
apptainer exec --bind /your/local/db:/ref_db metagenome_v1.sif \
    metawrap assembly \
    -1 reads_1.fastq \
    -2 reads_2.fastq \
    -m 100 -t 16 --metaspades \
    -o ./assembly_out
```
```bash
apptainer exec --bind /your/local/db:/ref_db metagenome_v1.sif \
    metawrap binning \
    -o ./binning_out \
    -t 16 \
    -a assembly.fa \
    --metabat2 --maxbin2 --concoct \
    clean_reads_1.fastq clean_reads_2.fastq
```

GTDB-Tk
```bash
apptainer exec --bind /your/local/db:/ref_db metagenome_v1.sif \
    gtdbtk classify_wf \
    --genome_dir ./bins \
    --out_dir ./gtdbtk_out \
    --extension fa \
    --cpus 16
```

dRep
```bash
apptainer exec --bind /your/local/db:/ref_db metagenome_v1.sif \
    dRep dereplicate ./drep_out \
    -g ./bins/*.fa \
    -p 16
```

MicrobeAnnotator
```bash
apptainer exec --bind /your/local/db:/ref_db metagenome_v1.sif \
    microbeannotator \
    -i genome.fa \
    -o ./annotation_out \
    -m diamond \
    --threads 16
```

