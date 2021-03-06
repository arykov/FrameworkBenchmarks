FROM techempower/python2:0.1

ADD ./ /web2py

WORKDIR /web2py

RUN pip install --install-option="--prefix=${PY2_ROOT}" -r /web2py/requirements.txt

RUN git clone --recursive --branch master https://github.com/web2py/web2py.git

WORKDIR /web2py/web2py

# The following commit is checked out in order to take advantage of several
# bug fixes that were made after the latest stable release. This can be changed
# in future rounds once a new stable release has been made.
RUN git checkout 623f3b99477eb97ffadb20d6f7cb3da398253c9c

WORKDIR /web2py

RUN cp -r app/standard/ web2py/applications/
RUN cp -r app/optimized/ web2py/applications/
RUN cp app/wsgi.py web2py/
RUN cp app/routes.py web2py/
RUN touch web2py/__init__.py
RUN python compile_apps.py
