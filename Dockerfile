FROM homebrew/brew:latest
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
USER linuxbrew
ENV HOMEBREW_NO_AUTO_UPDATE=1
RUN brew tap brewsci/bio && \
  brew install perl cpanm lesspipe \
  samtools bcftools \
  datamash pigz parallel \
  htop glances && \
  cpanm local::lib && \
  rm -rf /home/linuxbrew/.cache /home/linuxbrew/.cpanm \
         /home/linuxbrew/.bundle /home/linuxbrew/.gem
ENV LESSOPEN="|/home/linuxbrew/.linuxbrew/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
ENV PATH=$PATH:\$HOME/apps/bin:\$HOME/.local/bin
