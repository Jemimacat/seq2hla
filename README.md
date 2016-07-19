# seq2hla
Seq2HLA for .bam input.

## Installed:
* Ubuntu:16.04
* Python 2.7.12 (pip, curl, numpy, bippython installed)
* R 3.2.1
* Java openjdk 1.8.0_91
* bowtie 1.1.2
* bam2fastq
> download/bam2fastq
* repair.sh
> /download/bbmap/repair.sh
* seq2HLA
> /download/seq2HLA.py

## Usage:

#### step 1 bam2fastq:
> /download/bam2fastq -o /workspace/${sampleID}#.fq -q /workspace/${inputBAM}.bam
> gzip /workspace/${sampleID}_1.fq
> gzip /workspace/${sampleID}_2.fq

#### step 2 repair .fq.gz files:
> /download/bbmap/repair.sh in1=/workspace/${sampleID}_1.fq.gz in2=/workspace/${sampleID}_2.fq.gz \  out1=/workspace/${sampleID}_1.repair.fq.gz out2=/workspace/${sampleID}_2.repair.fq.gz
> rm /workspace/${sampleID}_1.fq.gz /workspace/${sampleID}_2.fq.gz

#### step 3 run seq2HLA.py:
> python /download/seq2HLA.py -1 /workspace/${sampleID}_1.repair.fq.gz -2 /workspace/${sampleID}_2.repair.fq.gz \
-r "/workspace/${smapleID}"

#### step 4 remove files:
> rm /workspace/.fq /workspace/.sam /workspace/*.aligned
