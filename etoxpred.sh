if [ ! -d "eToxPred" ]; then
    #echo "Cloning eToxPred repository..."
    git clone https://github.com/lurenhaothu/eToxPred
    cd eToxPred

    conda create -n etoxpred python=3.7 -y
    conda activate etoxpred
    pip install -r requirements.txt

    tar -xzf etoxpred_best_model.tar.gz
else
    #echo "eToxPred directory already exists. Skipping clone."
    conda activate etoxpred
    cd eToxPred
fi

echo "predict: $1"

python predict.py \
    --smiles "$1" \
    --modelfile etoxpred_best_model.joblib \
