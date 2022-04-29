FROM ubuntu

RUN apt update --fix-missing && apt install python3 pip -y --fix-missing
RUN pip install jupyter notebook
RUN pip install jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN jupyter contrib nbextension install
RUN mkdir /root/notebook
RUN jupyter notebook --generate-config
RUN echo 'c.NotebookApp.ip = "*"'>>/root/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.open_browser = False>>/root/.jupyter/jupyter_notebook_config.py
RUN echo 'c.NotebookApp.notebook_dir = "/root/notebook"'>>/root/.jupyter/jupyter_notebook_config.py
RUN echo jupyter notebook --allow-root>/root/start_notebook.sh
RUN chmod +x /root/start_notebook.sh

WORKDIR /root/notebook
CMD ["sh","/root/start_notebook.sh"]
