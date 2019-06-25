FROM debian

WORKDIR /tmp
COPY install.sh texlive.profile ./

RUN ./install.sh texlive.profile

RUN apt update && apt install --no-install-recommends --yes \
            git \
            make \
    && rm -rf /var/lib/apt/lists/*
