base_dir=/Users/woffee/www/emse-apiqa/baselines/deformer/data
data_dir=${base_dir} use_tpu=no \
# python train.py -m bert -t squad_v1.1 2>&1 | tee data/squad_v1.1-bert-train.log
python eval.py -m bert -t squad_v1.1 2>&1 | tee data/squad_v1.1-bert-eval.log