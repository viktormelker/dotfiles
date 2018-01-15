
function venv --description 'launch vs code'
    if not test -z "$argv"
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    else
        open -a "Visual Studio Code"
    end
end