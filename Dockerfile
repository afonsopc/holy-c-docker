FROM ubuntu

# Install dependencies
RUN apt-get update ; apt-get upgrade -y
RUN apt-get install -y git cmake make sqlite3
RUN git clone https://github.com/Jamesbarford/holyc-lang

# Build holyc compiler
RUN cd holyc-lang ; make ; make install
RUN rm -rf holyc-lang

# Purge unnecessary dependencies
RUN apt-get purge -y git cmake make

# Install sqlite3 development library
RUN apt-get install -y libsqlite3-dev

ENTRYPOINT ["hcc"]