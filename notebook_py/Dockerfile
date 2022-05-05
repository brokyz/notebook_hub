# 使用ubuntu作为基础镜像
FROM ubuntu

# 设置中文显示支持
ENV LANG=C.UTF-8
# 设置时区
ENV TZ=Asia/Shanghai
ENV hostname=jupyter

ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/jupyter_notebook_config.py /root/config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/jupyter_lab_config.py /root/config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/custom.css /root/config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/init.sh /root/config/


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install python3 pip -y \
    && pip install jupyterlab \
    && rm -rf /usr/bin/sh && ln -s /usr/bin/bash /usr/bin/sh \
    && jupyter lab --generate-config && jupyter notebook --generate-config \
    && mkdir /root/notebook && mkdir /root/.jupyter/custom \
    && rm -rf /root/.jupyter/jupyter_notebook_config.py && rm -rf /root/.jupyter/jupyter_lab_config.py \
    && mv /root/config/jupyter_lab_config.py /root/.jupyter/ && mv /root/config/jupyter_notebook_config.py /root/.jupyter/ && mv /root/config/custom.css /root/.jupyter/custom/ \
    && mv /root/config/init.sh /root/ \
    && chmod +x /root/init.sh \
    && rm -rf /root/config

WORKDIR /root/notebook
CMD ["sh","/root/init.sh"]