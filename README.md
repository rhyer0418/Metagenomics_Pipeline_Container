# Metagenomics_Pipeline_Container
**Version:** v1  
**Description:** A comprehensive container for metagenomics binning, refinement, taxonomy, and annotation.

## Key Features
- **All-in-One Pipeline:** Integrates MetaWRAP, dRep, GTDB-Tk, CheckM v1, SPAdes, and MicrobeAnnotator.
- **Environment Isolation:** Solved dependency conflicts using isolated Conda environments for each tool (e.g., Python 2.7 for MetaWRAP, Python 3.x for others).
- **Smart Wrappers:** No need to run `conda activate`. All tools (e.g., `metawrap`, `checkm`, `gtdbtk`) are directly executable from `/usr/local/bin`.
- **Patched & Optimized:** Includes fixes for MetaWRAP BLAS/MKL conflicts and supports SPAdes v4.2.0 alongside legacy versions.

## Database Setup 
The container requires external databases mounted to **`/ref_db`**.
Please organize your host directory strictly as follows:

```text
/your/host/db/path/
├── gtdb/               # GTDB-Tk data (release 207/214)
├── checkm/             # CheckM v1 data
├── microbeannotator/   # MicrobeAnnotator data
└── metawrap/           # MetaWRAP databases (MUST include these subfolders):
      ├── BMTAGGER_DB   # Host contamination removal files
      ├── NCBI_nt       # NCBI Nucleotide database
      └── NCBI_tax      # NCBI Taxonomy database

# Quick Start
## 1. Apptainer / Singularity

## General syntax
```text
apptainer exec --bind /your/host/db/path:/ref_db metagenome_v1.sif <tool> [args]

## Example: Run MetaWRAP Binning
```text
apptainer exec --bind /data/db:/ref_db metagenome_v1.sif \
    metawrap binning -o out_dir -t 24 -a assembly.fa clean_reads_1.fq clean_reads_2.fq


## 2. Docker
## Note: Mount current directory to /work to save outputs
```text
docker run --rm -v /your/host/db/path:/ref_db -v "$PWD":/work -w /work \
    metagenome:v1 metawrap binning ...


# Included Tools & Versions
| **Tool**         | **Version** | **Env Python** |
| ---------------- | ----------- | -------------- |
| MetaWRAP         | v1.3.2      | 2.7            |
| dRep             | v3.6.2      | 3.10           |
| GTDB-Tk          | v2.2.0      | 3.8            |
| CheckM           | v1.1.3      | 3.7            |
| SPAdes           | v4.2.0      | 3.10           |
| MicrobeAnnotator | v2.0.5      | 3.8            |

