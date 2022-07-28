FROM mambaorg/micromamba:0.15.3

EXPOSE 8501

USER root

RUN mkdir /opt/streamlit-deploy-tutorial
RUN chmod -R 777 /opt/streamlit-deploy-tutorial
WORKDIR /opt/streamlit-deploy-tutorial


USER micromamba

COPY environment.yml environment.yml
RUN micromamba install -y -n base -f environment.yml && \
   micromamba clean --all --yes

COPY run.sh run.sh
COPY . streamlit-deploy-tutorial/


USER root
RUN chmod a+x run.sh
CMD ["./run.sh"]