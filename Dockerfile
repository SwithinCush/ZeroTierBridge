
FROM zerotier/zerotier:latest
run mkdir /app
workdir /app
run apt-get update -qq && apt-get install -qq --no-install-recommends -y procps iptables openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
run echo "${VERSION}" >/etc/zerotier-version
copy entrypoint.sh entrypoint.sh
run chmod 755 entrypoint.sh
entrypoint ["/app/entrypoint.sh"]
