FROM debian:bookworm

USER root
RUN apt-get update \
    && apt-get install sudo nodejs npm curl wget neovim git lua5.3 bash golang ripgrep ninja-build gettext cmake unzip ruby-full tmux python3 python3-pip -y

RUN gem install rubygems-update && update_rubygems

RUN apt-get install ninja-build gettext cmake curl build-essential -y
RUN git clone https://github.com/neovim/neovim.git /usr/local/src/neovim \
    && cd /usr/local/src/neovim \
    && git checkout stable \
    && make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local \
    && make install \
    && cd / \
    && rm -rf /usr/local/src/neovim

WORKDIR /tmp/
RUN wget https://github.com/junegunn/fzf/releases/download/v0.58.0/fzf-0.58.0-linux_amd64.tar.gz \
    && tar xvzf /tmp/fzf*.tar.gz \
    && mv ./fzf /usr/bin/

RUN useradd -ms /bin/bash human
RUN echo 'eval "$(fzf --bash)"' >> /home/human/.bashrc
RUN echo "human ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /app && chown human /app

USER human
COPY --chown=human ./nvim /home/human/.config/nvim
COPY ./.tmux.conf /home/human/.tmux.conf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0 \
    && echo '. "$HOME/.asdf/asdf.sh"' >> /home/human/.bashrc \
    && echo '. "$HOME/.asdf/completions/asdf.bash"' >> /home/human/.bashrc 
RUN bash -ic "asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git" \
    && bash -ic "asdf install nodejs latest" \
    && bash -ic "asdf global nodejs latest"

VOLUME /app
WORKDIR /app
ENV TERM=xterm-256color COLORTERM=24bit
ENTRYPOINT ["bash"]

