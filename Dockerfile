FROM hero/pronto-action:latest

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
