curl http://iweb.dl.sourceforge.net/project/anope/anope-stable/Anope%202.0.1/anope-2.0.1-source.tar.gz | tar xz && \
    cd anope-2.0.1-source && \
    mkdir build && \
    cd build && \
    cmake \
      -DINSTDIR:STRING=/opt/services \
      -DDEFUMASK:STRING=077  \
      -DCMAKE_BUILD_TYPE:STRING=RELEASE \
      -DUSE_RUN_CC_PL:BOOLEAN=ON \
      -DUSE_PCH:BOOLEAN=OFF .. && \
    make
