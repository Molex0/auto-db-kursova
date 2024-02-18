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
  <p>Отримати дані про число використаних для ремонту вказаних вузлів і агрегатів для транспорту певної категорії, окремої марки автотранспорту або конкретної автомашини за вказаний період.</p>
  <form method="get" action="">
    <label for="detail">Деталь:</label>
    <input type="text" id="detail" name="detail">
    <label for="auto">ID Авто:</label>
    <input type="text" id="auto" name="auto">
    <label for="brand">Марка:</label>
    <input type="text" id="brand" name="brand">
    <label for="type">Тип авто:</label>
    <select name="type" id="type">
      <option value="Автобус">Автобус</option>
      <option value="Вантажні">Вантажні</option>
      <option value="Легкові">Легкові</option>
      <option value="Маршрутне таксі">Маршрутне таксі</option>
      <option value="Таксі">Таксі</option>
    </select>
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

    $detail = htmlentities(mysqli_real_escape_string($link, $_GET['detail']));
    $auto = htmlentities(mysqli_real_escape_string($link, $_GET['auto']));
    $brand = htmlentities(mysqli_real_escape_string($link, $_GET['brand']));
    $type = htmlentities(mysqli_real_escape_string($link, $_GET['type']));
    $date1 = htmlentities(mysqli_real_escape_string($link, $_GET['date1']));
    $date2 = htmlentities(mysqli_real_escape_string($link, $_GET['date2']));

    if (!empty($auto)) {
      $sql = "SELECT r.id, t.id, t.brand,t.category, r.date, r.price, r.detail
      FROM repair r
      JOIN transport t ON r.auto = t.id
      WHERE r.detail = '$detail' AND t.id = $auto 
        AND (r.date BETWEEN '$date1' AND '$date2')";
    } elseif (!empty($brand)) {
      $sql = "SELECT r.id, t.id, t.brand,t.category, r.date, r.price, r.detail
      FROM repair r
      JOIN transport t ON r.auto = t.id
      WHERE r.detail = '$detail' AND t.brand = '$brand' 
        AND (r.date BETWEEN '$date1' AND '$date2')";
    } else {
      $sql = "SELECT r.id, t.id, t.brand,t.category, r.date, r.price, r.detail
      FROM repair r
      JOIN transport t ON r.auto = t.id
      WHERE r.detail = '$detail' AND t.category = '$type'
        AND (r.date BETWEEN '$date1' AND '$date2')";
    }



    $result = mysqli_query($link, $sql);

    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "<h4>Знайдено записів: " . $rows . "</h4>";
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID запису</th><th>ID Авто</th><th>Марка</th><th>Тип авто</th><th>Дата</th><th>Ціна</th><th>Деталь</th>";
      for ($i = 0; $i < $rows; ++$i) {
        $row = mysqli_fetch_row($result);
        echo "<tr>";

        for ($j = 0; $j < 7; ++$j) echo "<td>$row[$j]</td>";
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