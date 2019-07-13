FROM python:3.7-slim-buster

COPY requirements.txt /
RUN pip install -r requirements.txt

ADD https://github.com/Bartman0/tableau-scripts/archive/master.tar.gz scripts.tar.gz
RUN mkdir -p /scripts \
	&& tar -zxv --strip-components 1 -C /scripts -f scripts.tar.gz --wildcards "*.py" \
	&& rm -f scripts.tar.gz

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]

