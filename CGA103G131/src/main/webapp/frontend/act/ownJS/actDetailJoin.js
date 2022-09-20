const reportBtn = document.getElementById('reportBtn');
const joinBtn = document.getElementById('joinBtn');

joinBtn.addEventListener('click', function(){
    
    fetch('/CGA103G1/joinAct',{
        method:"POST",
        headers:{
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        }
    })
    .then(res => res.json())
    .then(data => {
        console.log(data);
        let msg = `<div style="color: red;">${data}</div>`;
        joinBtn.insertAdjacentHTML('afterend', msg)
    })
});