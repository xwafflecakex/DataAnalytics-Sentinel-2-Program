FROM python:3.9-slim as base

COPY Data /Data

WORKDIR /usr/src/app

COPY requirements.yml ./
RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip3 install "cloudpathlib[azure]" loguru tqdm typer

RUN pip3 install torch==1.10.1+cu102 torchvision==0.11.2+cu102 torchaudio===0.10.1+cu102 -f https://download.pytorch.org/whl/cu102/torch_stable.html
RUN pip3 install --no-cache-dir -r requirements.yml

## RUN python Data/download_data.py --sas-url Data/sas_easteurope.txt
## RUN python Data/download_data.py --sas-url sas_westeurope.txt
## RUN python Data/download_data.py --sas-url sas_centralus.txt

COPY . .

## CMD [ "python", "/download_data.py --sas-url /sas_easteurope.txt" ]