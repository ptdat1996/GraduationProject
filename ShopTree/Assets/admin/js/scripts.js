const passwordLength = 6;
const urlImgur = "https://api.imgur.com/3/image";
const clientId = "Client-ID c19f4af6ff4fbae";

showTime = () => {
    var date = new Date();
    var h = date.getHours(); // 0 - 23
    var m = date.getMinutes(); // 0 - 59
    var s = date.getSeconds(); // 0 - 59
    var session = "AM";

    if (h === 0) {
        h = 12;
    }

    if (h > 12) {
        h = h - 12;
        session = "PM";
    }

    h = h < 10 ? "0" + h : h;
    m = m < 10 ? "0" + m : m;
    s = s < 10 ? "0" + s : s;

    var time = h + ":" + m + ":" + s + " " + session;
    $("#currentTime").text(time);

    setTimeout(showTime, 1000);
};

loadFile = (event) => {
    let reader = new FileReader();
    let file = event.target.files[0];

    reader.onloadend = () => {
        var image = document.getElementById("preview");
        image.src = reader.result;
    };
    reader.readAsDataURL(file);
};

getImageUrl = async () => {
    let file = document.querySelector("input[type='file']").files[0];
    let link = null;
    if (file !== undefined) {
        const formData = new FormData();
        formData.append('image', file);
        const respone = await fetch(urlImgur, {
            method: 'POST',
            headers: { 'Authorization': clientId },
            body: formData
        });
        const json = await respone.json();
        link = json.data.link;
    }
    return link;
};

showTime();

$('input[type="checkbox"]').change(function () {
    if ($(this).is(':checked')) {
        $(this).val(true);
    }
    else {
        $(this).val(false);
    }
});

$('#confirm-delete').on('show.bs.modal', function (e) {
    var data = $(e.relatedTarget).data();
    $('.prop-name').text(data.propName);
    $(".prop-id").val(data.id);
    $(".page-index").val(data.pageIndex);
    $(".page").val(data.page);
});

$("#btn-delete").click(async function (event) {
    event.preventDefault();
    $(".loading-container").css("display", "inline-block");
    $("#btn-delete").addClass("btn-disabled");
    $(".btn-default").addClass("btn-disabled");

    const data = {
        id: $("#confirm-delete").find("input[type='hidden'].prop-id").val(),
        page: $("#confirm-delete").find("input[type='hidden'].page-index").val()
    };

    const page = $("#confirm-delete").find("input[type='hidden'].page").val();
    let url = '';
    switch (page) {
        case "Product":
            url = "/Admin/Products/Delete";
            break;
        case "Blog":
            url = "/Admin/Blogs/Delete";
            break;
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify(data)
    });
    if (response.ok) {
        if (response.redirected) {
            $('#confirm-delete').modal('hide');    
            window.location = response.url;
        }
    } 
});

OnBegin = () => {
    $("button[type='submit']").attr("disabled", "disabled");
};

OnSuccess = (response) => {
    if (response.status === false) {
        $(".return-error").text(response.message);
        $("button[type='submit']").removeAttr("disabled");
    }
    else {
        window.location.href = response.url;
    }
};
