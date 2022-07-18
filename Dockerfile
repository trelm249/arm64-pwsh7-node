FROM redhat/ubi8:latest

RUN yum upgrade -y && \
    yum install -y jq curl ca-certificates openssl openssl-devel libicu-devel && \
    yum clean all

COPY get-powershell.sh /root

RUN chmod +x /root/get-powershell.sh && \
    bash -c /root/get-powershell.sh

CMD pwsh

WORKDIR /data
