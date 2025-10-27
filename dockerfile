FROM texlive/texlive:latest-small

# Set the working directory inside the container
WORKDIR /workdir

# Add the TeX Live binary directory to the system's PATH.
# This is the crucial fix that allows the container to find 'latexmk'.
ENV PATH="/usr/local/texlive/2025/bin/x86_64-linux:${PATH}"

# Install latexmk and any other necessary packages.
RUN tlmgr update --self && \
    tlmgr install latexmk \
    scheme-basic \
    babel-german \
    csquotes

# Define the default command to run when the container starts.
CMD ["latexmk", "-pdf", "main.tex"]