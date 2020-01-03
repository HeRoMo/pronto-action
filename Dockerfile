FROM hero/pronto-action:latest

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/pronto/entrypoint.sh"]
