# IP addresses
alias whois="whois -h whois-servers.net"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Ping the specified server (or the default 8.8.8.8) and say "ping"
# through the speaker every time a ping is successful. Based on an
# idea from @gnarf.
function pingtest() {
  local c
  for c in say spd-say; do [[ "$(which $c)" ]] && break; done
  ping ${1:-8.8.8.8} | perl -pe '/bytes from/ && `'$c' ping`'
}

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

