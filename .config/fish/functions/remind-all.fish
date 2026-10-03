function remind-all
    pushd ~/.reminders
    cat * | glow - -t -l
    popd
end