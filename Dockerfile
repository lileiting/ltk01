FROM homebrew/brew:latest
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
USER linuxbrew
ENV HOMEBREW_NO_AUTO_UPDATE=1
RUN brew tap brewsci/bio && brew install perl cpanm \
  samtools bcftools datamash pigz htop glances \
  parallel && cpanm local::lib && \
  rm -rf /home/linuxbrew/.cache /home/linuxbrew/.cpanm \
         /home/linuxbrew/.bundle /home/linuxbrew/.gem
