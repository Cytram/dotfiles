# Defined in - @ line 1
function nexus-token
    echo -n "Username: " && read username && \
    echo -n "Password (no OTP): " read -s password && echo && \
    echo -n "OTP (leave blank if disabled): " && read -s otp && echo && \
    mkdir -p /tmp/ && \
    rm -f /tmp/nexus-token.sh &>/dev/null && \
    curl --silent -X POST https://aeu1-nexus01-token.publicdns.zone/auth \
    --data "{\"username\": \"$username\", \"password\": \"$password$otp\"}" \
    -H "Content-Type: application/json" > /tmp/nexus-token.sh && \
    chmod +x /tmp/nexus-token.sh && /tmp/nexus-token.sh
end
