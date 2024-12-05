{ ... }: {
  networking = {
    computerName = "Qmi's Macbook";
    hostName = "Qmi's Macbook";
    dns = [
      "1.1.1.1" # Cloudflare
      "1.0.0.1" # Cloudflare
      "8.8.8.8" # Google
      "8.8.4.4" # Google
      "2606:4700:4700::1111" # Cloudflare IPv6
      "2606:4700:4700::1001" # Cloudflare IPv6
      "2001:4860:4860::8888" # Google IPv6
      "2001:4860:4860::8844" # Google IPv6
    ];
  };
}
