#!/usr/bin/bash

# export FOLD=0
export TRAIN_DATA=input/train.csv
export TEST_DATA=input/test.csv


cp input/train_init.csv input/train.csv
cp input/test_init.csv input/test.csv

python src/preprocessing.py

export MODEL='rFOCslow'
FOLD=0 python -m src.train
export MODEL='rF13'
FOLD=1 python -m src.train
FOLD=3 python -m src.train
export MODEL='rF24'
FOLD=2 python -m src.train
FOLD=4 python -m src.train

python -m src.predict

rm input/train.csv input/test.csv
