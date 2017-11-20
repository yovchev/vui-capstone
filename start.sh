#!/bin/bash

if [ ! -d "LibriSpeech" ]; then
	# Obtain the appropriate subsets of the LibriSpeech dataset
	wget http://www.openslr.org/resources/12/dev-clean.tar.gz
	tar -xzvf dev-clean.tar.gz
	wget http://www.openslr.org/resources/12/test-clean.tar.gz
	tar -xzvf test-clean.tar.gz
	rm -rf dev-clean.tar.gz
	rm -rf test-clean.tar.gz
	# Convert all flac files to wav format.
	cp flac_to_wav.sh LibriSpeech
	cd LibriSpeech
	./flac_to_wav.sh
	cd ..
	# Create JSON files corresponding to the train and validation datasets
	python create_desc_json.py LibriSpeech/dev-clean/ train_corpus.json
	python create_desc_json.py LibriSpeech/test-clean/ valid_corpus.json
fi

# Start Jupyter notebook
jupyter notebook --ip=* --no-browser --allow-root