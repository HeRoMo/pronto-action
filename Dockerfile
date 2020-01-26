FROM hero/pronto-action:0.4.0

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/pronto/entrypoint.sh"]
