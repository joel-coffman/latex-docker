FROM debian

RUN apt update && apt install --no-install-recommends --yes \
            make \
            texlive \
            texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/*
