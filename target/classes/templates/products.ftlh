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
<h4>Товары отовсюду</h4>

<form action="/" method="get">
    <label>
        Поиск по названию объявления:
        <input type="text" name="title"/>
    </label><br>
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p>
            <b>${product.title}</b>
            ${product.price} | <a href="/product/${product.id}">Подробнее</a>
        </p>
    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>

<hr>
<h3>Создать новый товар</h3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    <label>
        Название Объявления:
        <input type="text" name="title"/>
    </label>
    <br><br>
    <label>
        Описание объявления:
        <input type="text" name="description"/>
    </label>
    <br><br>
    <label>
        Цена:
        <input type="number" name="price"/>
    </label>
    <br><br>
    <label>
        Город:
        <input type="text" name="city"/>
    </label>
    <br><br>
    <label>
        Имя:
        <input type="text" name="author"/>
    </label>
    <br><br>
    <label>
        Фото 1:
        <input type="file" name="file1"/>
    </label>
    <br><br>
    <label>
        Фото 2:
        <input type="file" name="file2"/>
    </label>
    <br><br>
    <label>
        Фото 3:
        <input type="file" name="file3"/>
    </label>
    <br><br>

    <input type="submit" value="Добавить товар">
</form>

</body>
</html>