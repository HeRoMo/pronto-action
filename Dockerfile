FROM hero/pronto-action:v0.2.0

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/pronto/entrypoint.sh"]
