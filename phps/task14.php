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

    select, input {
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
  <p>Отримати дані про роботи, виконані зазначеним фахівцем (зварником, слюсарем тощо) за означений період в цілому і по конкретній автомашині.</p>
  <form method="get" action="">
    <label for="auto">ID Авто:</label>
    <input type="text" id="auto" name="auto">
    <label for="type">Спеціальність:</label>
    <select name="type" id="type">
      <option value="Зварник">Зварник</option>
      <option value="Складальник">Складальник</option>
      <option value="Слюсар">Слюсар</option>
      <option value="Технік">Технік</option>
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

    $auto = htmlentities(mysqli_real_escape_string($link, $_GET['auto']));
    $type = htmlentities(mysqli_real_escape_string($link, $_GET['type']));
    $date1 = htmlentities(mysqli_real_escape_string($link, $_GET['date1']));
    $date2 = htmlentities(mysqli_real_escape_string($link, $_GET['date2']));

    if (!empty($auto)) {
      $sql = "Select s.id, s.name, s.speciality,t.id, t.brand, r.detail, r.date From staff s
      JOIN brigada b ON s.brigada = b.id
      JOIN garage g ON b.garage = g.id
      JOIN transport t ON t.garage = g.id
      JOIN repair r ON  t.id = r.auto
      WHERE s.speciality = '$type' AND t.id = $auto AND r.date BETWEEN '$date1' AND '$date2'
      ORDER BY s.id ASC";
      
    } else {
      $sql = "Select s.id, s.name, s.speciality,t.id, t.brand, r.detail, r.date From staff s
      JOIN brigada b ON s.brigada = b.id
      JOIN garage g ON b.garage = g.id
      JOIN transport t ON t.garage = g.id
      JOIN repair r ON  t.id = r.auto
      WHERE s.speciality = '$type' AND r.date BETWEEN '$date1' AND '$date2'
      ORDER BY s.id ASC";
    }

    $result = mysqli_query($link, $sql);
    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "<h4>Знайдено записів: " . $rows . "</h4>";
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID робітника</th><th>ПІБ</th><th>Спеціальність</th><th>ID Авто</th><th>Марка</th><th>Деталь</th><th>Дата</th>";
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