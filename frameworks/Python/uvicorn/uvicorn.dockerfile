FROM techempower/python3:0.1

ADD ./ /uvicorn

WORKDIR /uvicorn

RUN pip3 install --install-option="--prefix=${PY3_ROOT}" -r /uvicorn/requirements.txt

CMD uvicorn app:main -c uvicorn_conf.py
