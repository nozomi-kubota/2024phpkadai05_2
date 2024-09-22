<?php
session_start();
require_once('functions.php');
loginCheck();
?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>つぶやき登録</title>
    <link rel="stylesheet" href="css/style.css" />

</head>

<body>
    <!-- Head[Start] -->
    <nav class="navbar">
        <a class="navbar-brand" href="select.php">アンケート一覧</a>
        <div class="navbar-header user-name">
            <p>ユーザー名：<?= $_SESSION['name'] ?>さん</p>
        </div>
        <form class="logout-form" action="logout.php" method="post" onsubmit="return confirm('本当にログアウトしますか？');">
            <button type="submit" class="logout-button">ログアウト</button>
        </form>
    </nav>


    <!-- Head[End] -->
    <!-- Main[Start] -->
    <form method="POST" action="insert.php" enctype="multipart/form-data">
        <div class="jumbotron">
            <fieldset><!--コントロールをグループ化するために使用-->
                <legend>アンケート新規入力</legend>
                <div>
                    <label for="content">内容：</label>
                    <textarea id="content" name="content" rows="4" cols="40"></textarea>
                </div>
                <p></p>
                <div>
                    <label for="image">画像：</label>
                    <input type="file" id="image" name="image">
                    <p></p>
                </div>
                <div>
                    <input type="submit" value="送信">
                </div>
            </fieldset>
        </div>
    </form>
</body>

</html>