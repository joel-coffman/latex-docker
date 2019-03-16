FROM debian

RUN apt update && apt install --no-install-recommends --yes \
            podbrowser \
            wget


WORKDIR /tmp

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xvfz install-tl-unx.tar.gz --strip-component 1

COPY texlive.profile .
RUN ./install-tl --profile=texlive.profile

ENV PATH="/usr/local/texlive/2018/bin/x86_64-linux:${PATH}"
RUN tlmgr install texliveonfly


RUN apt remove --purge --yes \
            podbrowser
RUN apt install --no-install-recommends --yes \
            make

RUN rm -rf /var/lib/apt/lists/*
