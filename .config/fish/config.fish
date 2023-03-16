test -d $HOME/.local/bin; and set PATH $HOME/.local/bin $PATH
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x EDITOR vim
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
# set -x DISPLAY (ip route | grep default | awk '{print $3; exit;}'):0.0
set -x DISPLAY vsock/:0
set -x XCURSOR_SIZE 16
set -x XDG_SESSION_TYPE x11

fish_vi_key_bindings
fish_ssh_agent

function load-dot-env
    for line in (cat $argv[1])
        set line (string trim $line)
        if test -z $line
        or string match -q "#*" $line
            continue
        end
        set name_value (string split -m 1 = $line)
        set name (string trim $name_value[1])
        set value (string trim $name_value[2])
        #echo "[line=$line,name_value=$name_value,name=$name,value=$value]"
        if string match -q '"*"' $value
        or string match -q "'*'" $value
            set value (string sub -s 2 -e -1 $value)
        end
        if string match -qr '[$][{][A-Za-z_][A-Za-z_0-9]*[}]' $sub1
            set sub1 (string replace '[$][{]([A-Za-z_][A-Za-z_0-9]*)[}]' '$$$1' $sub1)
        else
            set sub1 $value
        end
        if string match -qr '[$][A-Za-z_][A-Za-z_0-9]*' $sub1
            set sub2 (eval "echo $value")
        else
            set sub2 $value
        end
        #echo "[name=$name,value=$value,sub1=$sub1,sub2=$sub2]"
        set -gx $name $sub2
    end
end

if not pgrep -f fcitx5 > /dev/null
    command fcitx5 > /dev/null 2>&1 &
end

if not pgrep -f blackd > /dev/null
    command blackd > /dev/null 2>&1 &
end

pyenv init - | source
