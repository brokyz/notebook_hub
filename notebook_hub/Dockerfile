# 使用ubuntu作为基础镜像
FROM ubuntu

# 设置中文显示支持
ENV LANG=C.UTF-8
# 设置时区
ENV TZ=Asia/Shanghai


ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/jupyter_notebook_config.py /root/config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/jupyter_lab_config.py /root/config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/custom.css /root/config/
ADD https://raw.githubusercontent.com/brokyz/notebook_hub/main/config/init.sh /root/config/
ADD https://github.com/brokyz/notebook_hub/raw/main/simhei/SimHei.ttf /root/config/


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install python3 pip git r-base -y \
    && pip install jupyterlab jupyterlab-language-pack-zh-CN jupyterlab-git jupyterlab-github jupyterlab-drawio jupyterlab-code-formatter black isort jupyterlab-lsp 'python-lsp-server[all]'\
    # && rm -rf /usr/bin/sh && ln -s /bin/bash /usr/bin/sh \
    && jupyter lab --generate-config && jupyter notebook --generate-config \
    && mkdir /root/notebook && mkdir /root/.jupyter/custom \
    && rm -rf /root/.jupyter/jupyter_notebook_config.py && rm -rf /root/.jupyter/jupyter_lab_config.py \
    && mv /root/config/jupyter_lab_config.py /root/.jupyter/ && mv /root/config/jupyter_notebook_config.py /root/.jupyter/ \
    && mv /root/config/custom.css /root/.jupyter/custom/ \
    && mv /root/config/init.sh /root/ \
    && chmod +x /root/init.sh \
    && mkdir /usr/share/fonts/simhei && mv /root/config/SimHei.ttf /usr/share/fonts/simhei/ \
    && rm -rf /root/config \
    && Rscript -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest','languageserver'))" \
    && Rscript -e "install.packages('IRkernel')" \
    && Rscript -e "IRkernel::installspec(user=FALSE)" 

WORKDIR /root/notebook
CMD ["sh","/root/init.sh"]