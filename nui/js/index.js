$(function(){
    function display(bool) {
        if (bool){
            $(".container").show()
        } else {
            $(".container").hide()
        }
    }

    display(false)

    window.addEventListener("message", function(event){
        
        let item = event.data
        if (item.type === "ui"){
            if (item.status){
                display(true)
             }
             else {
                display(false)
             }
    }
})


    $(".close").click(function ()
    {$.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({})) })
    $(".acquista").click(function ()
    {$.post(`https://${GetParentResourceName()}/acquista`, JSON.stringify({}))})
    })


