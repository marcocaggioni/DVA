FROM andrewosh/binder-base:latest

RUN mkdir /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks
USER root
COPY . /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
USER main

RUN conda install -c conda-forge -c scitools -c scitools/label/dev cube_browser ipywidgets

RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;


ADD requirements.txt requirements.txt
ADD handle-requirements.py handle-requirements.py
RUN python handle-requirements.py

USER main
WORKDIR $HOME/notebooks
