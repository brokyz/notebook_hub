FROM ubuntu

ENV LANG=zh_CN.UTF8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install wget vim python3 pip -y

RUN pip install jupyter notebook

RUN pip install jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN jupyter contrib nbextension install

RUN mkdir /root/notebook
RUN jupyter notebook --generate-config

RUN rm -rf /root/.jupyter/jupyter_notebook_config.py
RUN wget https://raw.githubusercontent.com/brokyz/jupyter_notebook_for_docker/main/config/jupyter_notebook_config.py && mv jupyter_notebook_config.py /root/.jupyter/
RUN wget https://raw.githubusercontent.com/brokyz/jupyter_notebook_for_docker/main/config/custom.css && mkdir /root/.jupyter/custom && mv custom.css /root/.jupyter/custom/
RUN wget https://github.com/brokyz/jupyter_notebook_for_docker/raw/main/simhei/SimHei.ttf && mkdir /usr/share/fonts/simhei && mv SimHei.ttf /usr/share/fonts/simhei/
RUN wget https://raw.githubusercontent.com/brokyz/jupyter_notebook_for_docker/main/README.ipynb && mv README.ipynb /root/notebook/

RUN apt install r-base -y
RUN Rscript -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))"
RUN Rscript -e "install.packages('IRkernel')"
RUN Rscript -e "IRkernel::installspec(user=FALSE)"


RUN wget https://raw.githubusercontent.com/brokyz/jupyter_notebook_for_docker/main/config/start_notebook.sh && mv start_notebook.sh /root/
RUN chmod +x /root/start_notebook.sh

RUN wget https://raw.githubusercontent.com/brokyz/jupyter_notebook_for_docker/main/config/notebook_hub_info.txt && mv notebook_hub_info.txt /root/

WORKDIR /root/notebook
CMD ["sh","/root/start_notebook.sh"]
