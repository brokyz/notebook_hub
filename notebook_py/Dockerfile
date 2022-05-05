# 使用ubuntu作为基础镜像
FROM ubuntu

# 设置中文显示支持
ENV LANG=C.UTF-8
# 设置时区
ENV TZ=Asia/Shanghai
ENV hostname=jupyter


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install python3 pip -y \
    && pip install jupyterlab jupyter_contrib_nbextensions jupyter_nbextensions_configurator\
    && jupyter contrib nbextension install \
    && rm -rf /usr/bin/sh && ln -s /usr/bin/bash /usr/bin/sh

WORKDIR /root/notebook
CMD ["sh","/root/start_notebook.sh"]