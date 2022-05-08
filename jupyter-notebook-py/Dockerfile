# Use the base image ubuntu 22.04.
# https://hub.docker.com/_/ubuntu/?tab=tags&name=22.04
ARG ROOT_CONTAINER=ubuntu:22.04
ARG NB_USER="notebook"
ARG NB_UID="1000"
ARG NB_GID="100"

FROM $ROOT_CONTAINER

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

RUN apt update --yes && apt upgrade --yes && \
    apt install --yes --no-install-recommends \
    python3 \
    pip \
    git \
    sudo

ENV SHELL=/bin/bash \
    NB_USER="${NB_USER}" \
    NB_UID=${NB_UID} \
    NB_GID=${NB_GID} \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8
ENV HOME="/home/${NB_USER}"

RUN useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}" && \
    sed -i "/%sudo   ALL=(ALL:ALL) ALL/a\${NB_USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers

USER ${NB_UID}

WORKDIR /home/${NB_USER}

ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/init.sh /home/${NB_USER}/

RUN pip install \
    jupyter notebook \
    jupyter_contrib_nbextensions \
    jupyter_nbextensions_configurator && \
    jupyter contrib nbextension install && \
    jupyter notebook --generate-config && \
    mkdir /home/${NB_USER}/projects && mkdir /home/${NB_USER}/.jupyter/custom && \
    rm -rf /home/${NB_USER}/.jupyter/jupyter_notebook_config.py && \
    sudo chmod +x /home/${NB_USER}/init.sh

ADD https://github.com/brokyz/notebook_hub/raw/notebook/config/simhei/SimHei.ttf /usr/share/fonts/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/jupyter_notebook_config.py /home/${NB_USER}/.jupyter/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/custom.css /home/${NB_USER}/.jupyter/custom/


WORKDIR /home/${NB_USER}/projects

CMD ["sh","/home/${NB_USER}/init.sh"]