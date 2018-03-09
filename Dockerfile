FROM ruby:2.4

# Set this to the version of TDS you wish to load.
# You can change it at build time with
#     docker build --args FREETDS=freetds-1.00.82
ARG FREETDS=freetds-1.00.82

###
# Setting up Free TDS for SQL Server connectivity

# Build Dependencies
RUN DEBIAN_FRONTEND=noninteractive \
        apt-get update && \
        apt-get install -y wget build-essential libc6-dev && \
        apt-get clean

# Download Free TDS and cleanup
RUN wget http://www.freetds.org/files/stable/$FREETDS.tar.gz && \
    tar -xvf $FREETDS.tar.gz -C /opt && \
    rm $FREETDS.tar.gz

WORKDIR /opt/$FREETDS

# Install Free TDS
RUN ./configure --prefix=/usr/local --with-tdsver=7.3 && \
    make && \
    make install && \
    cd .. && rm -rf $FREETDS
