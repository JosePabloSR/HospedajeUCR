const btnTogglet = document.querySelector('.toggle-btn');

btnTogglet.addEventListener('click',function(){
    document.getElementById('sidebar').classList.toggle('active');
    
});