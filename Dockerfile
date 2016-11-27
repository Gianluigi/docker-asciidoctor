FROM ruby:2.3
MAINTAINER Gianluigi Rubino <gianluigi@incorrect-code.org>

RUN apt-get update && apt-get install -y \
  build-essential \
  cmake libxml2   \
  libxml2-dev     \
  libcairo2-dev   \
  bison           \
  flex            \
  libgdk-pixbuf2.0-dev   \
  libgmp-dev             \
  libpango1.0-dev        \
  libffi-dev             \
  libxslt1-dev           \
  ttf-lyx                \
  default-jre            \
  graphviz

RUN gem install --no-ri --no-rdoc asciidoctor
RUN gem install --no-ri --no-rdoc asciidoctor-diagram
RUN gem install --no-ri --no-rdoc asciidoctor-pdf --pre
RUN gem install --no-ri --no-rdoc pygments.rb

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1
RUN gem install --no-ri --no-rdoc asciidoctor-epub3 --pre

ENV MATHEMATICAL_SKIP_STRDUP=1
RUN gem install --no-ri --no-rdoc asciidoctor-mathematical
CMD [ "irb" ]
