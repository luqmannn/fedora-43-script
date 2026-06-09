# Make directory
mkcd() {
        mkdir -pv "$1" && cd "$1"
}

# File recursive file finder - name search
ff() {
        find . -type f -iname "*$1*" 2>/dev/null
}

# Find directories by name
fd() {
        find . -type d -iname "*$1*" 2>/dev/null
}

# Find top 10 largest folder
large() {
        du -hs * | sort -rh | head -10
}

# Spin up simple http server using python
server() {
        local port=${1:-8000}
        echo "Serving on http://localhost:$port"
        python3 -m http.server "$port"
}
