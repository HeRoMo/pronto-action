FROM hero/pronto-action:v1.0.0

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
