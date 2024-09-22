<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" />
    <title>アンケート入力_ログイン</title>
</head>

<header>
    <nav class="navbar">
        <a href="index.php">データ登録</a>
        <span>ログイン</span>
    </nav>
</header>

<body>
    <div class="container">
        <h1>ログイン</h1>
        <form name="form1" action="login_act.php" method="post">

            <div class="form-group">
                <label for="lid">ID</label>
                <input type="text" id="lid" name="lid" required placeholder="ユーザーID">
            </div>
            <div class="form-group">
                <label for="lpw">パスワード</label>
                <input type="password" id="lpw" name="lpw" required placeholder="パスワード">
            </div>
            <input type="submit" value="ログイン">
        </form>
    </div>
</body>

</html>