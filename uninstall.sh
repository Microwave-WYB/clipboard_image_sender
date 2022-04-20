if [ -f $HOME/.local/bin/send ]; then
    rm $HOME/.local/bin/send
    echo "Successfully removed $HOME/.local/bin/send"
else
    echo "send is not installed"
fi