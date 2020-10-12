# TF2_ObjectDetection
TensorFlow2 Object Detection

参考サイト
https://qiita.com/karaage0703/items/8567cc192e151bac3e50

アノテーションツールのインストール
https://github.com/Microsoft/VoTT/releases



## Protocol buffersのセットアップ後
git clone --depth 1 https://github.com/tensorflow/models
cd models/research
/usr/local/bin/protoc object_detection/protos/*.proto --python_out=.

## 必要なライブラリのセットアップ
models/researchディレクトリで実施
cp object_detection/packages/tf2/setup.py .
python -m pip install .

## セットアップの確認
models/researchディレクトリで実施
python object_detection/builders/model_builder_tf2_test.py

## Object detection tools
models/researchディレクトリで実施
git clone https://github.com/karaage0703/object_detection_tools

## ファイル名を連番になるように修正
cd object_detection_tools/data
./change_tfrecord_filename.sh

## Configファイルの修正
/models/research/object_detection_tools/config/efficientdet_d0_coco17_tpu-32.config
num_classesをラベル数に変更

## 学習
/models/researchディレクトリまで移動
python object_detection/model_main_tf2.py --pipeline_config_path="./object_detection_tools/config/efficientdet_d0_coco17_tpu-32.config" --model_dir="./saved_model_01" --num_train_steps=10000 --alsologtostderr