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

    select,
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
  <p>Отримати відомості про отримання та списання автотехніки за вказаний період.</p>
  <form method="get" action="">
  <div>
      <input type="radio" id="count" name="count" value="активний">
      <label for="max">Отримання</label>
    </div>
    <br>
    <div>
      <input type="radio" id="count" name="count" value="списаний">
      <label for="min">Списання</label>
    </div>
    <label for="date">Дата1(yyyy-mm-dd):</label>
    <input type="text" id="date1" name="date1">
    <label for="date">Дата2(yyyy-mm-dd):</label>
    <input type="text" id="date2" name="date2">
    <button type="submit" name="submit">Пошук</button>
  </form>
  <?php
  require_once 'connection.php';
  $link = mysqli_connect($host, $user, $password, $database)
    or die("Помилка" . mysqli_error($link));
  if (isset($_GET['submit'])) {
    $count = htmlentities(mysqli_real_escape_string($link, $_GET['count']));
    $date1 = htmlentities(mysqli_real_escape_string($link, $_GET['date1']));
    $date2 = htmlentities(mysqli_real_escape_string($link, $_GET['date2']));

    if($count == "активний")
    $sql = "SELECT transport.id, transport.brand,transport.year, transport.start_date, transport.passed, transport.finish_date
      FROM transport
      WHERE transport.start_date BETWEEN '$date1' AND '$date2'";

    elseif($count == "списаний"){
      $sql = "SELECT transport.id, transport.brand,transport.year, transport.start_date, transport.passed, transport.finish_date
      FROM transport
      WHERE transport.finish_date BETWEEN '$date1' AND '$date2'";
    }
    $result = mysqli_query($link, $sql);

    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "<h4>Знайдено записів: " . $rows . "</h4>";
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID Авто</th><th>Марка</th><th>Тип авто</th><th>Дата отрмання</th><th>Статус</th><th>Дата списання</th>";
      for ($i = 0; $i < $rows; ++$i) {
        $row = mysqli_fetch_row($result);
        echo "<tr>";

        for ($j = 0; $j < 6; ++$j) echo "<td>$row[$j]</td>";
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