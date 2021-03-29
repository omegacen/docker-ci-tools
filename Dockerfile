FROM python:3

LABEL maintainer="teake.nutma@gmail.com"
LABEL version="1.0"
LABEL description="Various tools that come in handy during (GitLab) CI"

# Install via apt
RUN apt-get update && apt-get -y install \
    jq \
    rsync \
    s-nail \
    gettext \
    && apt-get clean
# Install via pip
RUN pip install \
    black==19.10b \
    autopep8 \
    python-gitlab \
    python-compare-ast \
    coverage-fixpaths

# Install Gitlab release-cli
RUN curl --location --output /usr/local/bin/release-cli "https://release-cli-downloads.s3.amazonaws.com/latest/release-cli-linux-amd64" \
    && chmod +x /usr/local/bin/release-cli

# Install git-scripts
RUN git clone https://gitlab.astro-wise.org/omegacen/git-scripts.git ~/git-scripts \
    && mv ~/git-scripts/bin/* /usr/local/bin/ \
    && rm -rf ~/git-scripts

# Install ssh-addkey
RUN mkdir -p ~/.ssh
RUN echo "Host *\n\tStrictHostKeyChecking no" > ~/.ssh/config
COPY ssh-addkey.sh /usr/local/bin/ssh-addkey
COPY python-gitlab-set-private-token.sh /usr/local/bin/python-gitlab-set-private-token

COPY entrypoint.sh /usr/local/bin/entrypoint
ENTRYPOINT [ "/bin/bash", "/usr/local/bin/entrypoint" ]
CMD [ "/bin/bash" ]
