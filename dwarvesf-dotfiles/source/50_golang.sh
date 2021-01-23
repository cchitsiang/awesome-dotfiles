is_ubuntu && {
  export GOPATH=/usr/local/go
  export PATH=$GOPATH/bin:$PATH
}

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin