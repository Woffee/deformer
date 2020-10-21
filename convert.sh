deformer_dir=data/datasets/deformer
mkdir -p ${deformer_dir}

squad v1.1
for version in 1.1; do
    data_dir=data/datasets/squad_v${version}
    for split in dev train; do
        python tools/convert_squad.py ${data_dir}/${split}-v${version}.json \
        ${deformer_dir}/squad_v${version}-${split}.jsonl
    done
done


cd ${deformer_dir}

cat squad_v1.1-train.jsonl | shuf > squad_v1.1-train-shuf.jsonl
head -n8760 squad_v1.1-train-shuf.jsonl > squad_v1.1-tune.jsonl
tail -n78839 squad_v1.1-train-shuf.jsonl > squad_v1.1-train.jsonl