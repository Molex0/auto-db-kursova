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

    select {
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

    .date {
      display: flex;
      flex-direction: row;
      width: 300px;
      margin: 0 0 30px 0;
    }

    .date>input {
      width: 90px;
    }
  </style>
</head>

<body>
  <h1><a href="index.php">Повернутись до головної</a></h1>
  <p>Отримати відомості про пробіг автотранспорту певної категорії або конкретної автомашини за вказаний день, місяць та рік.</p>
  <form method="get" action="">
    <label for="auto">ID Авто:</label>
    <input type="text" id="auto" name="auto">
    <label for="type">Тип авто:</label>
    <select name="type" id="type">
      <option value="Автобус">Автобус</option>
      <option value="Вантажні">Вантажні</option>
      <option value="Легкові">Легкові</option>
      <option value="Маршрутне таксі">Маршрутне таксі</option>
      <option value="Таксі">Таксі</option>
    </select>
    <label for="date">Дата(dd.mm.yyyy):</label>
    <div class="date">
      <input type="text" id="day" name="day">
      <input type="text" id="month" name="month">
      <input type="text" id="year" name="year">
    </div>
    <button type="submit" name="submit">Пошук</button>
  </form>
  <?php
  require_once 'connection.php';
  $link = mysqli_connect($host, $user, $password, $database)
    or die("Помилка" . mysqli_error($link));
  if (isset($_GET['submit'])) {

    $auto = htmlentities(mysqli_real_escape_string($link, $_GET['auto']));
    $type = htmlentities(mysqli_real_escape_string($link, $_GET['type']));
    $day = htmlentities(mysqli_real_escape_string($link, $_GET['day']));
    $month = htmlentities(mysqli_real_escape_string($link, $_GET['month']));
    $year = htmlentities(mysqli_real_escape_string($link, $_GET['year']));
    if(empty($auto)){
      $sql = "SELECT r.id, t.id, t.brand,t.category, r.date, r.distance
      FROM race r
      JOIN transport t ON r.auto = t.id
      WHERE t.category = '$type' 
        AND YEAR(r.date) = '$year'";
      if (!empty($month)) {
          $sql .= " AND MONTH(r.date) = '$month'";
      }
      elseif (!empty($day)) {
          $sql .= " AND DAY(r.date) = '$day'";
      }
      $sqlSum = "SELECT SUM(r.distance) AS total_distance
      FROM race r
      JOIN transport t ON r.auto = t.id
      WHERE t.category = '$type' 
        AND YEAR(r.date) = '$year'";
      if (!empty($month)) {
          $sql .= " AND MONTH(r.date) = '$month'";
      }
      elseif (!empty($day)) {
          $sql .= " AND DAY(r.date) = '$day'";
      }
    }
    else{
      $sql = "SELECT r.id, t.id, t.brand,t.category, r.date, r.distance
      FROM race r
      JOIN transport t ON r.auto = t.id
      WHERE t.id = $auto
        AND YEAR(r.date) = $year";
      if (!empty($month)) {
          $sql .= " AND MONTH(r.date) = $month";
      }
      if (!empty($day)) {
          $sql .= " AND DAY(r.date) = '$day'";
      }
      $sqlSum= "SELECT SUM(r.distance) AS total_distance
      FROM race r
      JOIN transport t ON r.auto = t.id
      WHERE t.id = $auto
        AND YEAR(r.date) = $year";
      if (!empty($month)) {
          $sql .= " AND MONTH(r.date) = $month";
      }
      if (!empty($day)) {
          $sql .= " AND DAY(r.date) = '$day'";
      }
    }
    $result = mysqli_query($link, $sql);
    $distance = mysqli_query($link, $sqlSum);
    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "<h4>Знайдено записів: " . $rows . "</h4>";
    echo "<h4>Загальний пробіг: " . mysqli_fetch_row($distance)[0] . "км </h4>";
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID запису</th><th>ID Авто</th><th>Марка</th><th>Тип авто</th><th>Дата</th><th>Дистанція</th>";
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