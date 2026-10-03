function remind-all
    pushd ~/.reminders
    cat * | glow - -t
    popd
end