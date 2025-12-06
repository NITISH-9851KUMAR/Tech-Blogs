function doLike(pid, uid) {
    console.log(pid, uid)
    const data = {
        uid: uid,
        pid: pid,
        operation: "like"
    };

    fetch("like-servlet", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: new URLSearchParams(data)
    })
        .then(res => res.text())
        .then(result => {
            console.log(result);
            if (result.trim() == 'true') {

                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);

            }
        })
        .catch(err => console.error(err));
}

