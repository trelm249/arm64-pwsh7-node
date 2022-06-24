FROM debian:stable

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends jq curl ca-certificates libssl1.0.* libunwind8 libicu-dev && \
    apt-get purge --auto-remove

COPY get-powershell.sh /root

RUN chmod +x /root/get-powershell.sh && \
    bash -c /root/get-powershell.sh

CMD pwsh

WORKDIR /data
