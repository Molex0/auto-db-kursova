<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  <style>
    body {
      background: rgb(242, 217, 217);
      font-family: 'Montserrat', sans-serif;
      display: flex;
      justify-content: center;
      flex-direction: column;
    }

    h1 {
      margin: auto;
    }

    p {
      margin: 20px auto;
    }

    form {
      margin: 40px auto;
      width: 300px;
      display: flex;
      flex-direction: column;
    }

    input {
      margin-bottom: 30px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      margin: 20px 0;
    }

    th,
    td {
      text-align: left;
      padding: 8px;
    }

    th {
      background-color: rgb(250, 130, 220);
    }

    tr:nth-child(even) {
      background-color: rgb(250, 200, 220);
    }
  </style>
</head>

<body>
  <h1><a href="index.php">Повернутись до головної</a></h1>
  <p>Отримати дані про підпорядкованість персоналу: робітники-бригадири - майстри - начальники ділянок і цехів.</p>
  <form method="get" action="">
    <label for="type">ID робітника</label>
    <input type="text" id="worker" name="worker">
    <button type="submit" name="submit">Пошук</button>
  </form>
  <?php
  require_once 'connection.php';
  $link = mysqli_connect($host, $user, $password, $database)
    or die("Помилка" . mysqli_error($link));
  if (isset($_GET['submit'])) {

    // отримуємо значення полів форми
    $worker = htmlentities(mysqli_real_escape_string($link, $_GET['worker']));

    if (empty($worker)) {
      $sql = "SELECT s1.id, s1.name,s2.id, s2.name,s3.id, s3.name,s4.id, s4.name
      FROM staff s1
      LEFT JOIN brigada b1 ON b1.id = s1.brigada
      LEFT JOIN staff s2 ON s2.id = b1.brigadir
      LEFT JOIN staff s3 ON s3.id = b1.master
      LEFT JOIN garage b2 ON b2.id = b1.garage
      LEFT JOIN staff s4 ON s4.id = b2.director";
    } else {
      $sql = "SELECT s1.id, s1.name,s2.id, s2.name,s3.id, s3.name,s4.id, s4.name
      FROM staff s1
      LEFT JOIN brigada b1 ON b1.id = s1.brigada
      LEFT JOIN staff s2 ON s2.id = b1.brigadir
      LEFT JOIN staff s3 ON s3.id = b1.master
      LEFT JOIN garage b2 ON b2.id = b1.garage
      LEFT JOIN staff s4 ON s4.id = b2.director
      WHERE s1.id = $worker";
    }

    $result = mysqli_query($link, $sql);

    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "Знайдено записів: " . $rows;
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID Працівника</th><th>Робітник</th><th>ID Бригадира</th><th>Бригадир</th><th>ID Майстра</th><th>Майстер</th><th>ID Начальника</th><th>Начальник</th>";
      for ($i = 0; $i < $rows; ++$i) {
        $row = mysqli_fetch_row($result);
        echo "<tr>";

        for ($j = 0; $j < 8; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
      }
      echo "</table>";
      mysqli_free_result($result);
    } else {
      echo "No results found.";
    }

    // закриваємо з'єднання з базою даних
    mysqli_close($link);
  }
  ?>


</body>

</html>