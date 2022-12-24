window.onload = function () {
    var btn_add = document.getElementById("btn_add");
    var chip = document.getElementById("chip");
    var Chip_order = document.getElementById("Chip_order");
    var address = document.getElementById('address')
    var company = document.getElementById('company')

    // const consumer_inf = document.getElementById('form_consumer');
    // consumer_inf.addEventListener('confirm', submit_consumer);

    // function submit_consumer(e) {
    //     console.log(e)
    //     e.preventDefault()
    //     getCompany()
    //     return false
    // }

    // //如何得到公司名称？
    // function getCompany() {
    //     console.log('get it')
    // }

    //选取地址后给公司列表添加option
    address.addEventListener('change', appendCompany)

    function appendCompany() {
        var index = address.selectedIndex
        var address_value = address.options[index].value
        console.log(index)
        console.log(address_value)
        if (address_value == 'AAA') {
            var options = document.createElement('option')
            options.innerHTML = 'A111'
        } else if (address_value == 'BBB') {
            var options = document.createElement('option')
            options.innerHTML = 'B222'
        } else {
            var options = document.createElement('option')
            options.innerHTML = 'C333'
        }
        company.remove(0)//先删除原有的选项
        company.appendChild(options)
    }

    btn_add.addEventListener('click', function () {
        Chip_order.innerHTML=Chip_order.innerHTML + chip.innerHTML
        console.log(1)
        address.setAttribute('disabled', 'disabled')//添加芯片后禁止修改地址

    })



    //submit执行的函数
    function fnClose() {
        console.log('success')
    }

    
    
}