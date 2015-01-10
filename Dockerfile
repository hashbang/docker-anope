FROM debian:wheezy

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential cmake curl libgnutls-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl http://iweb.dl.sourceforge.net/project/anope/anope-stable/Anope%202.0.1/anope-2.0.1-source.tar.gz | tar xz && \
    cd anope-2.0.1-source && \
    mv modules/extra/m_ssl_gnutls.cpp modules/ && \
    mkdir build && \
    cd build && \
    cmake \
      -DINSTDIR:STRING=/opt/services \
      -DDEFUMASK:STRING=077  \
      -DCMAKE_BUILD_TYPE:STRING=RELEASE \
      -DUSE_RUN_CC_PL:BOOLEAN=ON \
      -DUSE_PCH:BOOLEAN=ON .. && \
    make && \
    make install

EXPOSE 80

# Default command to run on boot
CMD ["/opt/services/bin/services"]
