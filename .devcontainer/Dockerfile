FROM mcr.microsoft.com/devcontainers/base:ubuntu

# TeX toolchain (lean but complete for your project)
RUN apt-get update && apt-get install -y \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    latexmk biber python3-pygments ghostscript chktex \
 && rm -rf /var/lib/apt/lists/*