// Support for update.html

function post_app(appZip) {
    var data = new FormData()

    var ip = document.getElementById('r_ip').value
    var pass = document.getElementById('r_pas').value

    var url = 'http://'+ip+'/plugin_install'
    data.append('archive', appZip)
    data.append('mysubmit', 'Install')

    console.log('Uploading app');
    fetch(url, {
        method: 'POST',
        headers: {
            "Content-Type": "application/octet-stream",
            "Authorization": "Basic " + btoa("rokudev:" + pass),
        },
        mode: "no-cors",
        credentials: "include",
        body: data
    })
    // Ideally would like to display some text from the response HTML
    // but Since this has to be a no-cors request the response is
    // blocked by the browser https://stackoverflow.com/a/54906434, so
    // we are reduced to just display the current app data in a frame.
    .then((response) => {
        console.log(response)
        var framesrc = 'http://'+ip+':8060/query/active-app'
        document.getElementById("applist_frame").src=framesrc
    })
}

function update_roku() {
    const re = /(\d+)(\d{2})(\d{4})$/;

    fetch('ver.json', { cache: 'no-cache' })
        .then((response) => response.json())
        .then((data) => {
            var fname = data.curr.replace(re, "IsraTv_v$1.$2.$3.zip");

            console.log('Fetching ' + fname);
            fetch('releases/' + fname)
                .then((response) => response.blob())
                .then((myblob) => post_app(new File([myblob], fname)));
        })
}

// Debug only - this is how we would have parsed esponse if it wasn't
// for the no-cors restriction.
//function dummy() {
//    response = fetch('x.html', { cache: 'no-cache' })
//       .then(response => response.text())
//        .then(str => new window.DOMParser().parseFromString(str, "text/html"))
//        .then(data => {
//            var res = document.getElementById("upload_result")
//            res.textContent = data.body.childNodes[5].innerText
//        });
//}
