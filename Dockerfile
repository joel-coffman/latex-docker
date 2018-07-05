FROM debian

RUN apt update && apt install --no-install-recommends --yes \
            make \
            python-pygments \
            texlive \
            texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/*
