
function check_ghichu() {
    var kq = document.querySelectorAll('.table_ghichu')
    var check = document.getElementById('check_ghichu')
    check.onchange = function () {
        if (check.checked == false)
            for (var i = 0; i < kq.length; i++) {
                kq[i].classList.add("d-none");
            }
        else
            for (var i = 0; i < kq.length; i++) {
                kq[i].classList.remove("d-none");
            }
    }
}






function check_ban() {
    var kq = document.querySelectorAll('.table_ban')
        var check = document.getElementById('check_ban')
        check.onchange = () => {

            if (check.checked == false)
                for (var i = 0; i < kq.length; i++) {
                    kq[i].classList.add("d-none");
                }
            else
                for (var i = 0; i < kq.length; i++) {
                    kq[i].classList.remove("d-none");
                }
        }
    

};

function check_img() {
    var kq = document.querySelectorAll('.table_hinh')
    var check = document.getElementById('check_img')
    check.onchange = () => {

        if (check.checked == false)
            for (var i = 0; i < kq.length; i++) {
                kq[i].classList.add("d-none");
            }
        else
            for (var i = 0; i < kq.length; i++) {
                kq[i].classList.remove("d-none");
            }
    }
};

function check_status() {
    var kq = document.querySelectorAll('.table_status')
    var check = document.getElementById('check_status')
    check.onchange = () => {

        if (check.checked == false)
            for (var i = 0; i < kq.length; i++) {
                kq[i].classList.add("d-none");
            }
        else
            for (var i = 0; i < kq.length; i++) {
                kq[i].classList.remove("d-none");
            }
    }
};


function cap_nhat_san_pham() {
    btn_capnhat.onclick = () => {
        btn_close_detai.click()
    };
}

function chon_ban(ma_ban) {
    var ban = document.getElementById(`ban_${ma_ban}`)
    var img = ban.getAttribute("src");
    ban.setAttribute("src", "images/chair2.png")
}

function chon_mon(ma_mon) {
    ds_mon.innerHTML += `
    <tr>
        <th class="align-middle">1</th>
        <td class="align-middle"><i class="fa fa-remove text-danger"></i></td>
        <td class="align-middle">Tên món ăn ABC</td>
        <td class="align-middle"><input class="form-control hoa-don" type="number" value="1"></td>
        <td class="align-middle">30,000</td>
        <td class="align-middle"><strong>30,000</strong></td>
    </tr>
    `
}