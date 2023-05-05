window.onload = function () {
    
    var address = document.getElementById('address')
    var companys = document.querySelectorAll('select[name=company]')


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
    for (let i = 0; i < companys.length; i++) {
        value_list = ['A111', 'A666']
        for (var j = 0; j < value_list.length; j++) {
            var options = document.createElement('option')
            options.innerHTML = value_list[j]
            companys[i].appendChild(options);
        }
    }

    // Adds a default choice
    address.dispatchEvent(new Event('AAA'))
    appendCompany()
    
}
