<?php
session_start();
require_once 'functions.php';
loginCheck();

//２．つぶやき登録SQL作成
$pdo = db_conn();
$stmt = $pdo->prepare('SELECT 
    contents.id as id,
    contents.content as content,
    contents.created_at as date,
    contents.image as image,
    users.name as name
FROM contents JOIN users ON contents.user_id = users.id ');
$status = $stmt->execute();

//３．つぶやき表示
$view = '';
if (!$status) {
    sql_error($stmt);
}
?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>アンケート一覧表示</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body id="main">
    <nav class="navbar">
        <a class="navbar-brand" href="index.php">データ登録画面へ</a>
        <div class="navbar-header user-name">
            <p>ユーザー名：<?= $_SESSION['name'] ?>さん</p>
        </div>
        <form class="logout-form" action="logout.php" method="post" onsubmit="return confirm('本当にログアウトしますか？');">
            <button type="submit" class="logout-button">ログアウト</button>
        </form>
    </nav>
    <main>
        <!-- <div class="container"> -->
        <div>
            <h1>アンケート一覧</h1>
            <!-- <div class="card-container"> -->
            <table>
                <tr>
                    <th>登録日</th>
                    <th>アンケート内容</th>
                    <th>ユーザー名</th>
                    <th>画像</th>
                    <th>編集・削除</th>
                </tr>
                <?php while ($r = $stmt->fetch(PDO::FETCH_ASSOC)) : ?>
                    <tr>
                        <td><?= h($r['date'], ENT_QUOTES, 'UTF-8') ?> :
                        <td>【内容】<?= h($r['content']) ?></td>
                        <td> @ <?= h($r['name']) ?> さん</td>
                        <td>
                            <?php if (!empty($r['image'])): ?>
                                <img src="<?= h($r['image']) ?>" class="image-class" style="max-width:100px; max-height:100px;">
                            <?php endif; ?>
                        </td>
                        <td>
                            <a href="detail.php?id=<?= h($r['id'], ENT_QUOTES, 'UTF-8') ?>">編集</a>
                            <a href="delete.php?id=<?= h($r['id'], ENT_QUOTES, 'UTF-8') ?>" onclick="return confirm('本当に削除しますか？')">削除</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </table>
        </div>
    </main>
    <script src='js/script.js'></script>
</body>

</html>