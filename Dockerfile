FROM andrewosh/binder-base:latest

RUN mkdir /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks
USER root
COPY . /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
RUN conda install -c conda-forge ipywidgets
RUN $HOME/anaconda2/envs/python3/bin/conda install -c conda-forge ipywidgets

USER main
RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;


ADD requirements.txt requirements.txt
ADD handle-requirements.py handle-requirements.py
RUN python handle-requirements.py

USER main
WORKDIR $HOME/notebooks
