
function venv --description 'create or activate a virtualenv'
    if not test -z "$argv"
        virtualenv --prompt "($argv) " .venv
        source .venv/bin/activate
    else
        source .venv/bin/activate
    end
end