FROM hero/pronto-action:develop

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/pronto/entrypoint.sh"]
