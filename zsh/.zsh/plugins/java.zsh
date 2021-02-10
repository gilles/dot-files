#
# make my prompt work with java
#

# move this somewhere else if I use jenv again
# if [[ -s "$HOME/.jenv/bin/jenv" ]]; then
#    path=("$HOME/.jenv/bin" $path)
#    eval "$(jenv init - --no-rehash zsh)"
# fi

# move this to fpath?
function java-info {
    local version
    local default
    local version_format
    local version_formatted
    
    # Clean up previous $java_info.
    unset java_info
    typeset -gA java_info
    
    # Grab the styling we might have to do
    zstyle -s ':gilles:java:info:version' format 'version_format'
    if [[ -n "$version_format" ]]; then

        if (( $+commands[jenv] )); then
            version="${$(jenv version)%% *}"
            default="${$(jenv global)%% *}"
        fi

        if (( $+functions[sdk] )); then
            version="${${$(sdk current | grep java)##java: }/.*-/-}"
            # no function to get the default
            default="11-amzn"
        fi
        
        if [[ -n "$version" && "$version" != "$default" ]]; then
            zformat -f version_formatted "$version_format" "v:$version"
            java_info[version]="$version_formatted"
        fi
    fi
}
