function AddToCart()
{
    alert("hehe");
}
$(document).ready(function () {
    $('.info').click(function () {
        $('#infoProductModal').modal('show')
    })
});

document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.info').forEach(function (element) {
        element.addEventListener('click', function () {
            $('#infoProductModal').modal('show');
        });
    });
});
