
FROM andrewosh/binder-base

# for use with mybinder.org

MAINTAINER Hanno Rein <hanno@hanno-rein.de>

USER root
COPY . $HOME/

RUN pip install pims trackpy
RUN $HOME/anaconda2/envs/python3/bin/pip install pims trackpy
RUN conda install -c conda-forge ipywidgets
RUN $HOME/anaconda2/envs/python3/bin/conda install -c conda-forge ipywidgets
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN $HOME/anaconda2/envs/python3/bin/conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c conda-forge jupyter_dashboards
RUN $HOME/anaconda2/envs/python3/bin/conda install -c conda-forge jupyter_dashboards
