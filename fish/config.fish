set fish_greeting ""
set PATH ~/.cargo/bin $PATH

function ssh_agent --description 'launch the ssh-agent and add the id_rsa identity'
    if begin
            set -q SSH_AGENT_PID
            and kill -0 $SSH_AGENT_PID
            and grep -q '^ssh-agent' /proc/$SSH_AGENT_PID/cmdline
    end
        echo "ssh-agent running on pid $SSH_AGENT_PID"
    else
        eval (command ssh-agent -c | sed 's/^setenv/set -Ux/')
    end
    set -l identity $HOME/.ssh/id_rsa
    set -l fingerprint (ssh-keygen -lf $identity | awk '{print $2}')
    ssh-add -l | grep -q $fingerprint
        or ssh-add $identity
end

alias d2 "begin; set -lx WINEARCH win32; set -lx WINEPREFIX ~/.bottles/d2; wine ~/.bottles/d2/drive_c/Program\ Files/Diablo\ II/D2SE.exe; end"
alias sql /usr/bin/sqlite3
