<!doctype HTML>
<html>
<head>
    <title>Create a new post</title>
</head>
<body>
<#if username??>
    Welcome ${username} <a href="/logout">Logout</a> | <a href="/">Blog Home</a>

    <p>
</#if>
<form action="/newpost" method="POST">
    ${errors!""}
    <h2>Title</h2>
    <input type="text" name="subject" size="120" value="${subject!""}"><br>

    <h2>Blog Entry
        <h2>
            <textarea name="body" cols="120" rows="20">${body!""}</textarea><br>

            <h2>Tags</h2>
            Comma separated, please<br>
            <input type="text" name="tags" size="120" value="${tags!""}"><br>

            <p>
                <input type="submit" value="Submit">

</body>
</html>

