# Use the base image ubuntu 22.04.
# https://hub.docker.com/_/ubuntu/?tab=tags&name=22.04
ARG ROOT_CONTAINER=ubuntu:22.04

FROM $ROOT_CONTAINER

# Enable bash display Chinese.
ENV LANG=C.UTF-8

# Add needed optimized files.
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/jupyter_notebook_config.py /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/jupyter_lab_config.py /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/custom.css /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/notebook/config/init.sh /root/tmp_config/
ADD https://github.com/brokyz/notebook_hub/raw/notebook/config/simhei/SimHei.ttf /root/tmp_config/


RUN apt update --yes && apt upgrade --yes && \
    apt install --yes --no-install-recommends python3 pip git && \
    pip install jupyter notebook && \
    jupyter notebook --generate-config && \
    && mkdir /root/notebook && mkdir /root/.jupyter/custom \
    && rm -rf /root/.jupyter/jupyter_notebook_config.py && rm -rf /root/.jupyter/jupyter_lab_config.py \
    && mv /root/config/jupyter_lab_config.py /root/.jupyter/ && mv /root/config/jupyter_notebook_config.py /root/.jupyter/ \
    && mv /root/config/custom.css /root/.jupyter/custom/ \
    && mv /root/config/init.sh /root/ \
    && chmod +x /root/init.sh \
    && mkdir /usr/share/fonts/simhei && mv /root/config/SimHei.ttf /usr/share/fonts/simhei/ \
    && rm -rf /root/config    

WORKDIR /root/notebook

CMD ["sh","/root/init.sh"]