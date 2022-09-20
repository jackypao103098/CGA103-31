const submitBtn = document.getElementById('submitBtn');
let inputFile = document.getElementById("inputFile");
let msg = document.getElementById('msg');
let title = document.getElementById('title');
let content = document.getElementById('content');
let customRadio = document.getElementById('customRadio');

submitBtn.addEventListener('click', function(){
        fetch("/CGA103G1/createAc",{
            method:"POST",
            headers:{
                'Accept': 'application/json, text/plain, */*',
                'Content-Type': 'application/json, text/plain, */*, multipart/form-data',
            },
            body:
            JSON.stringify({
                ac_title: title.value,
                ac_content: content.value,
                ac_type_no: customRadio.value,
            }),
        })
        .then(res => res.ok? msg.textContent="成功":msg.textContent="失敗")
        .then(()=>{
                fetch("/CGA103G1/uploadAcImage",
                {
                    method:"POST",
                    headers:{
                        'Accept': 'application/json, text/plain, */*',
                        'Content-Type': 'multipart/form-data',
                    },
                    body:inputFile.files[0]
                })
            }
        )
    }
)

