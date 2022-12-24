window.onload = function () {
    // var btn_add = document.getElementById("btn_add");
    // var chip = document.getElementById("chip");
    // var Chip_order = document.getElementById("Chip_order");
    var address = document.getElementById('address')
    var companys = document.querySelectorAll('select[name=company]')


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
        var value_list = []
        if (address_value == 'AAA') {
            value_list.push('A111')
            value_list.push('A666')
        } else if (address_value == 'BBB') {
            value_list.push('B222')
            value_list.push('བསྟན་འཛིན་བརྩོན་འགྲུས་')
            value_list.push('zood')
        } else {
            value_list.push('C333')
            value_list.push('shenzhen')
            value_list.push('ooooooooooooooooo')
            value_list.push('龙岗大学')
        }
        //先删除原有的选项
        for (let i = 0; i < companys.length; i++) {
            companys[i].innerHTML = 0
            for (var j = 0; j <value_list.length; j++) {
                var options = document.createElement('option')
                options.innerHTML = value_list[j]
                companys[i].appendChild(options);
            }
            
            
          }
    }

    // btn_add.addEventListener('click', function () {
    //     Chip_order.innerHTML=Chip_order.innerHTML + chip.innerHTML
    //     console.log(1)
    //     address.setAttribute('disabled', 'disabled')//添加芯片后禁止修改地址

    // })



    // //submit执行的函数
    // function fnClose() {
    //     console.log('success')
    // }

    
    
}