# 使用ubuntu作为基础镜像
FROM ubuntu

# 设置中文显示支持
ENV LANG=C.UTF-8
# 设置时区
ENV TZ=Asia/Shanghai

# 从notebook_hub获取相关配置文件
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/jupyter_notebook_config.py /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/custom.css /root/tmp_config/
ADD https://github.com/brokyz/notebook_hub/raw/main/simhei/SimHei.ttf /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/README.ipynb /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/start_notebook.sh /root/tmp_config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/notebook_hub_info.txt /root/tmp_config/


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install python3 pip -y \
    && pip install jupyter notebook jupyter_contrib_nbextensions jupyter_nbextensions_configurator\
    && jupyter contrib nbextension install \
    && mkdir /root/notebook \
    && jupyter notebook --generate-config \
    && rm -rf /root/.jupyter/jupyter_notebook_config.py \
    && mv /root/tmp_config/jupyter_notebook_config.py /root/.jupyter/ \
    && mkdir /root/.jupyter/custom && mv /root/tmp_config/custom.css /root/.jupyter/custom/ \
    && mkdir /usr/share/fonts/simhei && mv /root/tmp_config/SimHei.ttf /usr/share/fonts/simhei/ \
    && mv /root/tmp_config/README.ipynb /root/notebook/ \
    && apt install r-base -y \
    && Rscript -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))" \
    && Rscript -e "install.packages('IRkernel')" \
    && Rscript -e "IRkernel::installspec(user=FALSE)" \
    && mv /root/tmp_config/start_notebook.sh /root/ \
    && chmod +x /root/start_notebook.sh \
    && mv /root/tmp_config/notebook_hub_info.txt /root/ \
    && rm -rf /root/tmp_config \
    && rm -rf /usr/bin/sh && ln -s /usr/bin/bash /usr/bin/sh

WORKDIR /root/notebook
CMD ["sh","/root/start_notebook.sh"]