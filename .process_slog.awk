state == 0 {
    if ($1 ~ /[0-9]+/) id = $1;
    line = $0;
    count = 1;
    state = 1;
    next;
}
state == 1 {
    if ($1 == id) {
        line = line " " $2;
        count++;
    }
    else {
        print line;
        id = $1;
        line = $0;
        count = 1;
    }
}
END {
    print line;
}
