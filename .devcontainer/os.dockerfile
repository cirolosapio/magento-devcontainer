FROM opensearchproject/opensearch:2

RUN /usr/share/opensearch/bin/opensearch-plugin install --batch \
    analysis-icu \
    analysis-phonetic
