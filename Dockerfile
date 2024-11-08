# noble(24.04 LTS), jammy(22.04 LTS)
ARG VARIANT
FROM buildpack-deps:${VARIANT}-curl

ARG TEXLIVE_YEAR
ARG SCHEME
LABEL \
  org.opencontainers.image.title="Devcontainer of TeXLive" \
  org.opencontainers.image.authors="rnicrosoft-studio" \
  org.opencontainers.image.source="https://github.com/rnicrosoft-studio/latex-docker/" \
  org.opencontainers.image.licenses="MPL-2.0"
ENV LANG C.UTF-8

# install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends wget fontconfig git make libfile-fcntllock-perl

# TeXLive
WORKDIR /tmp
RUN if [ "$TEXLIVE_YEAR" = "latest" ]; then \
        echo "Installing latest TeXLive ..."; \
        wget --no-check-certificate https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
        && zcat < install-tl-unx.tar.gz | tar -xf - \
        && export TLDIR=$( ls -d install-tl-2* ) \
        && perl "./${TLDIR}/install-tl" -scheme="scheme-${SCHEME}" --no-interaction; \
    else \
        echo "Installing TeXLive ${TEXLIVE_YEAR} ..."; \
        wget --no-check-certificate https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${TEXLIVE_YEAR}/tlnet-final/install-tl-unx.tar.gz \
        && zcat < install-tl-unx.tar.gz | tar -xf - \
        && export TLDIR=$( ls -d install-tl-2* ) \
        && perl "./${TLDIR}/install-tl" -scheme="scheme-${SCHEME}" -repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${TEXLIVE_YEAR}/tlnet-final --no-interaction; \
    fi

RUN YEAR=$(ls -d /usr/local/texlive/2* | sed -e 's/.*[/]//g') \
    && echo MANPATH=/usr/local/texlive/$YEAR/texmf-dist/doc/man:$MANPATH >> ~/.profile \
    && echo INFOPATH=/usr/local/texlive/$YEAR/texmf-dist/doc/info:$INFOPATH >> ~/.profile \
    && echo PATH=/usr/local/texlive/$YEAR/bin/x86_64-linux:$PATH >> ~/.profile \
    && . ~/.profile \
    # System font configuration for XeTeX and LuaTeX
    # Ref: https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-330003.4.4
    && ln -s /usr/local/texlive/$YEAR/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf \
    && fc-cache -fv
    
