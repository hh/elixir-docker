FROM adbl/erlang:r16b03-1

RUN apt-get install -y git build-essential

WORKDIR /tmp
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR /tmp/elixir
RUN git checkout v0.12.5
RUN make install
RUN rm -rf /tmp/elixir

RUN apt-get remove -y build-essential
RUN apt-get autoremove -y
RUN apt-get clean
RUN apt-get autoclean