<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Buysell</title>
</head>
<body>
<h1>Buysell</h1>
<a href="/">Домой</a>

<#list images as img>
    <img src="/images/${img.id} " height="60px" alt="Unexpected">
</#list>

<h4>Подробная информация о товаре</h4><br>
<b>Название товара: ${product.title}</b><br>
<b>Описание товара: ${product.description}</b><br>
<b>Цена товара: ${product.price}</b><br>
<b>Город товара: ${product.city}</b><br>
<b>Автор товара: ${product.author}</b><br>

<form action="/product/delete/${product.id}" method="post">
    <input type="submit" value="Удалить товар">
</form>

</body>
</html>