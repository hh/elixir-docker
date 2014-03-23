FROM adbl/erlang:r16b03-1

RUN apt-get install -y git
WORKDIR /tmp
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR /tmp/elixir
RUN git checkout v0.12.5
RUN make install
RUN rm -rf /tmp/elixir
