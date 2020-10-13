FROM granatumx/gbox-py-sdk:1.0.0

RUN pip install tensorflow
RUN pip install keras

COPY . .

RUN cd ./granatum_clustering && pip install -e .
RUN cd ./granatum_deeplearning && pip install -e .

RUN ./GBOXtranslateVERinYAMLS.sh
RUN tar zcvf /gbox.tgz package.yaml yamls/*.yaml
