FROM python:3.7-slim-buster

COPY requirements.txt /
RUN pip install -r requirements.txt

# get set of scripts from github
ADD https://github.com/Bartman0/tableau-scripts/archive/master.tar.gz scripts.tar.gz
RUN mkdir -p /scripts \
	&& tar -zxv --strip-components 1 -C /scripts -f scripts.tar.gz --wildcards "*.py" \
	&& rm -f scripts.tar.gz

# add custom version of Tableau document-api-python
ADD https://github.com/Bartman0/document-api-python/archive/master.tar.gz document-api-python.tar.gz
RUN mkdir -p /document-api-python \
	&& tar -zxv --strip-components 1 -C /document-api-python -f document-api-python.tar.gz \
	&& rm -f document-api-python.tar.gz \
	&& cd /document-api-python \
	&& pip install -e . \
	&& echo rm -fr /document-api-python

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
