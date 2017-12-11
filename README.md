### Build docker image
>```docker build -t="anphunl/openface_demo" .```

### Start docker container
>```docker run -t -i -p 6006:6006 -p 5000:5000 -v ~/OpenfaceDemoData:/OpenfaceDemo/data anphunl/openface_demo```

### Prepare data
1. Download data at https://drive.google.com/file/d/146RG_go_yT0sr3Opn3DuD-DcPIgkIsY2/view?usp=sharing
2. Extract data to shared folder at ```~/OpenfaceDemoData/raw``` on host machine.
3. Align face, run within container
>>>```for N in {1..4}; do /root/openface/util/align-dlib.py data/raw align outerEyesAndNose data/aligned --size 96 & done```
3. Visualize data with Tensorboard:
>>>```python visualize```

>>>```tensorboard --logdir=data/visuallize```

### Create server classify other images:
1. Create features:
>>>```/root/openface/batch-represent/main.lua -outDir data/model -data data/aligned/```

2. Create classify model file:
>>>```/root/openface/demos/classifier.py train data/model/```

3. Run server:
>>>```export FLASK_APP=server.py```

>>>```flask run --host=0.0.0.0```

4. Open browser with URL: http://localhost:5000 and check it.