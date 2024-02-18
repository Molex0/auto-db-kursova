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
  <p>Отримати дані про розподіл автотранспорту на підприємстві.</p>
  <form method="get" action="">
    <label for="auto">ID авто:</label>
    <input type="text" id="auto" name="auto">
    <button type="submit" name="submit">Пошук</button>
  </form>
  <?php
  require_once 'connection.php';
  $link = mysqli_connect($host, $user, $password, $database)
    or die("Помилка" . mysqli_error($link));
  if (isset($_GET['submit'])) {

    // отримуємо значення полів форми
    $auto = htmlentities(mysqli_real_escape_string($link, $_GET['auto']));

    if (empty($auto)) {
      $sql = "SELECT transport.id, transport.brand,transport.category ,driver.name, brigada.name, garage.address, staff.name
      FROM transport
      JOIN garage ON transport.garage = garage.id
      JOIN staff ON garage.director = staff.id
      JOIN driver ON transport.id = driver.auto
      JOIN brigada ON driver.brigada =  brigada.id";
    } else {
      $sql = "SELECT transport.id, transport.brand,transport.category ,driver.name, brigada.name, garage.address, staff.name
      FROM transport
      JOIN garage ON transport.garage = garage.id
      JOIN staff ON garage.director = staff.id
      JOIN driver ON transport.id = driver.auto
      JOIN brigada ON driver.brigada =  brigada.id
      WHERE transport.id = $auto";
    }

    $result = mysqli_query($link, $sql);

    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "Знайдено записів: " . $rows;
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID Авто</th><th>Марка</th><th>Тип авто</th><th>Водій</th><th>Бригада</th><th>Гараж</th><th>Начальник гаража</th>";
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