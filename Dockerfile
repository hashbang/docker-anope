FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential cmake curl libgnutls28-dev sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl https://codeload.github.com/anope/anope/tar.gz/2.0.5 | tar xz && \
    cd anope-2.0.5 && \
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

ADD run.sh /tmp/run.sh

RUN useradd anope

EXPOSE 80

# Default command to run on boot
CMD ["/tmp/run.sh"]
